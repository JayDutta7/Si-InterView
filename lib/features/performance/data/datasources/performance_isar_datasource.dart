import 'package:isar_community/isar.dart';

import '../../../quiz/data/models/question_attempt.dart';
import '../../../quiz/data/models/quiz_session.dart';
import '../../../live_interview/data/models/live_interview_session.dart';
import '../models/performance_snapshot.dart';

class PerformanceIsarDataSource {
  final Isar isar;

  PerformanceIsarDataSource(this.isar);

  /// Watch all attempts reactively from Isar
  Stream<List<QuestionAttempt>> watchQuestionAttempts() {
    return isar.questionAttempts.where().watch(fireImmediately: true);
  }

  /// Watch all quiz sessions reactively from Isar
  Stream<List<QuizSession>> watchQuizSessions() {
    return isar.quizSessions.where().sortByStartedAtDesc().watch(fireImmediately: true);
  }

  /// Watch all live sessions reactively from Isar
  Stream<List<LiveInterviewSession>> watchLiveSessions() {
    return isar.liveInterviewSessions.where().sortByStartedAtDesc().watch(fireImmediately: true);
  }

  /// Watch performance snapshots history reactively
  Stream<List<PerformanceSnapshot>> watchSnapshots({int limit = 30}) {
    return isar.performanceSnapshots
        .where()
        .sortByCalculatedAtDesc()
        .limit(limit)
        .watch(fireImmediately: true);
  }

  /// Get the most recent snapshot from Isar
  Future<PerformanceSnapshot?> getLatestSnapshot() async {
    return await isar.performanceSnapshots
        .where()
        .sortByCalculatedAtDesc()
        .findFirst();
  }

  /// Save a PerformanceSnapshot inside Isar writeTxn
  Future<PerformanceSnapshot> saveSnapshot(PerformanceSnapshot snapshot) async {
    await isar.writeTxn(() async {
      await isar.performanceSnapshots.put(snapshot);
    });
    return snapshot;
  }

  /// Fetch all attempts statically
  Future<List<QuestionAttempt>> getAllAttempts() async {
    return await isar.questionAttempts.where().findAll();
  }

  /// Fetch all sessions statically
  Future<List<QuizSession>> getAllSessions() async {
    return await isar.quizSessions.where().findAll();
  }

  /// Fetch all live sessions statically
  Future<List<LiveInterviewSession>> getAllLiveSessions() async {
    return await isar.liveInterviewSessions.where().findAll();
  }
}
