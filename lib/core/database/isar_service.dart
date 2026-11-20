import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:mobileprep_ai/features/quiz/data/models/question_record.dart';
import 'package:mobileprep_ai/features/quiz/data/models/quiz_session.dart';
import 'package:mobileprep_ai/features/quiz/data/models/question_attempt.dart';
import 'package:mobileprep_ai/features/live_interview/data/models/live_interview_session.dart';

class IsarService {
  IsarService._();

  static Isar? _instance;

  static Isar get instance {
    if (_instance == null) {
      throw StateError(
        'Isar database has not been initialized. Call IsarService.init() first.',
      );
    }
    return _instance!;
  }

  /// Initialize Isar once at startup using getApplicationDocumentsDirectory()
  static Future<Isar> init() async {
    if (_instance != null) return _instance!;

    String directoryPath = '';
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      directoryPath = dir.path;
    }

    _instance = await Isar.open(
      [
        QuestionRecordSchema,
        QuizSessionSchema,
        QuestionAttemptSchema,
        LiveInterviewSessionSchema,
      ],
      directory: directoryPath,
      inspector: kDebugMode,
    );

    return _instance!;
  }

  /// Close database instance if needed
  static Future<void> close() async {
    if (_instance != null && _instance!.isOpen) {
      await _instance!.close();
      _instance = null;
    }
  }
}
