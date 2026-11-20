import 'package:flutter/foundation.dart';
import '../../domain/models/interview_exchange.dart';

abstract class LiveInterviewService {
  Future<void> initialize();

  /// Start interview by generating the first opening question for the chosen topic & difficulty
  Future<String> startInterview({
    required String topic,
    required String difficulty,
  });

  /// Send candidate answer to Gemini, returning evaluation verdict, feedback, score, and next question
  Future<InterviewEvaluation> evaluateCandidateAnswer({
    required String question,
    required String candidateAnswer,
    required String topic,
    required String difficulty,
  });

  /// Speak text via Text-To-Speech with barge-in support
  Future<void> speakText(String text, {VoidCallback? onComplete});

  /// Stop TTS immediately (barge-in)
  Future<void> stopSpeaking();

  /// Start listening to microphone via Speech-To-Text
  Future<void> startListening({required Function(String spokenText) onResult});

  /// Stop listening to microphone
  Future<void> stopListening();

  Future<void> dispose();
}
