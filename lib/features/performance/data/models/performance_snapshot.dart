import 'package:isar_community/isar.dart';

part 'performance_snapshot.g.dart';

@collection
class PerformanceSnapshot {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String snapshotId;

  late DateTime calculatedAt;
  late double overallScore;
  late String readinessTier;
  late double technicalAccuracy;
  late double knowledgeDepth;
  late double communication;
  late double confidence;
  late double consistency;
  late double learningAbility;
  late double responseTimeSpeedScore;
  late double avgResponseTimeSeconds;
  late double medianResponseTimeSeconds;
  late int totalQuestionsAnswered;
  late int completedSessions;
  late String sessionSource;
  double scoreDelta = 0.0;
}
