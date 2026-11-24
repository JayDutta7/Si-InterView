import 'dart:math';

import '../models/adaptive_state.dart';
import '../models/difficulty_tier.dart';

/// Pure Dart Adaptive Difficulty Engine using Logistic Elo + Response Time Modifiers + Hysteresis
class AdaptiveDifficultyEngine {
  AdaptiveDifficultyEngine._();

  /// Calculate the expected correctness probability P(correct) = 1 / (1 + e^(-4.5 * (s - dq)))
  static double calculateExpectedProbability({
    required double rating,
    required DifficultyTier questionDifficulty,
  }) {
    final s = (rating / 100.0).clamp(0.0, 1.0);
    final dq = questionDifficulty.questionWeight;
    final exponent = -4.5 * (s - dq);
    return 1.0 / (1.0 + exp(exponent));
  }

  /// Calculate adaptive K-factor: K = max(6.0, 24.0 / (1 + 0.12 * n))
  static double calculateKFactor(int attemptsCount) {
    final k = 24.0 / (1.0 + (0.12 * attemptsCount));
    return max(6.0, k);
  }

  /// Process an attempt and return the new updated AdaptiveState
  static AdaptiveState processAttempt({
    required AdaptiveState currentState,
    required bool isCorrect,
    required int responseTimeMs,
    DifficultyTier? questionDifficultyOverride,
  }) {
    final questionTier = questionDifficultyOverride ?? currentState.currentTier;
    final targetTimeMs = questionTier.targetResponseTimeMs;

    // 1. Logistic expected probability
    final pExpected = calculateExpectedProbability(
      rating: currentState.rating,
      questionDifficulty: questionTier,
    );

    // 2. K-Factor
    final kFactor = calculateKFactor(currentState.attemptsCount);

    // 3. Response time speed modifier
    double speedModifier = 1.0;
    if (isCorrect && responseTimeMs <= (0.6 * targetTimeMs)) {
      speedModifier = 1.15; // Fast & accurate boost
    } else if (responseTimeMs >= (2.0 * targetTimeMs)) {
      speedModifier = 0.85; // Slow response dampener
    }

    // 4. Fast wrong penalty (< 4000ms guessing penalty)
    double fastWrongPenalty = 1.0;
    if (!isCorrect && responseTimeMs < 4000) {
      fastWrongPenalty = 1.15;
    }

    // 5. Score delta calculation
    final actualScore = isCorrect ? 1.0 : 0.0;
    final rawDelta = kFactor * (actualScore - pExpected);

    double finalDelta;
    if (rawDelta >= 0) {
      finalDelta = rawDelta * speedModifier;
    } else {
      finalDelta = rawDelta * speedModifier * fastWrongPenalty;
    }

    final newRating = (currentState.rating + finalDelta).clamp(0.0, 100.0);
    final newAttemptsCount = currentState.attemptsCount + 1;
    final newQuestionsAtTier = currentState.questionsAtCurrentTier + 1;

    // 6. Tier Hysteresis & Cooldown Evaluation
    DifficultyTier newTier = currentState.currentTier;
    int updatedQuestionsAtTier = newQuestionsAtTier;
    String feedback = 'Calibrating -> ${currentState.currentTier.label}';

    // Cooldown rule: require at least 2 questions at current tier before shifting
    if (newQuestionsAtTier >= 2) {
      switch (currentState.currentTier) {
        case DifficultyTier.mid:
          if (newRating >= 42.0) {
            newTier = DifficultyTier.senior;
            updatedQuestionsAtTier = 0;
            feedback = 'Level Up -> Senior';
          }
          break;

        case DifficultyTier.senior:
          if (newRating >= 76.0) {
            newTier = DifficultyTier.techLead;
            updatedQuestionsAtTier = 0;
            feedback = 'Level Up -> Tech Lead';
          } else if (newRating <= 34.0) {
            newTier = DifficultyTier.mid;
            updatedQuestionsAtTier = 0;
            feedback = 'Stepping Down -> Mid';
          }
          break;

        case DifficultyTier.techLead:
          if (newRating <= 68.0) {
            newTier = DifficultyTier.senior;
            updatedQuestionsAtTier = 0;
            feedback = 'Stepping Down -> Senior';
          }
          break;
      }
    }

    return AdaptiveState(
      scopeKey: currentState.scopeKey,
      rating: _round(newRating),
      currentTier: newTier,
      attemptsCount: newAttemptsCount,
      questionsAtCurrentTier: updatedQuestionsAtTier,
      lastUpdatedAt: DateTime.now(),
      lastFeedback: feedback,
    );
  }

  static double _round(double val) {
    return (val * 10.0).roundToDouble() / 10.0;
  }
}
