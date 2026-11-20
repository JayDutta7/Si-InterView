import 'package:isar_community/isar.dart';

part 'quiz_session.g.dart';

@collection
class QuizSession {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  late String title;
  late List<String> sections;
  late String difficulty;
  late DateTime startedAt;
  DateTime? completedAt;
  int totalQuestions = 0;
  int correctCount = 0;
  double scorePercent = 0.0;
  bool isCompleted = false;
}
