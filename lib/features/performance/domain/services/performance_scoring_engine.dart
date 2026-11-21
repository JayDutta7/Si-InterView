import 'dart:math';

import '../../../quiz/data/models/question_attempt.dart';
import '../../../quiz/data/models/quiz_session.dart';
import '../../../live_interview/data/models/live_interview_session.dart';
import '../../../live_interview/domain/models/interview_exchange.dart';

enum ReadinessTier {
  foundational('Foundational', '< 50% Readiness', 0.0, 49.9),
  developing('Developing', '50% - 69% Readiness', 50.0, 69.9),
  interviewReady('Interview Ready', '70% - 84% Readiness', 70.0, 84.9),
  seniorLeadStrong('Senior / Lead Strong', '85% - 100% Readiness', 85.0, 100.0);

  final String label;
  final String subtitle;
  final double minScore;
  final double maxScore;

  const ReadinessTier(this.label, this.subtitle, this.minScore, this.maxScore);

  static ReadinessTier fromScore(double score) {
    if (score >= 85.0) return ReadinessTier.seniorLeadStrong;
    if (score >= 70.0) return ReadinessTier.interviewReady;
    if (score >= 50.0) return ReadinessTier.developing;
    return ReadinessTier.foundational;
  }
}

class MetricBreakdown {
  final String id;
  final String name;
  final double score; // 0.0 - 100.0
  final double weight; // contribution to overall score
  final String formulaDescription;
  final List<String> contributingFactors;
  final String improvementTip;
  final String? secondaryMetric;

  const MetricBreakdown({
    required this.id,
    required this.name,
    required this.score,
    required this.weight,
    required this.formulaDescription,
    required this.contributingFactors,
    required this.improvementTip,
    this.secondaryMetric,
  });
}

class TopicMasteryStat {
  final String topic;
  final String section;
  final double masteryScore; // 0.0 - 100.0
  final double rawAccuracy; // 0.0 - 100.0
  final int attemptsCount;
  final double confidenceDamping;
  final bool isWeak;

  const TopicMasteryStat({
    required this.topic,
    required this.section,
    required this.masteryScore,
    required this.rawAccuracy,
    required this.attemptsCount,
    required this.confidenceDamping,
    required this.isWeak,
  });
}

class ComprehensivePerformance {
  final double overallScore; // 0.0 - 100.0
  final ReadinessTier readinessTier;
  final double scoreDelta; // e.g. +3.2 vs previous snapshot
  final MetricBreakdown technicalAccuracy;
  final MetricBreakdown knowledgeDepth;
  final MetricBreakdown communication;
  final MetricBreakdown confidence;
  final MetricBreakdown consistency;
  final MetricBreakdown learningAbility;
  final MetricBreakdown responseTime;
  final double topicMasteryAggregate;
  final List<TopicMasteryStat> topicMasteryList;
  final Map<String, List<TopicMasteryStat>> sectionTopicMastery;
  final int totalQuestionsAnswered;
  final int totalCorrectAnswered;
  final int completedSessions;
  final double avgResponseTimeSeconds;
  final double medianResponseTimeSeconds;
  final double speedScore;
  final List<double> sessionScoreHistory;

  const ComprehensivePerformance({
    required this.overallScore,
    required this.readinessTier,
    required this.scoreDelta,
    required this.technicalAccuracy,
    required this.knowledgeDepth,
    required this.communication,
    required this.confidence,
    required this.consistency,
    required this.learningAbility,
    required this.responseTime,
    required this.topicMasteryAggregate,
    required this.topicMasteryList,
    required this.sectionTopicMastery,
    required this.totalQuestionsAnswered,
    required this.totalCorrectAnswered,
    required this.completedSessions,
    required this.avgResponseTimeSeconds,
    required this.medianResponseTimeSeconds,
    required this.speedScore,
    required this.sessionScoreHistory,
  });

  factory ComprehensivePerformance.empty() {
    return ComprehensivePerformance(
      overallScore: 0.0,
      readinessTier: ReadinessTier.foundational,
      scoreDelta: 0.0,
      technicalAccuracy: const MetricBreakdown(
        id: 'tech_accuracy',
        name: 'Technical Accuracy',
        score: 0.0,
        weight: 0.25,
        formulaDescription: 'MCQ accuracy weighted by difficulty tier + Live turn accuracy',
        contributingFactors: ['No attempts recorded yet'],
        improvementTip: 'Start a practice session or 1-to-1 live interview to begin scoring.',
      ),
      knowledgeDepth: const MetricBreakdown(
        id: 'knowledge_depth',
        name: 'Knowledge Depth',
        score: 0.0,
        weight: 0.18,
        formulaDescription: '0.60 * senior/complex accuracy + 0.25 * topic breadth + 0.15 * depth score',
        contributingFactors: ['Awaiting senior-level or system architecture attempts'],
        improvementTip: 'Target Senior / Tech Lead difficulty and System Architecture sections.',
      ),
      communication: const MetricBreakdown(
        id: 'communication',
        name: 'Communication',
        score: 0.0,
        weight: 0.10,
        formulaDescription: 'Clarity, conciseness, and structured verbal reasoning from live turns',
        contributingFactors: ['No spoken live interview turns recorded yet'],
        improvementTip: 'Engage in a 1-to-1 Live Voice Interview to evaluate spoken communication.',
      ),
      confidence: const MetricBreakdown(
        id: 'confidence',
        name: 'Confidence',
        score: 0.0,
        weight: 0.10,
        formulaDescription: 'Decisive option selection without toggling + steady pacing consistency',
        contributingFactors: ['No attempt pacing telemetry recorded'],
        improvementTip: 'Trust your technical instincts without repeatedly switching choices.',
      ),
      consistency: const MetricBreakdown(
        id: 'consistency',
        name: 'Consistency',
        score: 0.0,
        weight: 0.08,
        formulaDescription: 'Low variance across sessions: 100 - (StdDev * 1.5) with streak damping',
        contributingFactors: ['Need at least 2 completed sessions to establish score variance'],
        improvementTip: 'Complete multiple sessions back-to-back to stabilize your score.',
      ),
      learningAbility: const MetricBreakdown(
        id: 'learning_ability',
        name: 'Learning Ability',
        score: 50.0,
        weight: 0.08,
        formulaDescription: '50 + (Recent - Earlier Accuracy Delta * 1.25) + Weak Topic Recovery Bonus',
        contributingFactors: ['Neutral baseline (50.0) prior to historical revision attempts'],
        improvementTip: 'Retest previously missed topics to demonstrate learning recovery.',
      ),
      responseTime: const MetricBreakdown(
        id: 'response_time',
        name: 'Response Time & Speed',
        score: 0.0,
        weight: 0.06,
        formulaDescription: 'Pacing calibration against difficulty targets; penalties for fast incorrect guessing',
        contributingFactors: ['No timed attempts recorded'],
        improvementTip: 'Aim for a steady 15-30s per question with high accuracy.',
        secondaryMetric: '0.0s avg • 0.0s median',
      ),
      topicMasteryAggregate: 0.0,
      topicMasteryList: const [],
      sectionTopicMastery: const {},
      totalQuestionsAnswered: 0,
      totalCorrectAnswered: 0,
      completedSessions: 0,
      avgResponseTimeSeconds: 0.0,
      medianResponseTimeSeconds: 0.0,
      speedScore: 0.0,
      sessionScoreHistory: const [],
    );
  }
}

/// Pure Dart Deterministic Performance Scoring Engine
class PerformanceScoringEngine {
  PerformanceScoringEngine._();

  static const List<String> _complexKeywords = [
    'coroutine',
    'concurrency',
    'renderobject',
    'element tree',
    'internals',
    'architecture',
    'lru',
    'memory',
    'recomposition',
    'pointer',
    'channel',
    'mutex',
    'thread',
    'subcomposelayout',
    'crdt',
    'trie',
    'isolate',
    'repaintboundary',
    'event loop',
    'microtask',
    'cursor',
    'pagination',
  ];

  /// Calculate all 9 performance metrics deterministically from Isar entities.
  static ComprehensivePerformance calculate({
    required List<QuestionAttempt> attempts,
    required List<QuizSession> sessions,
    required List<LiveInterviewSession> liveSessions,
    double? previousOverallScore,
  }) {
    if (attempts.isEmpty && liveSessions.isEmpty && sessions.isEmpty) {
      return ComprehensivePerformance.empty();
    }

    final totalAttempts = attempts.length;
    final totalCorrect = attempts.where((a) => a.isCorrect).length;
    final completedSessionsCount = sessions.where((s) => s.isCompleted).length;

    // 1. Technical Accuracy (0 - 100)
    final techAccBreakdown = _calculateTechnicalAccuracy(attempts, liveSessions);

    // 2. Knowledge Depth (0 - 100)
    final depthBreakdown = _calculateKnowledgeDepth(attempts, techAccBreakdown.score);

    // 3. Communication (0 - 100)
    final commBreakdown = _calculateCommunication(liveSessions, sessions, techAccBreakdown.score);

    // 4. Confidence (0 - 100)
    final confBreakdown = _calculateConfidence(attempts, liveSessions, techAccBreakdown.score);

    // 5. Consistency (0 - 100)
    final consistencyBreakdown = _calculateConsistency(sessions, liveSessions);

    // 6. Learning Ability (0 - 100)
    final learningBreakdown = _calculateLearningAbility(attempts);

    // 7. Response Time (avgSeconds, medianSeconds, speedScore 0 - 100)
    final timeResult = _calculateResponseTimeMetrics(attempts, liveSessions);

    // 8. Topic Mastery (0 - 100 per topic)
    final topicMasteryResult = _calculateTopicMastery(attempts);

    // 9. Overall Score (Weighted Composite)
    final overall = _calculateOverallScore(
      technicalAccuracy: techAccBreakdown.score,
      knowledgeDepth: depthBreakdown.score,
      topicMastery: topicMasteryResult.aggregateMastery,
      communication: commBreakdown.score,
      confidence: confBreakdown.score,
      consistency: consistencyBreakdown.score,
      learningAbility: learningBreakdown.score,
      responseTimeSpeedScore: timeResult.speedScore,
    );

    final readiness = ReadinessTier.fromScore(overall);
    final delta = previousOverallScore != null ? (overall - previousOverallScore) : 0.0;

    // Session score history for progression graph
    final sessionHistory = <double>[];
    for (final s in sessions.reversed) {
      if (s.isCompleted && s.totalQuestions > 0) {
        sessionHistory.add(_clamp(s.scorePercent));
      }
    }
    for (final l in liveSessions.reversed) {
      if (l.isCompleted && l.totalExchanges > 0) {
        sessionHistory.add(_clamp(l.overallScore * 10.0));
      }
    }

    return ComprehensivePerformance(
      overallScore: _round(overall),
      readinessTier: readiness,
      scoreDelta: _round(delta),
      technicalAccuracy: techAccBreakdown,
      knowledgeDepth: depthBreakdown,
      communication: commBreakdown,
      confidence: confBreakdown,
      consistency: consistencyBreakdown,
      learningAbility: learningBreakdown,
      responseTime: timeResult.breakdown,
      topicMasteryAggregate: _round(topicMasteryResult.aggregateMastery),
      topicMasteryList: topicMasteryResult.topicStats,
      sectionTopicMastery: topicMasteryResult.sectionMap,
      totalQuestionsAnswered: totalAttempts + _extractTotalLiveExchanges(liveSessions),
      totalCorrectAnswered: totalCorrect + _extractCorrectLiveExchanges(liveSessions),
      completedSessions: completedSessionsCount + liveSessions.where((l) => l.isCompleted).length,
      avgResponseTimeSeconds: _round(timeResult.avgSeconds),
      medianResponseTimeSeconds: _round(timeResult.medianSeconds),
      speedScore: _round(timeResult.speedScore),
      sessionScoreHistory: sessionHistory,
    );
  }

  // ===========================================================================
  // 1. Technical Accuracy
  // ===========================================================================
  static MetricBreakdown _calculateTechnicalAccuracy(
    List<QuestionAttempt> attempts,
    List<LiveInterviewSession> liveSessions,
  ) {
    double mcqScore = 0.0;
    double mcqWeightTotal = 0.0;

    for (final a in attempts) {
      double w = 1.0;
      final diff = a.difficulty.toLowerCase();
      if (diff.contains('tech') || diff.contains('lead')) {
        w = 1.25;
      } else if (diff.contains('senior')) {
        w = 1.15;
      }
      mcqWeightTotal += w;
      if (a.isCorrect) {
        mcqScore += (w * 100.0);
      }
    }

    final mcqAccuracy = mcqWeightTotal > 0 ? (mcqScore / mcqWeightTotal) : 0.0;

    // Live turns evaluation
    double liveScoreSum = 0.0;
    int liveTurnsCount = 0;

    for (final live in liveSessions) {
      for (final raw in live.transcript) {
        try {
          final ex = InterviewExchange.deserialize(raw);
          liveTurnsCount++;
          switch (ex.verdict) {
            case AnswerVerdict.right:
              liveScoreSum += 100.0;
              break;
            case AnswerVerdict.partiallyCorrect:
              liveScoreSum += 60.0;
              break;
            case AnswerVerdict.wrong:
              liveScoreSum += 15.0;
              break;
            case AnswerVerdict.pending:
              liveScoreSum += 50.0;
              break;
          }
        } catch (_) {}
      }
    }

    final liveAccuracy = liveTurnsCount > 0 ? (liveScoreSum / liveTurnsCount) : 0.0;

    double finalScore;
    final List<String> factors = [];

    if (attempts.isNotEmpty && liveTurnsCount > 0) {
      finalScore = (mcqAccuracy * 0.65) + (liveAccuracy * 0.35);
      factors.add('MCQ Weighted Accuracy: ${_round(mcqAccuracy)}% across ${attempts.length} items');
      factors.add('Live Spoken Accuracy: ${_round(liveAccuracy)}% across $liveTurnsCount turns');
    } else if (attempts.isNotEmpty) {
      finalScore = mcqAccuracy;
      factors.add('MCQ Weighted Accuracy: ${_round(mcqAccuracy)}% (${attempts.where((a) => a.isCorrect).length}/${attempts.length} correct)');
      factors.add('Difficulty multipliers: Mid 1.0x, Senior 1.15x, Tech Lead 1.25x applied');
    } else if (liveTurnsCount > 0) {
      finalScore = liveAccuracy;
      factors.add('Live Spoken Accuracy: ${_round(liveAccuracy)}% across $liveTurnsCount turns');
    } else {
      finalScore = 0.0;
      factors.add('No technical attempts recorded yet');
    }

    final clamped = _clamp(finalScore);

    return MetricBreakdown(
      id: 'tech_accuracy',
      name: 'Technical Accuracy',
      score: _round(clamped),
      weight: 0.25,
      formulaDescription: 'Weighted MCQ accuracy (Mid 1.0x, Senior 1.15x, Lead 1.25x) + Live Interview turn evaluations',
      contributingFactors: factors,
      improvementTip: clamped >= 80.0
          ? 'Exceptional core accuracy. Maintain this by exploring edge cases in Concurrency and DSA.'
          : 'Focus on reviewing explanations for incorrect answers in your weakest sections.',
    );
  }

  // ===========================================================================
  // 2. Knowledge Depth
  // ===========================================================================
  static MetricBreakdown _calculateKnowledgeDepth(
    List<QuestionAttempt> attempts,
    double fallbackAccuracy,
  ) {
    if (attempts.isEmpty) {
      return const MetricBreakdown(
        id: 'knowledge_depth',
        name: 'Knowledge Depth',
        score: 0.0,
        weight: 0.18,
        formulaDescription: '0.60 * senior/complex accuracy + 0.25 * topic breadth + 0.15 * depth score',
        contributingFactors: ['No questions attempted yet'],
        improvementTip: 'Solve Senior and System Design questions to demonstrate deep architectural proficiency.',
      );
    }

    final complexAttempts = attempts.where((a) {
      final diff = a.difficulty.toLowerCase();
      final sec = a.section.toLowerCase();
      final top = a.topic.toLowerCase();

      final isSeniorOrLead = diff.contains('senior') || diff.contains('lead');
      final isArch = sec.contains('system design') || sec.contains('architecture');
      final hasComplexKeyword = _complexKeywords.any((k) => top.contains(k));

      return isSeniorOrLead || isArch || hasComplexKeyword;
    }).toList();

    double complexAccuracy;
    if (complexAttempts.isNotEmpty) {
      final correctCount = complexAttempts.where((a) => a.isCorrect).length;
      complexAccuracy = (correctCount / complexAttempts.length) * 100.0;
    } else {
      complexAccuracy = fallbackAccuracy * 0.70;
    }

    // Topic breadth coverage (target 10 topics for 100% breadth)
    final uniqueTopics = attempts.map((a) => a.topic).toSet();
    final breadthScore = min(1.0, uniqueTopics.length / 10.0) * 100.0;

    // Explanation depth interaction
    final avgResponseTime = attempts.map((a) => a.responseTimeMs).reduce((a, b) => a + b) / attempts.length;
    final depthBonus = min(100.0, (avgResponseTime / 25000.0) * 100.0);

    final score = (0.60 * complexAccuracy) + (0.25 * breadthScore) + (0.15 * depthBonus);
    final clamped = _clamp(score);

    return MetricBreakdown(
      id: 'knowledge_depth',
      name: 'Knowledge Depth',
      score: _round(clamped),
      weight: 0.18,
      formulaDescription: '0.60 * Senior/Complex Accuracy + 0.25 * Topic Breadth + 0.15 * Depth Engagement',
      contributingFactors: [
        'Complex & Senior attempts: ${complexAttempts.length} (${complexAttempts.where((a) => a.isCorrect).length} correct)',
        'Unique technical topics covered: ${uniqueTopics.length} / 10 target',
        'Complex topic accuracy: ${_round(complexAccuracy)}%',
      ],
      improvementTip: 'Deepen understanding of Flutter internals (RenderObject/Element trees) and Android Coroutine dispatchers.',
    );
  }

  // ===========================================================================
  // 3. Communication
  // ===========================================================================
  static MetricBreakdown _calculateCommunication(
    List<LiveInterviewSession> liveSessions,
    List<QuizSession> quizSessions,
    double technicalAccuracy,
  ) {
    final List<String> factors = [];

    if (liveSessions.isNotEmpty) {
      double totalClarityScore = 0.0;
      int evaluatedTurns = 0;

      for (final live in liveSessions) {
        for (final raw in live.transcript) {
          try {
            final ex = InterviewExchange.deserialize(raw);
            evaluatedTurns++;

            // Turn evaluation score (0-10 -> 0-100)
            final baseScore = ex.score * 10.0;

            // Length efficiency
            final words = ex.candidateAnswer.trim().split(RegExp(r'\s+')).length;
            double lengthEfficiency = 100.0;
            if (words < 12) {
              lengthEfficiency = 40.0; // too terse
            } else if (words < 25) {
              lengthEfficiency = 70.0;
            } else if (words > 220) {
              lengthEfficiency = 80.0; // slightly rambling
            }

            final turnScore = (0.70 * baseScore) + (0.30 * lengthEfficiency);
            totalClarityScore += turnScore;
          } catch (_) {}
        }
      }

      if (evaluatedTurns > 0) {
        final avgScore = totalClarityScore / evaluatedTurns;
        factors.add('Live verbal turns analyzed: $evaluatedTurns');
        factors.add('Spoken answer structure & clarity: ${_round(avgScore)}%');

        return MetricBreakdown(
          id: 'communication',
          name: 'Communication',
          score: _round(_clamp(avgScore)),
          weight: 0.10,
          formulaDescription: '0.70 * Interviewer Clarity Rating + 0.30 * Answer Conciseness & Structure Efficiency',
          contributingFactors: factors,
          improvementTip: 'Structure spoken responses using the STAR method (Situation, Task, Action, Result) for maximum clarity.',
        );
      }
    }

    // Fallback baseline from Quiz engagement
    final completedCount = quizSessions.where((s) => s.isCompleted).length;
    final baseline = _clamp(60.0 + (min(10.0, completedCount.toDouble()) * 2.0) + (technicalAccuracy * 0.15));
    factors.add('MCQ session completion baseline: $completedCount sets completed');
    factors.add('Live spoken interview not yet taken (using calibrated foundation)');

    return MetricBreakdown(
      id: 'communication',
      name: 'Communication',
      score: _round(baseline),
      weight: 0.10,
      formulaDescription: 'Calibrated baseline from session completion discipline + technical engagement',
      contributingFactors: factors,
      improvementTip: 'Take a 1-to-1 Live Voice Interview session to unlock complete verbal fluency scoring.',
    );
  }

  // ===========================================================================
  // 4. Confidence
  // ===========================================================================
  static MetricBreakdown _calculateConfidence(
    List<QuestionAttempt> attempts,
    List<LiveInterviewSession> liveSessions,
    double technicalAccuracy,
  ) {
    if (attempts.isEmpty && liveSessions.isEmpty) {
      return const MetricBreakdown(
        id: 'confidence',
        name: 'Confidence',
        score: 0.0,
        weight: 0.10,
        formulaDescription: 'Decisive option selection without toggling + steady pacing consistency',
        contributingFactors: ['No pacing or choice telemetry recorded'],
        improvementTip: 'Practice choosing answers promptly without second-guessing.',
      );
    }

    final List<String> factors = [];

    // Decision directness: option changes penalty
    int totalOptionChanges = 0;
    for (final a in attempts) {
      totalOptionChanges += a.optionChangesCount;
    }
    final optionHesitationPenalty = min(30.0, totalOptionChanges * 4.0);
    final decisionScore = 100.0 - optionHesitationPenalty;
    factors.add('Decision directness score: ${_round(decisionScore)}% ($totalOptionChanges option changes)');

    // Pacing coefficient of variation
    double pacingStability = 75.0;
    if (attempts.length >= 3) {
      final times = attempts.map((a) => a.responseTimeMs / 1000.0).toList();
      final mean = times.reduce((a, b) => a + b) / times.length;
      final variance = times.map((t) => pow(t - mean, 2)).reduce((a, b) => a + b) / times.length;
      final stdDev = sqrt(variance);
      final cv = mean > 0 ? (stdDev / mean) : 0.0;
      pacingStability = _clamp(100.0 - (cv * 30.0));
      factors.add('Pacing stability: ${_round(pacingStability)}% (CV: ${cv.toStringAsFixed(2)})');
    }

    final score = (0.45 * decisionScore) + (0.35 * pacingStability) + (0.20 * technicalAccuracy);
    final clamped = _clamp(score);

    return MetricBreakdown(
      id: 'confidence',
      name: 'Confidence',
      score: _round(clamped),
      weight: 0.10,
      formulaDescription: '0.45 * Decision Directness + 0.35 * Pacing Stability (CV) + 0.20 * Technical Reinforcement',
      contributingFactors: factors,
      improvementTip: 'Lock in answers promptly once confident; avoid erratic pauses or option switching.',
    );
  }

  // ===========================================================================
  // 5. Consistency
  // ===========================================================================
  static MetricBreakdown _calculateConsistency(
    List<QuizSession> sessions,
    List<LiveInterviewSession> liveSessions,
  ) {
    final scores = <double>[];
    for (final s in sessions) {
      if (s.isCompleted && s.totalQuestions > 0) {
        scores.add(s.scorePercent);
      }
    }
    for (final l in liveSessions) {
      if (l.isCompleted && l.totalExchanges > 0) {
        scores.add(l.overallScore * 10.0);
      }
    }

    if (scores.isEmpty) {
      return const MetricBreakdown(
        id: 'consistency',
        name: 'Consistency',
        score: 0.0,
        weight: 0.08,
        formulaDescription: '100 - (StdDevOfScores * 1.5) with sample confidence damping',
        contributingFactors: ['No completed sessions to measure variance'],
        improvementTip: 'Complete at least two full sessions to measure stability.',
      );
    }

    if (scores.length == 1) {
      return const MetricBreakdown(
        id: 'consistency',
        name: 'Consistency',
        score: 75.0,
        weight: 0.08,
        formulaDescription: 'Initial single-session baseline: 75.0',
        contributingFactors: ['Single session baseline (need 2+ sessions for variance measurement)'],
        improvementTip: 'Complete another session to track variance across runs.',
      );
    }

    final mean = scores.reduce((a, b) => a + b) / scores.length;
    final variance = scores.map((s) => pow(s - mean, 2)).reduce((a, b) => a + b) / scores.length;
    final stdDev = sqrt(variance);

    // Damping factor: scales confidence as session count grows
    final damping = scores.length / (scores.length + 1.0);
    final rawConsistency = 100.0 - (stdDev * 1.5);
    final finalScore = (rawConsistency * damping) + (75.0 * (1.0 - damping));
    final clamped = _clamp(finalScore);

    return MetricBreakdown(
      id: 'consistency',
      name: 'Consistency',
      score: _round(clamped),
      weight: 0.08,
      formulaDescription: '100 - (StdDev * 1.5) with session count damping',
      contributingFactors: [
        'Sessions evaluated: ${scores.length}',
        'Average score: ${_round(mean)}%',
        'Standard deviation: ${stdDev.toStringAsFixed(1)} points',
      ],
      improvementTip: stdDev > 15.0
          ? 'Your performance fluctuates across sessions. Review foundational concepts to ensure uniform results.'
          : 'High stability demonstrated across interview sets.',
    );
  }

  // ===========================================================================
  // 6. Learning Ability
  // ===========================================================================
  static MetricBreakdown _calculateLearningAbility(List<QuestionAttempt> attempts) {
    if (attempts.length < 4) {
      return const MetricBreakdown(
        id: 'learning_ability',
        name: 'Learning Ability',
        score: 50.0,
        weight: 0.08,
        formulaDescription: '50 + (Recent vs. Earlier Accuracy Delta * 1.25) + Recovery Bonus',
        contributingFactors: ['Need at least 4 attempts to establish learning trajectory'],
        improvementTip: 'Continue answering questions to measure retention and improvement curves.',
      );
    }

    final mid = attempts.length ~/ 2;
    final earlier = attempts.sublist(0, mid);
    final recent = attempts.sublist(mid);

    final earlierAcc = (earlier.where((a) => a.isCorrect).length / earlier.length) * 100.0;
    final recentAcc = (recent.where((a) => a.isCorrect).length / recent.length) * 100.0;
    final delta = recentAcc - earlierAcc;

    // Check for topic recovery: missed earlier, correct recently
    final earlierMissedTopics = earlier.where((a) => !a.isCorrect).map((a) => a.topic).toSet();
    final recentCorrectTopics = recent.where((a) => a.isCorrect).map((a) => a.topic).toSet();
    final recoveredCount = earlierMissedTopics.intersection(recentCorrectTopics).length;
    final recoveryBonus = min(20.0, recoveredCount * 6.0);

    final score = 50.0 + (delta * 1.25) + recoveryBonus;
    final clamped = _clamp(score);

    return MetricBreakdown(
      id: 'learning_ability',
      name: 'Learning Ability',
      score: _round(clamped),
      weight: 0.08,
      formulaDescription: '50 + (Recent Accuracy - Earlier Accuracy) * 1.25 + Recovery Bonus',
      contributingFactors: [
        'Earlier half accuracy: ${_round(earlierAcc)}% (${earlier.length} attempts)',
        'Recent half accuracy: ${_round(recentAcc)}% (${recent.length} attempts)',
        'Accuracy progress delta: ${delta >= 0 ? "+" : ""}${_round(delta)}%',
        'Recovered weak topics: $recoveredCount (+${recoveryBonus.toInt()} bonus points)',
      ],
      improvementTip: delta < 0
          ? 'Accuracy dropped in recent attempts. Take a brief break to review explanations before proceeding.'
          : 'Strong learning trajectory! You successfully converted previously missed concepts into correct answers.',
    );
  }

  // ===========================================================================
  // 7. Response Time & Speed Score
  // ===========================================================================
  static ({
    double avgSeconds,
    double medianSeconds,
    double speedScore,
    MetricBreakdown breakdown,
  }) _calculateResponseTimeMetrics(
    List<QuestionAttempt> attempts,
    List<LiveInterviewSession> liveSessions,
  ) {
    final timesInSeconds = <double>[];
    final speedScores = <double>[];

    for (final a in attempts) {
      final s = max(0.5, a.responseTimeMs / 1000.0);
      timesInSeconds.add(s);

      // Calibrate speed score:
      // Fast + Accurate = 90-100
      // Thoughtful + Accurate = 75-89
      // Rushed + Wrong (< 6s) = 20 (penalized guessing!)
      // Moderate + Wrong = 45-50
      if (a.isCorrect) {
        if (s <= 18.0) {
          speedScores.add(95.0);
        } else if (s <= 35.0) {
          speedScores.add(85.0);
        } else if (s <= 60.0) {
          speedScores.add(72.0);
        } else {
          speedScores.add(55.0);
        }
      } else {
        if (s < 6.0) {
          speedScores.add(20.0); // Rushed guessing penalty
        } else if (s <= 30.0) {
          speedScores.add(45.0);
        } else {
          speedScores.add(50.0);
        }
      }
    }

    if (timesInSeconds.isEmpty) {
      return (
        avgSeconds: 0.0,
        medianSeconds: 0.0,
        speedScore: 0.0,
        breakdown: const MetricBreakdown(
          id: 'response_time',
          name: 'Response Time & Speed',
          score: 0.0,
          weight: 0.06,
          formulaDescription: 'Calibrated speed index; penalties applied for fast incorrect guessing',
          contributingFactors: ['No timed attempts recorded yet'],
          improvementTip: 'Aim for a consistent 15-30s per technical question.',
          secondaryMetric: '0.0s avg • 0.0s median',
        ),
      );
    }

    final avg = timesInSeconds.reduce((a, b) => a + b) / timesInSeconds.length;
    final sorted = List<double>.from(timesInSeconds)..sort();
    final median = sorted[sorted.length ~/ 2];
    final avgSpeedScore = speedScores.reduce((a, b) => a + b) / speedScores.length;
    final clampedSpeed = _clamp(avgSpeedScore);

    final breakdown = MetricBreakdown(
      id: 'response_time',
      name: 'Response Time & Speed',
      score: _round(clampedSpeed),
      weight: 0.06,
      formulaDescription: 'Target-calibrated speed index with anti-rushing penalty for rapid wrong answers',
      contributingFactors: [
        'Average response time: ${avg.toStringAsFixed(1)}s',
        'Median response time: ${median.toStringAsFixed(1)}s',
        'Total timed responses: ${timesInSeconds.length}',
      ],
      improvementTip: avg > 45.0
          ? 'Work on question reading efficiency to reduce average response time.'
          : (clampedSpeed < 60.0
              ? 'Avoid rushing through questions without reading all options carefully.'
              : 'Pacing is within optimal interview parameters.'),
      secondaryMetric: '${avg.toStringAsFixed(1)}s avg • ${median.toStringAsFixed(1)}s median',
    );

    return (
      avgSeconds: avg,
      medianSeconds: median,
      speedScore: clampedSpeed,
      breakdown: breakdown,
    );
  }

  // ===========================================================================
  // 8. Topic Mastery
  // ===========================================================================
  static ({
    double aggregateMastery,
    List<TopicMasteryStat> topicStats,
    Map<String, List<TopicMasteryStat>> sectionMap,
  }) _calculateTopicMastery(List<QuestionAttempt> attempts) {
    if (attempts.isEmpty) {
      return (
        aggregateMastery: 0.0,
        topicStats: [],
        sectionMap: {},
      );
    }

    final Map<String, List<QuestionAttempt>> byTopic = {};
    for (final a in attempts) {
      byTopic.putIfAbsent(a.topic, () => []).add(a);
    }

    final List<TopicMasteryStat> stats = [];

    for (final entry in byTopic.entries) {
      final topicName = entry.key;
      final topicAttempts = entry.value..sort((a, b) => a.answeredAt.compareTo(b.answeredAt));
      final section = topicAttempts.first.section;
      final n = topicAttempts.length;

      // Exponential weighting: recent attempts carry higher weight (1.2^i)
      double weightSum = 0.0;
      double weightedCorrect = 0.0;

      for (int i = 0; i < n; i++) {
        final w = pow(1.2, i).toDouble();
        weightSum += w;
        if (topicAttempts[i].isCorrect) {
          weightedCorrect += w;
        }
      }

      final rawAccuracy = weightSum > 0 ? (weightedCorrect / weightSum) * 100.0 : 0.0;

      // Sample size confidence damping: n / (n + 3) prevents 1 attempt from giving 100%
      final damping = n / (n + 3.0);
      final masteryScore = rawAccuracy * damping;
      final isWeak = masteryScore < 60.0;

      stats.add(
        TopicMasteryStat(
          topic: topicName,
          section: section,
          masteryScore: _round(_clamp(masteryScore)),
          rawAccuracy: _round(rawAccuracy),
          attemptsCount: n,
          confidenceDamping: _round(damping * 100.0),
          isWeak: isWeak,
        ),
      );
    }

    stats.sort((a, b) => a.masteryScore.compareTo(b.masteryScore)); // weak first

    final Map<String, List<TopicMasteryStat>> sectionMap = {};
    for (final s in stats) {
      sectionMap.putIfAbsent(s.section, () => []).add(s);
    }

    final aggregateMastery = stats.map((s) => s.masteryScore).reduce((a, b) => a + b) / stats.length;

    return (
      aggregateMastery: _clamp(aggregateMastery),
      topicStats: stats,
      sectionMap: sectionMap,
    );
  }

  // ===========================================================================
  // 9. Overall Score Composite
  // ===========================================================================
  static double _calculateOverallScore({
    required double technicalAccuracy,
    required double knowledgeDepth,
    required double topicMastery,
    required double communication,
    required double confidence,
    required double consistency,
    required double learningAbility,
    required double responseTimeSpeedScore,
  }) {
    final composite = (0.25 * technicalAccuracy) +
        (0.18 * knowledgeDepth) +
        (0.15 * topicMastery) +
        (0.10 * communication) +
        (0.10 * confidence) +
        (0.08 * consistency) +
        (0.08 * learningAbility) +
        (0.06 * responseTimeSpeedScore);

    return _clamp(composite);
  }

  // ===========================================================================
  // Utilities
  // ===========================================================================
  static double _clamp(double val, [double minVal = 0.0, double maxVal = 100.0]) {
    if (val.isNaN || val.isInfinite) return 0.0;
    return val.clamp(minVal, maxVal);
  }

  static double _round(double val) {
    return (val * 10.0).roundToDouble() / 10.0;
  }

  static int _extractTotalLiveExchanges(List<LiveInterviewSession> sessions) {
    int count = 0;
    for (final s in sessions) {
      count += s.totalExchanges;
    }
    return count;
  }

  static int _extractCorrectLiveExchanges(List<LiveInterviewSession> sessions) {
    int count = 0;
    for (final s in sessions) {
      for (final raw in s.transcript) {
        try {
          final ex = InterviewExchange.deserialize(raw);
          if (ex.verdict == AnswerVerdict.right) count++;
        } catch (_) {}
      }
    }
    return count;
  }
}
