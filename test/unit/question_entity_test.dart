import 'package:flutter_test/flutter_test.dart';
import 'package:mobileprep_ai/features/quiz/domain/entities/question_entity.dart';
import 'package:mobileprep_ai/features/live_interview/domain/models/interview_exchange.dart';

void main() {
  group('Domain Model Serialization & Schema Tests', () {
    test('QuestionEntity parsing and JSON encoding', () {
      final jsonMap = {
        'section': 'Flutter & Dart',
        'topic': 'Widget Tree',
        'interviewStyle': 'Technical Conceptual',
        'question': 'How does Flutter identify widgets during rebuild?',
        'options': ['By name', 'By key and runtimeType', 'By hash', 'By index'],
        'correctOptionIndex': 1,
        'explanation': 'Flutter uses runtimeType and Key in Widget.canUpdate().',
      };

      final entity = QuestionEntity.fromJson(jsonMap, hash: 'test-hash-123');

      expect(entity.questionHash, equals('test-hash-123'));
      expect(entity.section, equals('Flutter & Dart'));
      expect(entity.correctOptionIndex, equals(1));
      expect(entity.options.length, equals(4));

      final serialized = entity.toJson();
      expect(serialized['question'], equals('How does Flutter identify widgets during rebuild?'));
    });

    test('InterviewExchange serialization and deserialization', () {
      final exchange = InterviewExchange(
        turnIndex: 1,
        question: 'What is a Coroutine Dispatcher?',
        candidateAnswer: 'It controls which thread the coroutine runs on.',
        verdict: AnswerVerdict.right,
        feedback: 'Correct explanation.',
        score: 9.0,
        timestamp: DateTime(2025, 1, 1, 10, 0),
      );

      final jsonStr = exchange.serialize();
      final deserialized = InterviewExchange.deserialize(jsonStr);

      expect(deserialized.turnIndex, equals(1));
      expect(deserialized.verdict, equals(AnswerVerdict.right));
      expect(deserialized.score, equals(9.0));
      expect(deserialized.candidateAnswer, equals('It controls which thread the coroutine runs on.'));
    });
  });
}
