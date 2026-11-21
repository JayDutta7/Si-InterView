import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/isar_provider.dart';
import '../../data/datasources/performance_isar_datasource.dart';
import '../../data/models/performance_snapshot.dart';
import '../../data/repositories/performance_repository_impl.dart';
import '../../domain/repositories/performance_repository.dart';
import '../../domain/services/performance_scoring_engine.dart';

final performanceIsarDataSourceProvider = Provider<PerformanceIsarDataSource>((ref) {
  final isar = ref.watch(isarProvider);
  return PerformanceIsarDataSource(isar);
});

final performanceRepositoryProvider = Provider<PerformanceRepository>((ref) {
  final dataSource = ref.watch(performanceIsarDataSourceProvider);
  return PerformanceRepositoryImpl(dataSource);
});

/// Reactive Isar StreamProvider watching live 9-metric ComprehensivePerformance
final comprehensivePerformanceStreamProvider =
    StreamProvider<ComprehensivePerformance>((ref) {
  final repo = ref.watch(performanceRepositoryProvider);
  return repo.watchComprehensivePerformance();
});

/// Reactive Isar StreamProvider watching snapshot history
final performanceSnapshotsStreamProvider =
    StreamProvider<List<PerformanceSnapshot>>((ref) {
  final repo = ref.watch(performanceRepositoryProvider);
  return repo.watchSnapshots();
});
