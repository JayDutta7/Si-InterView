import 'package:isar_community/isar.dart';

import '../../quiz/data/models/question_attempt.dart';
import '../../quiz/data/models/quiz_session.dart';

class SectionStats {
  final String section;
  final int totalAttempts;
  final int correctAttempts;
  final double accuracy;

  const SectionStats({
    required this.section,
    required this.totalAttempts,
    required this.correctAttempts,
    required this.accuracy,
  });
}

class TopicStats {
  final String topic;
  final String section;
  final int totalAttempts;
  final int correctAttempts;
  final double accuracy;

  const TopicStats({
    required this.topic,
    required this.section,
    required this.totalAttempts,
    required this.correctAttempts,
    required this.accuracy,
  });
}

class OverallAnalytics {
  final int totalQuestionsAnswered;
  final int totalCorrectAnswered;
  final double overallAccuracy;
  final int completedSessionsCount;
  final List<SectionStats> sectionBreakdown;
  final List<TopicStats> weakestTopics;

  const OverallAnalytics({
    required this.totalQuestionsAnswered,
    required this.totalCorrectAnswered,
    required this.overallAccuracy,
    required this.completedSessionsCount,
    required this.sectionBreakdown,
    required this.weakestTopics,
  });

  factory OverallAnalytics.empty() {
    return const OverallAnalytics(
      totalQuestionsAnswered: 0,
      totalCorrectAnswered: 0,
      overallAccuracy: 0.0,
      completedSessionsCount: 0,
      sectionBreakdown: [],
      weakestTopics: [],
    );
  }
}

class AnalyticsIsarDataSource {
  final Isar isar;

  AnalyticsIsarDataSource(this.isar);

  /// Watch all question attempts reactively from Isar
  Stream<List<QuestionAttempt>> watchAllAttempts() {
    return isar.questionAttempts.where().watch(fireImmediately: true);
  }

  /// Watch all sessions reactively from Isar
  Stream<List<QuizSession>> watchAllSessions() {
    return isar.quizSessions.where().sortByStartedAtDesc().watch(fireImmediately: true);
  }

  /// Watch all attempts and sessions combined into OverallAnalytics
  Stream<OverallAnalytics> watchOverallAnalytics() {
    // Watch attempts and compute statistics reactively
    return isar.questionAttempts.where().watch(fireImmediately: true).asyncMap((attempts) async {
      final sessions = await isar.quizSessions.where().findAll();
      final completedSessions = sessions.where((s) => s.isCompleted).length;

      if (attempts.isEmpty) {
        return OverallAnalytics(
          totalQuestionsAnswered: 0,
          totalCorrectAnswered: 0,
          overallAccuracy: 0.0,
          completedSessionsCount: completedSessions,
          sectionBreakdown: [],
          weakestTopics: [],
        );
      }

      final total = attempts.length;
      final correct = attempts.where((a) => a.isCorrect).length;
      final accuracy = total > 0 ? (correct / total) * 100.0 : 0.0;

      // Section breakdown
      final Map<String, List<QuestionAttempt>> sectionMap = {};
      for (final a in attempts) {
        sectionMap.putIfAbsent(a.section, () => []).add(a);
      }

      final sectionBreakdown = sectionMap.entries.map((entry) {
        final secTotal = entry.value.length;
        final secCorrect = entry.value.where((a) => a.isCorrect).length;
        final secAccuracy = secTotal > 0 ? (secCorrect / secTotal) * 100.0 : 0.0;
        return SectionStats(
          section: entry.key,
          totalAttempts: secTotal,
          correctAttempts: secCorrect,
          accuracy: secAccuracy,
        );
      }).toList()
        ..sort((a, b) => b.totalAttempts.compareTo(a.totalAttempts));

      // Topic stats
      final Map<String, List<QuestionAttempt>> topicMap = {};
      for (final a in attempts) {
        topicMap.putIfAbsent(a.topic, () => []).add(a);
      }

      final allTopicStats = topicMap.entries.map((entry) {
        final topTotal = entry.value.length;
        final topCorrect = entry.value.where((a) => a.isCorrect).length;
        final topAccuracy = topTotal > 0 ? (topCorrect / topTotal) * 100.0 : 0.0;
        final sectionName = entry.value.first.section;
        return TopicStats(
          topic: entry.key,
          section: sectionName,
          totalAttempts: topTotal,
          correctAttempts: topCorrect,
          accuracy: topAccuracy,
        );
      }).toList();

      // Sort weakest topics by lowest accuracy, then by total attempts desc
      final weakestTopics = allTopicStats
          .where((t) => t.accuracy < 100.0) // topics with at least one error
          .toList()
        ..sort((a, b) {
          final comp = a.accuracy.compareTo(b.accuracy);
          if (comp != 0) return comp;
          return b.totalAttempts.compareTo(a.totalAttempts);
        });

      // If all answered 100% or empty, show all sorted by lowest accuracy
      final finalWeakest = weakestTopics.isNotEmpty
          ? weakestTopics.take(5).toList()
          : allTopicStats.take(5).toList();

      return OverallAnalytics(
        totalQuestionsAnswered: total,
        totalCorrectAnswered: correct,
        overallAccuracy: accuracy,
        completedSessionsCount: completedSessions,
        sectionBreakdown: sectionBreakdown,
        weakestTopics: finalWeakest,
      );
    });
  }
}
