import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/question_attempt.dart';
import '../../data/models/quiz_session.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/repositories/quiz_repository.dart';

class QuizPlayState {
  final bool isLoading;
  final String? errorMessage;
  final QuizSession? session;
  final List<QuestionEntity> questions;
  final int currentQuestionIndex;
  final int? selectedOptionIndex;
  final bool isAnswered;
  final QuestionAttempt? lastAttempt;
  final bool isSessionFinished;
  final DateTime? questionStartTime;

  const QuizPlayState({
    this.isLoading = false,
    this.errorMessage,
    this.session,
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.selectedOptionIndex,
    this.isAnswered = false,
    this.lastAttempt,
    this.isSessionFinished = false,
    this.questionStartTime,
  });

  QuestionEntity? get currentQuestion {
    if (questions.isEmpty ||
        currentQuestionIndex < 0 ||
        currentQuestionIndex >= questions.length) {
      return null;
    }
    return questions[currentQuestionIndex];
  }

  bool get isLastQuestion =>
      questions.isNotEmpty && currentQuestionIndex == questions.length - 1;

  QuizPlayState copyWith({
    bool? isLoading,
    String? errorMessage,
    QuizSession? session,
    List<QuestionEntity>? questions,
    int? currentQuestionIndex,
    int? selectedOptionIndex,
    bool? isAnswered,
    QuestionAttempt? lastAttempt,
    bool? isSessionFinished,
    DateTime? questionStartTime,
  }) {
    return QuizPlayState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      session: session ?? this.session,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      isAnswered: isAnswered ?? this.isAnswered,
      lastAttempt: lastAttempt ?? this.lastAttempt,
      isSessionFinished: isSessionFinished ?? this.isSessionFinished,
      questionStartTime: questionStartTime ?? this.questionStartTime,
    );
  }
}

class QuizController extends StateNotifier<QuizPlayState> {
  final QuizRepository _repository;

  QuizController(this._repository) : super(const QuizPlayState());

  /// Start a new quiz session with anti-repeat questions
  Future<void> startQuiz({
    required List<String> sections,
    required String difficulty,
    required int count,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      // 1. Generate questions uniquely filtering seen hashes in Isar
      final questions = await _repository.generateQuestions(
        sections: sections,
        difficulty: difficulty,
        count: count,
      );

      if (questions.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Could not generate questions. Please try again.',
        );
        return;
      }

      // 2. Create QuizSession in Isar
      final title = sections.length == 1
          ? '${sections.first} ($difficulty)'
          : 'Multi-Section Interview ($difficulty)';

      final session = await _repository.createSession(
        title: title,
        sections: sections,
        difficulty: difficulty,
        totalQuestions: questions.length,
      );

      state = QuizPlayState(
        isLoading: false,
        session: session,
        questions: questions,
        currentQuestionIndex: 0,
        selectedOptionIndex: null,
        isAnswered: false,
        lastAttempt: null,
        isSessionFinished: false,
        questionStartTime: DateTime.now(),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to start quiz: ${e.toString()}',
      );
    }
  }

  /// Select an option for the current question
  Future<void> selectOption(int optionIndex) async {
    if (state.isAnswered || state.currentQuestion == null || state.session == null) {
      return;
    }

    final now = DateTime.now();
    final start = state.questionStartTime ?? now;
    final responseTimeMs = now.difference(start).inMilliseconds;

    final question = state.currentQuestion!;
    final sessionId = state.session!.sessionId;

    // Immediately record attempt in Isar inside writeTxn
    final attempt = await _repository.recordAttempt(
      sessionId: sessionId,
      question: question,
      selectedIndex: optionIndex,
      responseTimeMs: responseTimeMs,
    );

    // Update state immediately with right/wrong feedback, highlights & explanation
    state = state.copyWith(
      selectedOptionIndex: optionIndex,
      isAnswered: true,
      lastAttempt: attempt,
    );
  }

  /// Move to next question or complete session if last question
  Future<void> nextQuestion() async {
    if (state.isLastQuestion) {
      if (state.session != null) {
        final completedSession = await _repository.completeSession(
          sessionId: state.session!.sessionId,
        );
        state = state.copyWith(
          session: completedSession,
          isSessionFinished: true,
        );
      }
    } else {
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        selectedOptionIndex: null,
        isAnswered: false,
        lastAttempt: null,
        questionStartTime: DateTime.now(),
      );
    }
  }

  void reset() {
    state = const QuizPlayState();
  }
}
