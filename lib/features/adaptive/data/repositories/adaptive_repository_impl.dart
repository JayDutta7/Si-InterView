import '../../domain/models/adaptive_state.dart';
import '../../domain/repositories/adaptive_repository.dart';
import '../../domain/services/adaptive_difficulty_engine.dart';
import '../datasources/adaptive_isar_datasource.dart';
import '../models/adaptive_profile_record.dart';

class AdaptiveRepositoryImpl implements AdaptiveRepository {
  final AdaptiveIsarDataSource _dataSource;

  AdaptiveRepositoryImpl(this._dataSource);

  @override
  Stream<AdaptiveState> watchAdaptiveState(String scopeKey) {
    return _dataSource.watchProfile(scopeKey).map((record) {
      if (record != null) {
        return record.toDomain();
      }
      return AdaptiveState.initial(scopeKey);
    });
  }

  @override
  Stream<List<AdaptiveState>> watchAllAdaptiveStates() {
    return _dataSource.watchAllProfiles().map((records) {
      return records.map((r) => r.toDomain()).toList();
    });
  }

  @override
  Future<AdaptiveState> getAdaptiveState(String scopeKey) async {
    final record = await _dataSource.getProfile(scopeKey);
    if (record != null) {
      return record.toDomain();
    }
    return AdaptiveState.initial(scopeKey);
  }

  @override
  Future<AdaptiveState> updateStateWithAttempt({
    required String scopeKey,
    required bool isCorrect,
    required int responseTimeMs,
  }) async {
    final currentState = await getAdaptiveState(scopeKey);
    final updatedState = AdaptiveDifficultyEngine.processAttempt(
      currentState: currentState,
      isCorrect: isCorrect,
      responseTimeMs: responseTimeMs,
    );

    final record = AdaptiveProfileRecord.fromDomain(updatedState);
    await _dataSource.saveProfile(record);

    return updatedState;
  }
}
