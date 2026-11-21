import '../services/performance_scoring_engine.dart';
import '../../data/models/performance_snapshot.dart';

abstract class PerformanceRepository {
  /// Reactive stream emitting ComprehensivePerformance as Isar records change
  Stream<ComprehensivePerformance> watchComprehensivePerformance();

  /// Reactive stream emitting historical snapshots
  Stream<List<PerformanceSnapshot>> watchSnapshots();

  /// Persist a snapshot checkpoint to Isar
  Future<PerformanceSnapshot> recordSnapshot({
    required ComprehensivePerformance performance,
    required String source,
  });

  /// Get the latest persisted snapshot if any
  Future<PerformanceSnapshot?> getLatestSnapshot();
}
