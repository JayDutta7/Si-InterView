import 'dart:async';

import 'package:uuid/uuid.dart';

import '../datasources/performance_isar_datasource.dart';
import '../models/performance_snapshot.dart';
import '../../domain/repositories/performance_repository.dart';
import '../../domain/services/performance_scoring_engine.dart';

class PerformanceRepositoryImpl implements PerformanceRepository {
  final PerformanceIsarDataSource _dataSource;
  final Uuid _uuid = const Uuid();

  PerformanceRepositoryImpl(this._dataSource);

  @override
  Stream<ComprehensivePerformance> watchComprehensivePerformance() {
    final controller = StreamController<ComprehensivePerformance>();

    void update() async {
      try {
        final attempts = await _dataSource.getAllAttempts();
        final sessions = await _dataSource.getAllSessions();
        final liveSessions = await _dataSource.getAllLiveSessions();
        final latestSnapshot = await _dataSource.getLatestSnapshot();

        final perf = PerformanceScoringEngine.calculate(
          attempts: attempts,
          sessions: sessions,
          liveSessions: liveSessions,
          previousOverallScore: latestSnapshot?.overallScore,
        );

        if (!controller.isClosed) {
          controller.add(perf);
        }
      } catch (e) {
        if (!controller.isClosed) {
          controller.addError(e);
        }
      }
    }

    StreamSubscription? sub1;
    StreamSubscription? sub2;
    StreamSubscription? sub3;

    controller.onListen = () {
      update();
      sub1 = _dataSource.watchQuestionAttempts().listen((_) => update());
      sub2 = _dataSource.watchQuizSessions().listen((_) => update());
      sub3 = _dataSource.watchLiveSessions().listen((_) => update());
    };

    controller.onCancel = () {
      sub1?.cancel();
      sub2?.cancel();
      sub3?.cancel();
      controller.close();
    };

    return controller.stream;
  }

  @override
  Stream<List<PerformanceSnapshot>> watchSnapshots() {
    return _dataSource.watchSnapshots();
  }

  @override
  Future<PerformanceSnapshot> recordSnapshot({
    required ComprehensivePerformance performance,
    required String source,
  }) async {
    final latest = await _dataSource.getLatestSnapshot();
    final delta = latest != null ? (performance.overallScore - latest.overallScore) : 0.0;

    final snapshot = PerformanceSnapshot()
      ..snapshotId = _uuid.v4()
      ..calculatedAt = DateTime.now()
      ..overallScore = performance.overallScore
      ..readinessTier = performance.readinessTier.label
      ..technicalAccuracy = performance.technicalAccuracy.score
      ..knowledgeDepth = performance.knowledgeDepth.score
      ..communication = performance.communication.score
      ..confidence = performance.confidence.score
      ..consistency = performance.consistency.score
      ..learningAbility = performance.learningAbility.score
      ..responseTimeSpeedScore = performance.responseTime.score
      ..avgResponseTimeSeconds = performance.avgResponseTimeSeconds
      ..medianResponseTimeSeconds = performance.medianResponseTimeSeconds
      ..totalQuestionsAnswered = performance.totalQuestionsAnswered
      ..completedSessions = performance.completedSessions
      ..sessionSource = source
      ..scoreDelta = delta;

    return await _dataSource.saveSnapshot(snapshot);
  }

  @override
  Future<PerformanceSnapshot?> getLatestSnapshot() {
    return _dataSource.getLatestSnapshot();
  }
}
