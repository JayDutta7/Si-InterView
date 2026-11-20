import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:mobileprep_ai/features/live_interview/data/datasources/live_interview_datasource.dart';
import 'package:mobileprep_ai/features/live_interview/data/models/live_interview_session.dart';
import 'package:mobileprep_ai/features/live_interview/data/services/live_interview_service.dart';
import 'package:mobileprep_ai/features/live_interview/domain/models/interview_exchange.dart';

class LiveInterviewState {
  final LiveBotState botState;
  final String sessionId;
  final String topic;
  final String difficulty;
  final String currentQuestion;
  final String candidateSpokenText;
  final List<InterviewExchange> exchanges;
  final bool isMuted;
  final bool isCameraOn;
  final bool isFrontCamera;
  final double overallScore;
  final String feedbackSummary;
  final String? errorMessage;
  final bool isSessionSaved;

  const LiveInterviewState({
    this.botState = LiveBotState.idle,
    this.sessionId = '',
    this.topic = '',
    this.difficulty = '',
    this.currentQuestion = '',
    this.candidateSpokenText = '',
    this.exchanges = const [],
    this.isMuted = false,
    this.isCameraOn = true,
    this.isFrontCamera = true,
    this.overallScore = 0.0,
    this.feedbackSummary = '',
    this.errorMessage,
    this.isSessionSaved = false,
  });

  LiveInterviewState copyWith({
    LiveBotState? botState,
    String? sessionId,
    String? topic,
    String? difficulty,
    String? currentQuestion,
    String? candidateSpokenText,
    List<InterviewExchange>? exchanges,
    bool? isMuted,
    bool? isCameraOn,
    bool? isFrontCamera,
    double? overallScore,
    String? feedbackSummary,
    String? errorMessage,
    bool? isSessionSaved,
  }) {
    return LiveInterviewState(
      botState: botState ?? this.botState,
      sessionId: sessionId ?? this.sessionId,
      topic: topic ?? this.topic,
      difficulty: difficulty ?? this.difficulty,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      candidateSpokenText: candidateSpokenText ?? this.candidateSpokenText,
      exchanges: exchanges ?? this.exchanges,
      isMuted: isMuted ?? this.isMuted,
      isCameraOn: isCameraOn ?? this.isCameraOn,
      isFrontCamera: isFrontCamera ?? this.isFrontCamera,
      overallScore: overallScore ?? this.overallScore,
      feedbackSummary: feedbackSummary ?? this.feedbackSummary,
      errorMessage: errorMessage ?? this.errorMessage,
      isSessionSaved: isSessionSaved ?? this.isSessionSaved,
    );
  }
}

class LiveInterviewController extends StateNotifier<LiveInterviewState> {
  final LiveInterviewService _service;
  final LiveInterviewDataSource _dataSource;
  final Uuid _uuid = const Uuid();

  LiveInterviewController({
    required LiveInterviewService service,
    required LiveInterviewDataSource dataSource,
  })  : _service = service,
        _dataSource = dataSource,
        super(const LiveInterviewState());

  /// Initialize and start a new live interview session
  Future<void> startSession({
    required String topic,
    required String difficulty,
  }) async {
    final newSessionId = _uuid.v4();
    state = state.copyWith(
      sessionId: newSessionId,
      topic: topic,
      difficulty: difficulty,
      botState: LiveBotState.connecting,
      exchanges: [],
      candidateSpokenText: '',
      isSessionSaved: false,
      errorMessage: null,
    );

    try {
      await _service.initialize();

      // Request opening question from Gemini
      final openingQuestion = await _service.startInterview(
        topic: topic,
        difficulty: difficulty,
      );

      state = state.copyWith(
        currentQuestion: openingQuestion,
        botState: LiveBotState.botSpeaking,
      );

      // Speak question via TTS with completion callback
      await _service.speakText(
        openingQuestion,
        onComplete: () {
          if (mounted && state.botState == LiveBotState.botSpeaking) {
            _beginListening();
          }
        },
      );
    } catch (e) {
      state = state.copyWith(
        botState: LiveBotState.idle,
        errorMessage: 'Failed to start interview: $e',
      );
    }
  }

  void _beginListening() {
    if (state.isMuted) return;

    state = state.copyWith(
      botState: LiveBotState.listening,
      candidateSpokenText: '',
    );

    _service.startListening(
      onResult: (spokenText) {
        if (mounted) {
          state = state.copyWith(candidateSpokenText: spokenText);
        }
      },
    );
  }

  /// Update recognized spoken text or manual text input
  void updateSpokenText(String text) {
    state = state.copyWith(candidateSpokenText: text);
  }

  /// Submit candidate answer for evaluation by Gemini
  Future<void> submitAnswer([String? overrideText]) async {
    final answerText = (overrideText ?? state.candidateSpokenText).trim();
    if (answerText.isEmpty) return;

    await _service.stopListening();
    await _service.stopSpeaking();

    state = state.copyWith(
      botState: LiveBotState.evaluatingAnswer,
      candidateSpokenText: answerText,
    );

    try {
      final evaluation = await _service.evaluateCandidateAnswer(
        question: state.currentQuestion,
        candidateAnswer: answerText,
        topic: state.topic,
        difficulty: state.difficulty,
      );

      final exchange = InterviewExchange(
        turnIndex: state.exchanges.length + 1,
        question: state.currentQuestion,
        candidateAnswer: answerText,
        verdict: evaluation.verdict,
        feedback: evaluation.feedback,
        score: evaluation.score,
        timestamp: DateTime.now(),
      );

      final updatedExchanges = [...state.exchanges, exchange];
      final avgScore = updatedExchanges.map((e) => e.score).reduce((a, b) => a + b) /
          updatedExchanges.length;

      state = state.copyWith(
        exchanges: updatedExchanges,
        overallScore: avgScore,
        currentQuestion: evaluation.nextQuestion,
        candidateSpokenText: '',
        botState: LiveBotState.botSpeaking,
      );

      // Spoken feedback and next question
      final spokenResponse = '${evaluation.feedback} Next: ${evaluation.nextQuestion}';
      await _service.speakText(
        spokenResponse,
        onComplete: () {
          if (mounted && state.botState == LiveBotState.botSpeaking) {
            _beginListening();
          }
        },
      );
    } catch (e) {
      state = state.copyWith(
        botState: LiveBotState.listening,
        errorMessage: 'Evaluation error: $e',
      );
    }
  }

  /// Interrupt bot speaking (barge-in support)
  Future<void> interruptBot() async {
    await _service.stopSpeaking();
    _beginListening();
  }

  /// Toggle microphone mute
  Future<void> toggleMute() async {
    final newMute = !state.isMuted;
    state = state.copyWith(isMuted: newMute);
    if (newMute) {
      await _service.stopListening();
      if (state.botState == LiveBotState.listening) {
        state = state.copyWith(botState: LiveBotState.idle);
      }
    } else {
      if (state.botState == LiveBotState.idle) {
        _beginListening();
      }
    }
  }

  /// Toggle camera visibility
  void toggleCamera() {
    state = state.copyWith(isCameraOn: !state.isCameraOn);
  }

  /// Switch between front and back camera
  void switchCamera() {
    state = state.copyWith(isFrontCamera: !state.isFrontCamera);
  }

  /// End session and save summary to Isar inside writeTxn
  Future<void> endSession() async {
    await _service.dispose();

    if (state.exchanges.isNotEmpty && !state.isSessionSaved) {
      final summaryNotes = state.exchanges
          .map((e) => 'Q: ${e.question}\nA: ${e.candidateAnswer} [${e.verdict.name.toUpperCase()} - ${e.score}/10]\nFeedback: ${e.feedback}')
          .join('\n\n');

      final isarSession = LiveInterviewSession()
        ..sessionId = state.sessionId
        ..topic = state.topic
        ..difficulty = state.difficulty
        ..startedAt = state.exchanges.first.timestamp
        ..completedAt = DateTime.now()
        ..totalExchanges = state.exchanges.length
        ..overallScore = state.overallScore
        ..feedbackSummary = summaryNotes
        ..transcript = state.exchanges.map((e) => e.serialize()).toList()
        ..isCompleted = true;

      await _dataSource.saveSession(isarSession);
    }

    state = state.copyWith(
      botState: LiveBotState.sessionEnded,
      isSessionSaved: true,
    );
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }
}
