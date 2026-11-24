import 'package:isar_community/isar.dart';
import '../../domain/models/adaptive_state.dart';
import '../../domain/models/difficulty_tier.dart';

part 'adaptive_profile_record.g.dart';

@collection
class AdaptiveProfileRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String scopeKey;

  late double rating;

  @Enumerated(EnumType.name)
  DifficultyTier tier = DifficultyTier.mid;

  late int attemptsCount;
  late int questionsAtCurrentTier;
  late DateTime updatedAt;
  String? lastFeedback;

  AdaptiveState toDomain() {
    return AdaptiveState(
      scopeKey: scopeKey,
      rating: rating,
      currentTier: tier,
      attemptsCount: attemptsCount,
      questionsAtCurrentTier: questionsAtCurrentTier,
      lastUpdatedAt: updatedAt,
      lastFeedback: lastFeedback,
    );
  }

  static AdaptiveProfileRecord fromDomain(AdaptiveState state) {
    return AdaptiveProfileRecord()
      ..scopeKey = state.scopeKey
      ..rating = state.rating
      ..tier = state.currentTier
      ..attemptsCount = state.attemptsCount
      ..questionsAtCurrentTier = state.questionsAtCurrentTier
      ..updatedAt = state.lastUpdatedAt
      ..lastFeedback = state.lastFeedback;
  }
}
