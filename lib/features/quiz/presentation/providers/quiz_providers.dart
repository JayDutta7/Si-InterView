import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobileprep_ai/core/database/isar_provider.dart';
import 'package:mobileprep_ai/features/adaptive/presentation/providers/adaptive_providers.dart';
import 'package:mobileprep_ai/features/quiz/data/datasources/gemini_quiz_service.dart';
import 'package:mobileprep_ai/features/quiz/data/datasources/quiz_isar_datasource.dart';
import 'package:mobileprep_ai/features/quiz/data/models/question_attempt.dart';
import 'package:mobileprep_ai/features/quiz/data/models/quiz_session.dart';
import 'package:mobileprep_ai/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:mobileprep_ai/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:mobileprep_ai/features/quiz/presentation/controllers/quiz_controller.dart';

/// Isar DataSource Provider for Quiz
final quizIsarDataSourceProvider = Provider<QuizIsarDataSource>((ref) {
  final isar = ref.watch(isarProvider);
  return QuizIsarDataSource(isar);
});

/// Gemini Quiz Service Provider
final geminiQuizServiceProvider = Provider<GeminiQuizService>((ref) {
  return GeminiQuizService();
});

/// Quiz Repository Provider
final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final isarDataSource = ref.watch(quizIsarDataSourceProvider);
  final geminiService = ref.watch(geminiQuizServiceProvider);
  final adaptiveDataSource = ref.watch(adaptiveIsarDataSourceProvider);
  String getApiKey() => ref.read(geminiApiKeyProvider);

  return QuizRepositoryImpl(
    isarDataSource: isarDataSource,
    geminiService: geminiService,
    getApiKey: getApiKey,
    adaptiveIsarDataSource: adaptiveDataSource,
  );
});

/// Reactive Isar StreamProvider watching all sessions
final allQuizSessionsStreamProvider = StreamProvider<List<QuizSession>>((ref) {
  final repo = ref.watch(quizRepositoryProvider);
  return repo.watchAllSessions();
});

/// Reactive Isar StreamProvider watching single session
final singleQuizSessionStreamProvider =
    StreamProvider.family<QuizSession?, String>((ref, sessionId) {
  final repo = ref.watch(quizRepositoryProvider);
  return repo.watchSession(sessionId);
});

/// Reactive Isar StreamProvider watching attempts of a session
final sessionAttemptsStreamProvider =
    StreamProvider.family<List<QuestionAttempt>, String>((ref, sessionId) {
  final repo = ref.watch(quizRepositoryProvider);
  return repo.watchSessionAttempts(sessionId);
});

/// Quiz Controller Provider (StateNotifier)
final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizPlayState>((ref) {
  final repo = ref.watch(quizRepositoryProvider);
  return QuizController(repo);
});
