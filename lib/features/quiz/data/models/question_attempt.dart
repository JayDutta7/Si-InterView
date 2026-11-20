import 'package:isar_community/isar.dart';

part 'question_attempt.g.dart';

@collection
class QuestionAttempt {
  Id id = Isar.autoIncrement;

  @Index()
  late String sessionId;

  late int questionRecordId;
  late String questionHash;
  late String questionText;
  late List<String> options;
  late String section;
  late String topic;
  late int selectedIndex;
  late int correctIndex;
  late bool isCorrect;
  late String explanation;
  late DateTime answeredAt;
  late int responseTimeMs;
}
