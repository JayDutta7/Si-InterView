import 'package:isar_community/isar.dart';

part 'live_interview_session.g.dart';

@collection
class LiveInterviewSession {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  late String topic;
  late String difficulty;
  late DateTime startedAt;
  DateTime? completedAt;
  int totalExchanges = 0;
  double overallScore = 0.0;
  late String feedbackSummary;
  late List<String> transcript;
  bool isCompleted = false;
}
