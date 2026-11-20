import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../../core/constants/app_constants.dart';
import '../../domain/models/interview_exchange.dart';
import 'live_interview_service.dart';

class LiveInterviewServiceImpl implements LiveInterviewService {
  final http.Client _httpClient;
  final String Function() _getApiKey;
  final FlutterTts _tts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool _isSpeechInitialized = false;

  LiveInterviewServiceImpl({
    required String Function() getApiKey,
    http.Client? httpClient,
  })  : _getApiKey = getApiKey,
        _httpClient = httpClient ?? http.Client();

  @override
  Future<void> initialize() async {
    try {
      await _tts.setLanguage('en-US');
      await _tts.setPitch(1.0);
      await _tts.setSpeechRate(0.5);
      await _tts.awaitSpeakCompletion(true);
    } catch (e) {
      debugPrint('TTS initialization warning: $e');
    }

    try {
      _isSpeechInitialized = await _speech.initialize(
        onError: (val) => debugPrint('STT Error: $val'),
        onStatus: (val) => debugPrint('STT Status: $val'),
      );
    } catch (e) {
      debugPrint('Speech-to-text initialization warning: $e');
    }
  }

  @override
  Future<String> startInterview({
    required String topic,
    required String difficulty,
  }) async {
    final apiKey = _getApiKey();
    if (apiKey.trim().isEmpty) {
      return _getFallbackOpeningQuestion(topic, difficulty);
    }

    final prompt = '''
You are a Staff Mobile Engineering Interviewer conducting a live spoken 1-to-1 interview for a $difficulty role.
Topic: $topic.
Generate an engaging, direct technical opening question to start the interview.
Keep it conversational, realistic for a verbal tech screen (not a multiple-choice question), and under 3 sentences.
Return ONLY the question text.
''';

    try {
      final url = Uri.parse(
        '${AppConstants.geminiEndpoint}/${AppConstants.defaultGeminiModel}:generateContent?key=${apiKey.trim()}',
      );
      final response = await _httpClient.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [
            {
              'role': 'user',
              'parts': [
                {'text': prompt}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;
        final candidates = decoded['candidates'] as List<dynamic>?;
        if (candidates != null && candidates.isNotEmpty) {
          final content = candidates[0]['content'] as Map<String, dynamic>?;
          final parts = content?['parts'] as List<dynamic>?;
          if (parts != null && parts.isNotEmpty) {
            final text = parts[0]['text'] as String?;
            if (text != null && text.trim().isNotEmpty) {
              return text.trim();
            }
          }
        }
      }
    } catch (e) {
      debugPrint('Failed to get opening question from Gemini: $e');
    }

    return _getFallbackOpeningQuestion(topic, difficulty);
  }

  @override
  Future<InterviewEvaluation> evaluateCandidateAnswer({
    required String question,
    required String candidateAnswer,
    required String topic,
    required String difficulty,
  }) async {
    final apiKey = _getApiKey();
    if (apiKey.trim().isEmpty) {
      return _getFallbackEvaluation(question, candidateAnswer);
    }

    final prompt = '''
You are a Staff Mobile Engineering Interviewer evaluating a candidate's spoken response.
Topic: $topic
Difficulty Level: $difficulty
Interviewer Question: "$question"
Candidate Verbal Answer: "$candidateAnswer"

Evaluate whether the candidate's answer is technically sound, partially correct, or wrong.
Provide constructive, concise feedback (2-3 sentences max) explaining the evaluation.
Then provide a logical technical follow-up question or transition to the next technical topic.
Assign a rating score from 0.0 to 10.0.

Respond strictly in JSON matching this schema:
{
  "verdict": "Right" | "Partially Correct" | "Wrong",
  "feedback": "Spoken explanation of why the answer is accurate or missing key concepts...",
  "nextQuestion": "The next technical question or deep dive...",
  "score": 8.5
}
''';

    try {
      final url = Uri.parse(
        '${AppConstants.geminiEndpoint}/${AppConstants.defaultGeminiModel}:generateContent?key=${apiKey.trim()}',
      );
      final response = await _httpClient.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [
            {
              'role': 'user',
              'parts': [
                {'text': prompt}
              ]
            }
          ],
          'generationConfig': {
            'response_mime_type': 'application/json',
          }
        }),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;
        final candidates = decoded['candidates'] as List<dynamic>?;
        if (candidates != null && candidates.isNotEmpty) {
          final content = candidates[0]['content'] as Map<String, dynamic>?;
          final parts = content?['parts'] as List<dynamic>?;
          if (parts != null && parts.isNotEmpty) {
            final text = parts[0]['text'] as String?;
            if (text != null && text.trim().isNotEmpty) {
              final jsonMap = jsonDecode(text) as Map<String, dynamic>;
              return InterviewEvaluation.fromJson(jsonMap);
            }
          }
        }
      }
    } catch (e) {
      debugPrint('Failed to evaluate answer via Gemini: $e');
    }

    return _getFallbackEvaluation(question, candidateAnswer);
  }

  @override
  Future<void> speakText(String text, {VoidCallback? onComplete}) async {
    try {
      if (onComplete != null) {
        _tts.setCompletionHandler(onComplete);
      }
      await _tts.speak(text);
    } catch (e) {
      debugPrint('Error speaking text: $e');
      onComplete?.call();
    }
  }

  @override
  Future<void> stopSpeaking() async {
    try {
      await _tts.stop();
    } catch (e) {
      debugPrint('Error stopping TTS: $e');
    }
  }

  @override
  Future<void> startListening({required Function(String spokenText) onResult}) async {
    if (!_isSpeechInitialized) {
      _isSpeechInitialized = await _speech.initialize();
    }
    if (_isSpeechInitialized) {
      await _speech.listen(
        onResult: (result) {
          if (result.recognizedWords.isNotEmpty) {
            onResult(result.recognizedWords);
          }
        },
        listenOptions: stt.SpeechListenOptions(
          listenFor: const Duration(seconds: 40),
          pauseFor: const Duration(seconds: 4),
          cancelOnError: false,
          partialResults: true,
        ),
      );
    } else {
      debugPrint('STT not available or initialized.');
    }
  }

  @override
  Future<void> stopListening() async {
    if (_speech.isListening) {
      await _speech.stop();
    }
  }

  @override
  Future<void> dispose() async {
    await stopSpeaking();
    await stopListening();
  }

  String _getFallbackOpeningQuestion(String topic, String difficulty) {
    if (topic.contains('Flutter')) {
      return "Let's dive into Flutter. Can you explain the architectural relationship between Widgets, Elements, and RenderObjects during a frame build, and how Flutter avoids rebuilding the entire RenderObject tree?";
    } else if (topic.contains('Android') || topic.contains('Kotlin')) {
      return "Welcome. Let's start with Kotlin Coroutines. How do Dispatchers.Main, Dispatchers.Default, and Dispatchers.IO differ under the hood, and how would you avoid thread starvation in an Android app?";
    } else if (topic.contains('System Design')) {
      return "Hello! In mobile architecture, how would you design a robust offline-first synchronization engine for a chat or document editing application that handles frequent network dropouts?";
    } else {
      return "Let's begin. Can you explain how an LRU Cache operates, and how you would implement it in memory with O(1) time complexity for both get and put operations?";
    }
  }

  InterviewEvaluation _getFallbackEvaluation(String question, String answer) {
    final lower = answer.toLowerCase();
    if (lower.length > 50 &&
        (lower.contains('because') ||
            lower.contains('object') ||
            lower.contains('thread') ||
            lower.contains('queue') ||
            lower.contains('tree') ||
            lower.contains('cache') ||
            lower.contains('hash') ||
            lower.contains('key') ||
            lower.contains('element'))) {
      return const InterviewEvaluation(
        verdict: AnswerVerdict.right,
        feedback:
            'Excellent analysis! You clearly explained the core structural concepts and architectural tradeoffs involved.',
        nextQuestion:
            'How would you measure the performance overhead and profile this in production using DevTools or Android Profiler?',
        score: 9.0,
      );
    } else if (answer.trim().length > 15) {
      return const InterviewEvaluation(
        verdict: AnswerVerdict.partiallyCorrect,
        feedback:
            'Good intuition on the high-level picture, but consider going deeper into memory lifecycles and edge cases under concurrent execution.',
        nextQuestion:
            'What failure modes might occur under low memory conditions or configuration changes?',
        score: 7.0,
      );
    } else {
      return const InterviewEvaluation(
        verdict: AnswerVerdict.wrong,
        feedback:
            'The answer was incomplete or missed the fundamental mechanism. Be sure to articulate how the framework handles state lifecycle and thread transitions.',
        nextQuestion:
            'Let us look at another angle: what specific design pattern or class in the standard SDK would solve this problem?',
        score: 5.0,
      );
    }
  }
}
