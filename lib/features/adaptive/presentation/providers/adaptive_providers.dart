import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/isar_provider.dart';
import '../../data/datasources/adaptive_isar_datasource.dart';
import '../../data/repositories/adaptive_repository_impl.dart';
import '../../domain/models/adaptive_state.dart';
import '../../domain/repositories/adaptive_repository.dart';

final adaptiveIsarDataSourceProvider = Provider<AdaptiveIsarDataSource>((ref) {
  final isar = ref.watch(isarProvider);
  return AdaptiveIsarDataSource(isar);
});

final adaptiveRepositoryProvider = Provider<AdaptiveRepository>((ref) {
  final dataSource = ref.watch(adaptiveIsarDataSourceProvider);
  return AdaptiveRepositoryImpl(dataSource);
});

/// Reactive StreamProvider for a specific section scope
final adaptiveStateFamilyProvider =
    StreamProvider.family<AdaptiveState, String>((ref, scopeKey) {
  final repo = ref.watch(adaptiveRepositoryProvider);
  return repo.watchAdaptiveState(scopeKey);
});

/// Reactive StreamProvider for all section adaptive profiles
final allAdaptiveStatesStreamProvider =
    StreamProvider<List<AdaptiveState>>((ref) {
  final repo = ref.watch(adaptiveRepositoryProvider);
  return repo.watchAllAdaptiveStates();
});
