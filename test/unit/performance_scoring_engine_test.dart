import 'package:flutter_test/flutter_test.dart';
import 'package:mobileprep_ai/features/performance/domain/services/performance_scoring_engine.dart';
import 'package:mobileprep_ai/features/quiz/data/models/question_attempt.dart';
import 'package:mobileprep_ai/features/quiz/data/models/quiz_session.dart';
import 'package:mobileprep_ai/features/live_interview/data/models/live_interview_session.dart';
import 'package:mobileprep_ai/features/live_interview/domain/models/interview_exchange.dart';

void main() {
  group('PerformanceScoringEngine 9 Algorithmic Metrics Tests', () {
    test('returns empty performance with neutral baselines when no attempts exist', () {
      final perf = PerformanceScoringEngine.calculate(
        attempts: [],
        sessions: [],
        liveSessions: [],
      );

      expect(perf.overallScore, equals(0.0));
      expect(perf.readinessTier, equals(ReadinessTier.foundational));
      expect(perf.learningAbility.score, equals(50.0)); // neutral baseline
      expect(perf.totalQuestionsAnswered, equals(0));
    });

    test('1. Technical Accuracy weights difficulty tiers (Lead > Senior > Mid)', () {
      final midAttempt = QuestionAttempt()
        ..sessionId = 's1'
        ..questionRecordId = 1
        ..questionHash = 'h1'
        ..questionText = 'Mid question'
        ..options = ['A', 'B', 'C', 'D']
        ..section = 'Flutter & Dart'
        ..topic = 'Widgets'
        ..selectedIndex = 0
        ..correctIndex = 0
        ..isCorrect = true
        ..explanation = 'Good'
        ..answeredAt = DateTime.now()
        ..responseTimeMs = 15000
        ..difficulty = 'Mid';

      final leadAttempt = QuestionAttempt()
        ..sessionId = 's1'
        ..questionRecordId = 2
        ..questionHash = 'h2'
        ..questionText = 'Lead question'
        ..options = ['A', 'B', 'C', 'D']
        ..section = 'Flutter & Dart'
        ..topic = 'RenderObjects'
        ..selectedIndex = 1
        ..correctIndex = 0
        ..isCorrect = false
        ..explanation = 'Missed'
        ..answeredAt = DateTime.now()
        ..responseTimeMs = 25000
        ..difficulty = 'Tech Lead';

      final perf = PerformanceScoringEngine.calculate(
        attempts: [midAttempt, leadAttempt],
        sessions: [],
        liveSessions: [],
      );

      // Total weights: 1.0 (Mid) + 1.25 (Lead) = 2.25.
      // Correct weight: 1.0 * 100 = 100.
      // Expected accuracy = 100 / 2.25 = 44.4%
      expect(perf.technicalAccuracy.score, closeTo(44.4, 0.5));
    });

    test('2. Knowledge Depth combines senior/complex accuracy, breadth, and depth', () {
      final attempts = [
        QuestionAttempt()
          ..sessionId = 's1'
          ..questionRecordId = 1
          ..questionHash = 'h1'
          ..questionText = 'Concurrency in Kotlin'
          ..options = ['A', 'B', 'C', 'D']
          ..section = 'Native Android (Kotlin, Coroutines & Compose)'
          ..topic = 'Coroutine Dispatchers'
          ..selectedIndex = 0
          ..correctIndex = 0
          ..isCorrect = true
          ..explanation = 'Correct'
          ..answeredAt = DateTime.now()
          ..responseTimeMs = 20000
          ..difficulty = 'Senior',
        QuestionAttempt()
          ..sessionId = 's1'
          ..questionRecordId = 2
          ..questionHash = 'h2'
          ..questionText = 'Cache design'
          ..options = ['A', 'B', 'C', 'D']
          ..section = 'System Design & Architecture'
          ..topic = 'LRU Cache Design'
          ..selectedIndex = 0
          ..correctIndex = 0
          ..isCorrect = true
          ..explanation = 'Correct'
          ..answeredAt = DateTime.now()
          ..responseTimeMs = 25000
          ..difficulty = 'Tech Lead',
      ];

      final perf = PerformanceScoringEngine.calculate(
        attempts: attempts,
        sessions: [],
        liveSessions: [],
      );

      expect(perf.knowledgeDepth.score, greaterThanOrEqualTo(60.0));
      expect(perf.knowledgeDepth.contributingFactors.isNotEmpty, isTrue);
    });

    test('3. Communication evaluates live turns structure and conciseness', () {
      final exchange = InterviewExchange(
        turnIndex: 1,
        question: 'Explain how Flutter renders a frame.',
        candidateAnswer:
            'When a frame is scheduled, the engine triggers the window onDrawFrame callback. Flutter then traverses the BuildOwner to rebuild dirty elements, runs layout on the RenderObject tree to calculate sizes and positions, executes paint to generate display lists, and composites layers to send to the Impeller rasterizer.',
        verdict: AnswerVerdict.right,
        feedback: 'Superb structured and detailed answer.',
        score: 9.5,
        timestamp: DateTime.now(),
      );

      final liveSession = LiveInterviewSession()
        ..sessionId = 'live-1'
        ..topic = 'Flutter & Dart'
        ..difficulty = 'Senior'
        ..startedAt = DateTime.now()
        ..completedAt = DateTime.now()
        ..totalExchanges = 1
        ..overallScore = 9.5
        ..feedbackSummary = 'Great'
        ..transcript = [exchange.serialize()]
        ..isCompleted = true;

      final perf = PerformanceScoringEngine.calculate(
        attempts: [],
        sessions: [],
        liveSessions: [liveSession],
      );

      expect(perf.communication.score, greaterThanOrEqualTo(85.0));
    });

    test('4. Confidence penalizes excessive option switching and erratic pacing', () {
      final hesitantAttempt = QuestionAttempt()
        ..sessionId = 's1'
        ..questionRecordId = 1
        ..questionHash = 'h1'
        ..questionText = 'Question'
        ..options = ['A', 'B', 'C', 'D']
        ..section = 'DSA & Problem Solving'
        ..topic = 'Trie'
        ..selectedIndex = 0
        ..correctIndex = 0
        ..isCorrect = true
        ..explanation = 'Good'
        ..answeredAt = DateTime.now()
        ..responseTimeMs = 45000
        ..difficulty = 'Senior'
        ..optionChangesCount = 4; // changed 4 times before locking in

      final perf = PerformanceScoringEngine.calculate(
        attempts: [hesitantAttempt],
        sessions: [],
        liveSessions: [],
      );

      expect(perf.confidence.score, lessThan(85.0));
    });

    test('5. Consistency measures low variance across completed sessions with damping', () {
      final s1 = QuizSession()
        ..sessionId = 's1'
        ..title = 'Set 1'
        ..sections = ['Flutter & Dart']
        ..difficulty = 'Senior'
        ..startedAt = DateTime.now()
        ..totalQuestions = 5
        ..correctCount = 4
        ..scorePercent = 80.0
        ..isCompleted = true;

      final s2 = QuizSession()
        ..sessionId = 's2'
        ..title = 'Set 2'
        ..sections = ['Flutter & Dart']
        ..difficulty = 'Senior'
        ..startedAt = DateTime.now()
        ..totalQuestions = 5
        ..correctCount = 4
        ..scorePercent = 80.0
        ..isCompleted = true;

      final perf = PerformanceScoringEngine.calculate(
        attempts: [],
        sessions: [s1, s2],
        liveSessions: [],
      );

      // With zero stdDev across 2 sessions (80.0 and 80.0), consistency is high
      expect(perf.consistency.score, greaterThan(80.0));
    });

    test('6. Learning Ability awards recovery bonus when previously missed topics are corrected', () {
      final attempts = [
        // Earlier half: missed Concurrency
        QuestionAttempt()
          ..sessionId = 's1'
          ..questionRecordId = 1
          ..questionHash = 'h1'
          ..questionText = 'Q1'
          ..options = ['A', 'B', 'C', 'D']
          ..section = 'Native Android'
          ..topic = 'Coroutines'
          ..selectedIndex = 1
          ..correctIndex = 0
          ..isCorrect = false
          ..explanation = 'Missed'
          ..answeredAt = DateTime.now().subtract(const Duration(minutes: 10))
          ..responseTimeMs = 15000,
        QuestionAttempt()
          ..sessionId = 's1'
          ..questionRecordId = 2
          ..questionHash = 'h2'
          ..questionText = 'Q2'
          ..options = ['A', 'B', 'C', 'D']
          ..section = 'Flutter & Dart'
          ..topic = 'Widgets'
          ..selectedIndex = 1
          ..correctIndex = 0
          ..isCorrect = false
          ..explanation = 'Missed'
          ..answeredAt = DateTime.now().subtract(const Duration(minutes: 8))
          ..responseTimeMs = 15000,
        // Recent half: mastered Coroutines & Widgets!
        QuestionAttempt()
          ..sessionId = 's2'
          ..questionRecordId = 3
          ..questionHash = 'h3'
          ..questionText = 'Q3'
          ..options = ['A', 'B', 'C', 'D']
          ..section = 'Native Android'
          ..topic = 'Coroutines'
          ..selectedIndex = 0
          ..correctIndex = 0
          ..isCorrect = true
          ..explanation = 'Correct'
          ..answeredAt = DateTime.now().subtract(const Duration(minutes: 5))
          ..responseTimeMs = 18000,
        QuestionAttempt()
          ..sessionId = 's2'
          ..questionRecordId = 4
          ..questionHash = 'h4'
          ..questionText = 'Q4'
          ..options = ['A', 'B', 'C', 'D']
          ..section = 'Flutter & Dart'
          ..topic = 'Widgets'
          ..selectedIndex = 0
          ..correctIndex = 0
          ..isCorrect = true
          ..explanation = 'Correct'
          ..answeredAt = DateTime.now()
          ..responseTimeMs = 18000,
      ];

      final perf = PerformanceScoringEngine.calculate(
        attempts: attempts,
        sessions: [],
        liveSessions: [],
      );

      // Earlier accuracy: 0%, Recent accuracy: 100%. Delta: +100%. Plus recovery bonus!
      expect(perf.learningAbility.score, greaterThanOrEqualTo(80.0));
    });

    test('7. Response Time penalizes rushed wrong guessing', () {
      final rushedWrong = QuestionAttempt()
        ..sessionId = 's1'
        ..questionRecordId = 1
        ..questionHash = 'h1'
        ..questionText = 'Q1'
        ..options = ['A', 'B', 'C', 'D']
        ..section = 'DSA'
        ..topic = 'LRU'
        ..selectedIndex = 1
        ..correctIndex = 0
        ..isCorrect = false
        ..explanation = 'Missed'
        ..answeredAt = DateTime.now()
        ..responseTimeMs = 1200; // 1.2 seconds! Rushed guess

      final perf = PerformanceScoringEngine.calculate(
        attempts: [rushedWrong],
        sessions: [],
        liveSessions: [],
      );

      expect(perf.speedScore, lessThanOrEqualTo(25.0));
    });

    test('8. Topic Mastery applies exponential weighting and sample size damping', () {
      // 1 single correct attempt: damping n/(n+3) = 1/4 = 0.25
      final singleAttempt = QuestionAttempt()
        ..sessionId = 's1'
        ..questionRecordId = 1
        ..questionHash = 'h1'
        ..questionText = 'Q1'
        ..options = ['A', 'B', 'C', 'D']
        ..section = 'Flutter & Dart'
        ..topic = 'Widgets'
        ..selectedIndex = 0
        ..correctIndex = 0
        ..isCorrect = true
        ..explanation = 'Correct'
        ..answeredAt = DateTime.now()
        ..responseTimeMs = 15000;

      final perf1 = PerformanceScoringEngine.calculate(
        attempts: [singleAttempt],
        sessions: [],
        liveSessions: [],
      );

      // Damped mastery should be around 25% rather than a false 100%
      expect(perf1.topicMasteryList.first.masteryScore, closeTo(25.0, 1.0));
      expect(perf1.topicMasteryList.first.isWeak, isTrue);
    });

    test('9. Overall Score correctly maps into ReadinessTier', () {
      expect(ReadinessTier.fromScore(92.0), equals(ReadinessTier.seniorLeadStrong));
      expect(ReadinessTier.fromScore(78.5), equals(ReadinessTier.interviewReady));
      expect(ReadinessTier.fromScore(62.0), equals(ReadinessTier.developing));
      expect(ReadinessTier.fromScore(35.0), equals(ReadinessTier.foundational));
    });
  });
}
