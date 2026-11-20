import 'package:isar_community/isar.dart';

import '../models/question_attempt.dart';
import '../models/question_record.dart';
import '../models/quiz_session.dart';

class QuizIsarDataSource {
  final Isar isar;

  QuizIsarDataSource(this.isar);

  /// Check if question hash exists in Isar
  Future<QuestionRecord?> getQuestionByHash(String hash) async {
    return await isar.questionRecords
        .filter()
        .questionHashEqualTo(hash)
        .findFirst();
  }

  /// Save or update a seen QuestionRecord
  Future<void> saveQuestionRecord(QuestionRecord record) async {
    await isar.writeTxn(() async {
      await isar.questionRecords.put(record);
    });
  }

  /// Bulk save QuestionRecords in one writeTxn
  Future<void> saveQuestionRecords(List<QuestionRecord> records) async {
    await isar.writeTxn(() async {
      await isar.questionRecords.putAll(records);
    });
  }

  /// Get recently seen questions to supply context to Gemini anti-repeat prompt
  Future<List<QuestionRecord>> getRecentQuestionRecords({int limit = 30}) async {
    return await isar.questionRecords
        .where()
        .sortByFirstSeenAtDesc()
        .limit(limit)
        .findAll();
  }

  /// Create a new QuizSession
  Future<QuizSession> createQuizSession(QuizSession session) async {
    await isar.writeTxn(() async {
      await isar.quizSessions.put(session);
    });
    return session;
  }

  /// Update an existing QuizSession (e.g. on question answer or session completion)
  Future<void> updateQuizSession(QuizSession session) async {
    await isar.writeTxn(() async {
      await isar.quizSessions.put(session);
    });
  }

  /// Save QuestionAttempt inside writeTxn
  Future<QuestionAttempt> saveQuestionAttempt(QuestionAttempt attempt) async {
    await isar.writeTxn(() async {
      await isar.questionAttempts.put(attempt);
    });
    return attempt;
  }

  /// Watch single quiz session reactively from Isar
  Stream<QuizSession?> watchQuizSession(String sessionId) {
    return isar.quizSessions
        .filter()
        .sessionIdEqualTo(sessionId)
        .watch(fireImmediately: true)
        .map((sessions) => sessions.isNotEmpty ? sessions.first : null);
  }

  /// Watch all sessions ordered by start date desc reactively
  Stream<List<QuizSession>> watchAllSessions() {
    return isar.quizSessions
        .where()
        .sortByStartedAtDesc()
        .watch(fireImmediately: true);
  }

  /// Watch attempts for a specific session reactively
  Stream<List<QuestionAttempt>> watchSessionAttempts(String sessionId) {
    return isar.questionAttempts
        .filter()
        .sessionIdEqualTo(sessionId)
        .sortByAnsweredAt()
        .watch(fireImmediately: true);
  }

  /// Get session by ID
  Future<QuizSession?> getSessionById(String sessionId) async {
    return await isar.quizSessions
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();
  }

  /// Get all attempts for a session
  Future<List<QuestionAttempt>> getSessionAttempts(String sessionId) async {
    return await isar.questionAttempts
        .filter()
        .sessionIdEqualTo(sessionId)
        .sortByAnsweredAt()
        .findAll();
  }
}
