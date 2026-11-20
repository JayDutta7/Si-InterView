import 'package:flutter_test/flutter_test.dart';
import 'package:mobileprep_ai/core/constants/app_constants.dart';
import 'package:mobileprep_ai/features/quiz/data/datasources/gemini_quiz_service.dart';

void main() {
  group('GeminiQuizService Fallback & Schema Tests', () {
    test('returns curated questions matching section and count when API key is empty', () async {
      final service = GeminiQuizService();

      final questions = await service.fetchMCQs(
        apiKey: '',
        sections: [AppConstants.sectionFlutterDart],
        difficulty: AppConstants.difficultySenior,
        count: 3,
      );

      expect(questions.length, equals(3));
      for (final q in questions) {
        expect(q.section, equals(AppConstants.sectionFlutterDart));
        expect(q.options.length, equals(4));
        expect(q.correctOptionIndex, inInclusiveRange(0, 3));
        expect(q.explanation.isNotEmpty, isTrue);
      }
    });

    test('returns mixed questions when Mixed All Sections is requested', () async {
      final service = GeminiQuizService();

      final questions = await service.fetchMCQs(
        apiKey: '',
        sections: [AppConstants.sectionMixed],
        difficulty: AppConstants.difficultyTechLead,
        count: 5,
      );

      expect(questions.length, equals(5));
      for (final q in questions) {
        expect(q.options.length, equals(4));
        expect(q.correctOptionIndex, inInclusiveRange(0, 3));
      }
    });
  });
}
