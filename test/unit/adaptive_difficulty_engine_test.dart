import 'package:flutter_test/flutter_test.dart';
import 'package:mobileprep_ai/features/adaptive/domain/models/adaptive_state.dart';
import 'package:mobileprep_ai/features/adaptive/domain/models/difficulty_tier.dart';
import 'package:mobileprep_ai/features/adaptive/domain/services/adaptive_difficulty_engine.dart';

void main() {
  group('AdaptiveDifficultyEngine Unit Tests', () {
    test('1. Logistic Probability & K-Factor Decay', () {
      final pMid = AdaptiveDifficultyEngine.calculateExpectedProbability(
        rating: 35.0,
        questionDifficulty: DifficultyTier.mid,
      );
      // Rating 35.0 (s=0.35) vs Mid (dq=0.35) => expected P = 0.50
      expect(pMid, closeTo(0.50, 0.01));

      final pSenior = AdaptiveDifficultyEngine.calculateExpectedProbability(
        rating: 35.0,
        questionDifficulty: DifficultyTier.senior,
      );
      // Rating 35.0 (s=0.35) vs Senior (dq=0.65) => expected P < 0.50
      expect(pSenior, lessThan(0.50));

      final k0 = AdaptiveDifficultyEngine.calculateKFactor(0);
      expect(k0, equals(24.0));

      final k10 = AdaptiveDifficultyEngine.calculateKFactor(10);
      expect(k10, closeTo(10.9, 0.2));

      final k100 = AdaptiveDifficultyEngine.calculateKFactor(100);
      expect(k100, equals(6.0)); // Floor at 6.0
    });

    test('2. Response-Time Modifiers & Fast Wrong Penalty', () {
      final initial = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 35.0,
        currentTier: DifficultyTier.mid,
        attemptsCount: 0,
        questionsAtCurrentTier: 0,
        lastUpdatedAt: DateTime.now(),
      );

      // Fast & Accurate (<= 0.6 * 25000ms = 15000ms) -> 1.15x boost
      final fastAccState = AdaptiveDifficultyEngine.processAttempt(
        currentState: initial,
        isCorrect: true,
        responseTimeMs: 10000,
      );
      expect(fastAccState.rating, greaterThan(initial.rating));

      // Slow & Accurate (>= 2.0 * 25000ms = 50000ms) -> 0.85x modifier
      final slowAccState = AdaptiveDifficultyEngine.processAttempt(
        currentState: initial,
        isCorrect: true,
        responseTimeMs: 55000,
      );
      expect(slowAccState.rating, greaterThan(initial.rating));
      expect(fastAccState.rating, greaterThan(slowAccState.rating));

      // Fast Wrong Guess (< 4000ms) -> 1.15x penalty multiplier on drop
      final fastWrongState = AdaptiveDifficultyEngine.processAttempt(
        currentState: initial,
        isCorrect: false,
        responseTimeMs: 2000,
      );

      final normalWrongState = AdaptiveDifficultyEngine.processAttempt(
        currentState: initial,
        isCorrect: false,
        responseTimeMs: 20000,
      );

      expect(fastWrongState.rating, lessThan(normalWrongState.rating));
    });

    test('3. Cooldown Rule (questionsAtCurrentTier < 2 prevents tier shift)', () {
      final stateAt45 = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 41.0,
        currentTier: DifficultyTier.mid,
        attemptsCount: 5,
        questionsAtCurrentTier: 0, // < 2 questions at current tier!
        lastUpdatedAt: DateTime.now(),
      );

      // Answer correctly -> Rating pushes past 42.0 (Mid -> Senior threshold)
      final nextState = AdaptiveDifficultyEngine.processAttempt(
        currentState: stateAt45,
        isCorrect: true,
        responseTimeMs: 15000,
      );

      expect(nextState.rating, greaterThanOrEqualTo(42.0));
      // Cooldown rule: questionsAtCurrentTier was 0 before attempt, now 1 (< 2 required)
      expect(nextState.currentTier, equals(DifficultyTier.mid));
      expect(nextState.questionsAtCurrentTier, equals(1));
    });

    test('4. Tier Step-Up Hysteresis (Mid -> Senior -> Tech Lead)', () {
      final stateReadyToLevelUp = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 40.0,
        currentTier: DifficultyTier.mid,
        attemptsCount: 5,
        questionsAtCurrentTier: 1, // Will become 2 upon processing attempt
        lastUpdatedAt: DateTime.now(),
      );

      final level1 = AdaptiveDifficultyEngine.processAttempt(
        currentState: stateReadyToLevelUp,
        isCorrect: true,
        responseTimeMs: 12000,
      );

      expect(level1.rating, greaterThanOrEqualTo(42.0));
      expect(level1.currentTier, equals(DifficultyTier.senior));
      expect(level1.lastFeedback, contains('Level Up -> Senior'));
      expect(level1.questionsAtCurrentTier, equals(0));

      // Push from Senior to Tech Lead (threshold >= 76.0)
      final stateReadyForLead = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 74.0,
        currentTier: DifficultyTier.senior,
        attemptsCount: 10,
        questionsAtCurrentTier: 1,
        lastUpdatedAt: DateTime.now(),
      );

      final level2 = AdaptiveDifficultyEngine.processAttempt(
        currentState: stateReadyForLead,
        isCorrect: true,
        responseTimeMs: 15000,
      );

      expect(level2.rating, greaterThanOrEqualTo(76.0));
      expect(level2.currentTier, equals(DifficultyTier.techLead));
      expect(level2.lastFeedback, contains('Level Up -> Tech Lead'));
    });

    test('5. Tier Step-Down Hysteresis (Tech Lead -> Senior -> Mid)', () {
      final leadStateAtRisk = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 70.0,
        currentTier: DifficultyTier.techLead,
        attemptsCount: 15,
        questionsAtCurrentTier: 1,
        lastUpdatedAt: DateTime.now(),
      );

      // Wrong answer drops rating <= 68.0 -> Steps down to Senior
      final stepDown1 = AdaptiveDifficultyEngine.processAttempt(
        currentState: leadStateAtRisk,
        isCorrect: false,
        responseTimeMs: 25000,
      );

      expect(stepDown1.rating, lessThanOrEqualTo(68.0));
      expect(stepDown1.currentTier, equals(DifficultyTier.senior));
      expect(stepDown1.lastFeedback, contains('Stepping Down -> Senior'));

      final seniorStateAtRisk = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 35.0,
        currentTier: DifficultyTier.senior,
        attemptsCount: 20,
        questionsAtCurrentTier: 1,
        lastUpdatedAt: DateTime.now(),
      );

      // Wrong answer drops rating <= 34.0 -> Steps down to Mid
      final stepDown2 = AdaptiveDifficultyEngine.processAttempt(
        currentState: seniorStateAtRisk,
        isCorrect: false,
        responseTimeMs: 20000,
      );

      expect(stepDown2.rating, lessThanOrEqualTo(34.0));
      expect(stepDown2.currentTier, equals(DifficultyTier.mid));
      expect(stepDown2.lastFeedback, contains('Stepping Down -> Mid'));
    });

    test('6. Rating Clamping (0.0 to 100.0)', () {
      final stateAtZero = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 1.0,
        currentTier: DifficultyTier.mid,
        attemptsCount: 50,
        questionsAtCurrentTier: 5,
        lastUpdatedAt: DateTime.now(),
      );

      final dropped = AdaptiveDifficultyEngine.processAttempt(
        currentState: stateAtZero,
        isCorrect: false,
        responseTimeMs: 1000,
      );

      expect(dropped.rating, equals(0.0));

      final stateAtMax = AdaptiveState(
        scopeKey: 'Flutter & Dart',
        rating: 99.5,
        currentTier: DifficultyTier.techLead,
        attemptsCount: 50,
        questionsAtCurrentTier: 5,
        lastUpdatedAt: DateTime.now(),
      );

      final maxed = AdaptiveDifficultyEngine.processAttempt(
        currentState: stateAtMax,
        isCorrect: true,
        responseTimeMs: 10000,
      );

      expect(maxed.rating, equals(100.0));
    });
  });
}
