import '../../data/models/question_attempt.dart';
import '../../data/models/question_record.dart';
import '../../data/models/quiz_session.dart';
import '../entities/question_entity.dart';

abstract class QuizRepository {
  /// Generate unique questions avoiding seen hashes in Isar.
  Future<List<QuestionEntity>> generateQuestions({
    required List<String> sections,
    required String difficulty,
    required int count,
  });

  /// Create and persist a new QuizSession in Isar.
  Future<QuizSession> createSession({
    required String title,
    required List<String> sections,
    required String difficulty,
    required int totalQuestions,
  });

  /// Record an attempt for a question in Isar and return the saved attempt.
  Future<QuestionAttempt> recordAttempt({
    required String sessionId,
    required QuestionEntity question,
    required int selectedIndex,
    required int responseTimeMs,
  });

  /// Complete a session, computing score percent and updating Isar.
  Future<QuizSession> completeSession({required String sessionId});

  /// Live Isar watcher stream for a single session.
  Stream<QuizSession?> watchSession(String sessionId);

  /// Live Isar watcher stream for all past sessions ordered by startedAt DESC.
  Stream<List<QuizSession>> watchAllSessions();

  /// Live Isar watcher stream for attempts belonging to a session.
  Stream<List<QuestionAttempt>> watchSessionAttempts(String sessionId);

  /// Fetch recently seen questions from Isar for anti-repeat prompting.
  Future<List<QuestionRecord>> getRecentlySeenQuestions({int limit = 30});

  /// Check if a hash already exists in Isar.
  Future<bool> hasSeenQuestion(String questionHash);
}
