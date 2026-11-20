import 'package:isar_community/isar.dart';

part 'question_record.g.dart';

@collection
class QuestionRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String questionHash;

  late String questionText;
  late String section;
  late String topic;
  late String difficulty;
  late List<String> options;
  late int correctOptionIndex;
  late String explanation;
  late DateTime firstSeenAt;
  int timesAppeared = 1;
}
