import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:mobileprep_ai/features/adaptive/data/datasources/adaptive_isar_datasource.dart';
import 'package:mobileprep_ai/features/adaptive/data/models/adaptive_profile_record.dart';
import 'package:mobileprep_ai/features/adaptive/domain/models/adaptive_state.dart';
import 'package:mobileprep_ai/features/adaptive/domain/services/adaptive_difficulty_engine.dart';

import '../../../../core/utils/hash_util.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/gemini_quiz_service.dart';
import '../datasources/quiz_isar_datasource.dart';
import '../models/question_attempt.dart';
import '../models/question_record.dart';
import '../models/quiz_session.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizIsarDataSource _isarDataSource;
  final GeminiQuizService _geminiService;
  final AdaptiveIsarDataSource? _adaptiveIsarDataSource;
  final String Function() _getApiKey;
  final Uuid _uuid = const Uuid();

  QuizRepositoryImpl({
    required QuizIsarDataSource isarDataSource,
    required GeminiQuizService geminiService,
    required String Function() getApiKey,
    AdaptiveIsarDataSource? adaptiveIsarDataSource,
  })  : _isarDataSource = isarDataSource,
        _geminiService = geminiService,
        _getApiKey = getApiKey,
        _adaptiveIsarDataSource = adaptiveIsarDataSource;

  @override
  Future<List<QuestionEntity>> generateQuestions({
    required List<String> sections,
    required String difficulty,
    required int count,
  }) async {
    // 1. Fetch recent seen questions to pass to Gemini prompt to encourage variety
    final recentRecords = await _isarDataSource.getRecentQuestionRecords(limit: 30);
    final avoidSummaries = recentRecords.map((r) => '${r.topic}: ${r.questionText}').toList();

    // Fetch active adaptive difficulty profile for prompt calibration
    final primaryScope = sections.isNotEmpty ? sections.first : 'Global';
    final adaptiveProfile = await _adaptiveIsarDataSource?.getProfile(primaryScope);

    final List<QuestionEntity> uniqueQuestions = [];
    int attempts = 0;
    const int maxAttempts = 3;

    while (uniqueQuestions.length < count && attempts < maxAttempts) {
      attempts++;
      final neededCount = count - uniqueQuestions.length;

      // Request needed questions from Gemini service (or fallback bank)
      final rawCandidates = await _geminiService.fetchMCQs(
        apiKey: _getApiKey(),
        sections: sections,
        difficulty: adaptiveProfile?.tier.label ?? difficulty,
        count: neededCount,
        adaptiveRating: adaptiveProfile?.rating,
        adaptiveTierLabel: adaptiveProfile?.tier.label,
        avoidQuestionSummaries: [
          ...avoidSummaries,
          ...uniqueQuestions.map((q) => q.questionText),
        ],
      );

      final List<QuestionRecord> newRecordsToSave = [];

      for (final rawQ in rawCandidates) {
        if (uniqueQuestions.length >= count) break;

        // Compute deterministic SHA-256 hash
        final hash = HashUtil.computeQuestionHash(rawQ.questionText);

        // Check if hash already seen in Isar
        final existingRecord = await _isarDataSource.getQuestionByHash(hash);

        if (existingRecord != null) {
          // Duplicate question detected! Increment appearance count and skip
          debugPrint('Anti-Repeat: duplicate question hash detected ($hash). Requesting replacement.');
          existingRecord.timesAppeared += 1;
          await _isarDataSource.saveQuestionRecord(existingRecord);
          continue;
        }

        // Check if duplicate within current batch
        final alreadyInBatch = uniqueQuestions.any(
          (q) => q.questionHash == hash,
        );
        if (alreadyInBatch) continue;

        // New unique question found!
        final questionWithHash = rawQ.copyWith(questionHash: hash);
        uniqueQuestions.add(questionWithHash);

        // Prepare record to save in Isar
        final record = QuestionRecord()
          ..questionHash = hash
          ..questionText = questionWithHash.questionText
          ..section = questionWithHash.section
          ..topic = questionWithHash.topic
          ..difficulty = difficulty
          ..options = questionWithHash.options
          ..correctOptionIndex = questionWithHash.correctOptionIndex
          ..explanation = questionWithHash.explanation
          ..firstSeenAt = DateTime.now()
          ..timesAppeared = 1;

        newRecordsToSave.add(record);
      }

      // Persist newly seen questions in Isar inside writeTxn
      if (newRecordsToSave.isNotEmpty) {
        await _isarDataSource.saveQuestionRecords(newRecordsToSave);
      }
    }

    return uniqueQuestions;
  }

  @override
  Future<QuizSession> createSession({
    required String title,
    required List<String> sections,
    required String difficulty,
    required int totalQuestions,
  }) async {
    final session = QuizSession()
      ..sessionId = _uuid.v4()
      ..title = title
      ..sections = sections
      ..difficulty = difficulty
      ..startedAt = DateTime.now()
      ..totalQuestions = totalQuestions
      ..correctCount = 0
      ..scorePercent = 0.0
      ..isCompleted = false;

    return await _isarDataSource.createQuizSession(session);
  }

  @override
  Future<QuestionAttempt> recordAttempt({
    required String sessionId,
    required QuestionEntity question,
    required int selectedIndex,
    required int responseTimeMs,
    String? difficulty,
    int optionChangesCount = 0,
  }) async {
    final session = await _isarDataSource.getSessionById(sessionId);
    final resolvedDifficulty = difficulty ?? session?.difficulty ?? 'Mid';
    final isCorrect = selectedIndex == question.correctOptionIndex;

    // 1. Create and save attempt in Isar inside writeTxn
    final attempt = QuestionAttempt()
      ..sessionId = sessionId
      ..questionRecordId = question.id ?? 0
      ..questionHash = question.questionHash
      ..questionText = question.questionText
      ..options = question.options
      ..section = question.section
      ..topic = question.topic
      ..selectedIndex = selectedIndex
      ..correctIndex = question.correctOptionIndex
      ..isCorrect = isCorrect
      ..explanation = question.explanation
      ..answeredAt = DateTime.now()
      ..responseTimeMs = responseTimeMs
      ..difficulty = resolvedDifficulty
      ..optionChangesCount = optionChangesCount
      ..evaluationRating = isCorrect ? 100.0 : 0.0;

    await _isarDataSource.saveQuestionAttempt(attempt);

    // 2. Update QuizSession stats inside writeTxn
    if (session != null) {
      if (isCorrect) {
        session.correctCount += 1;
      }
      final attempts = await _isarDataSource.getSessionAttempts(sessionId);
      if (session.totalQuestions > 0) {
        session.scorePercent = (session.correctCount / session.totalQuestions) * 100.0;
      }
      if (attempts.length >= session.totalQuestions) {
        session.isCompleted = true;
        session.completedAt = DateTime.now();
      }
      await _isarDataSource.updateQuizSession(session);
    }

    // 3. Update Adaptive Difficulty Profile in Isar for section and global scope
    if (_adaptiveIsarDataSource != null) {
      // Update section scope
      final sectionProfile = await _adaptiveIsarDataSource.getProfile(question.section);
      final sectionState = sectionProfile?.toDomain() ?? AdaptiveState.initial(question.section);
      final updatedSectionState = AdaptiveDifficultyEngine.processAttempt(
        currentState: sectionState,
        isCorrect: isCorrect,
        responseTimeMs: responseTimeMs,
      );
      await _adaptiveIsarDataSource.saveProfile(
        AdaptiveProfileRecord.fromDomain(updatedSectionState),
      );

      // Update global scope
      final globalProfile = await _adaptiveIsarDataSource.getProfile('Global');
      final globalState = globalProfile?.toDomain() ?? AdaptiveState.initial('Global');
      final updatedGlobalState = AdaptiveDifficultyEngine.processAttempt(
        currentState: globalState,
        isCorrect: isCorrect,
        responseTimeMs: responseTimeMs,
      );
      await _adaptiveIsarDataSource.saveProfile(
        AdaptiveProfileRecord.fromDomain(updatedGlobalState),
      );
    }

    return attempt;
  }

  @override
  Future<QuizSession> completeSession({required String sessionId}) async {
    final session = await _isarDataSource.getSessionById(sessionId);
    if (session == null) {
      throw Exception('Session not found: $sessionId');
    }

    final attempts = await _isarDataSource.getSessionAttempts(sessionId);
    final correctCount = attempts.where((a) => a.isCorrect).length;

    session.correctCount = correctCount;
    session.totalQuestions = attempts.isNotEmpty ? attempts.length : session.totalQuestions;
    session.scorePercent = session.totalQuestions > 0
        ? (correctCount / session.totalQuestions) * 100.0
        : 0.0;
    session.isCompleted = true;
    session.completedAt = DateTime.now();

    await _isarDataSource.updateQuizSession(session);
    return session;
  }

  @override
  Stream<QuizSession?> watchSession(String sessionId) {
    return _isarDataSource.watchQuizSession(sessionId);
  }

  @override
  Stream<List<QuizSession>> watchAllSessions() {
    return _isarDataSource.watchAllSessions();
  }

  @override
  Stream<List<QuestionAttempt>> watchSessionAttempts(String sessionId) {
    return _isarDataSource.watchSessionAttempts(sessionId);
  }

  @override
  Future<List<QuestionRecord>> getRecentlySeenQuestions({int limit = 30}) {
    return _isarDataSource.getRecentQuestionRecords(limit: limit);
  }

  @override
  Future<bool> hasSeenQuestion(String questionHash) async {
    final record = await _isarDataSource.getQuestionByHash(questionHash);
    return record != null;
  }
}
