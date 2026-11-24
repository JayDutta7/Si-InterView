import '../models/adaptive_state.dart';

abstract class AdaptiveRepository {
  Stream<AdaptiveState> watchAdaptiveState(String scopeKey);
  Stream<List<AdaptiveState>> watchAllAdaptiveStates();
  Future<AdaptiveState> getAdaptiveState(String scopeKey);
  Future<AdaptiveState> updateStateWithAttempt({
    required String scopeKey,
    required bool isCorrect,
    required int responseTimeMs,
  });
}
