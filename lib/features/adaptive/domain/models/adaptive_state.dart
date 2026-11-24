import 'difficulty_tier.dart';

class AdaptiveState {
  final String scopeKey; // e.g. "Flutter & Dart", "Native Android..."
  final double rating; // 0.0 - 100.0
  final DifficultyTier currentTier;
  final int attemptsCount;
  final int questionsAtCurrentTier;
  final DateTime lastUpdatedAt;
  final String? lastFeedback; // e.g. "Level Up -> Senior"

  const AdaptiveState({
    required this.scopeKey,
    required this.rating,
    required this.currentTier,
    required this.attemptsCount,
    required this.questionsAtCurrentTier,
    required this.lastUpdatedAt,
    this.lastFeedback,
  });

  factory AdaptiveState.initial(String scopeKey) {
    return AdaptiveState(
      scopeKey: scopeKey,
      rating: 35.0,
      currentTier: DifficultyTier.mid,
      attemptsCount: 0,
      questionsAtCurrentTier: 0,
      lastUpdatedAt: DateTime.now(),
      lastFeedback: null,
    );
  }

  AdaptiveState copyWith({
    String? scopeKey,
    double? rating,
    DifficultyTier? currentTier,
    int? attemptsCount,
    int? questionsAtCurrentTier,
    DateTime? lastUpdatedAt,
    String? lastFeedback,
  }) {
    return AdaptiveState(
      scopeKey: scopeKey ?? this.scopeKey,
      rating: rating ?? this.rating,
      currentTier: currentTier ?? this.currentTier,
      attemptsCount: attemptsCount ?? this.attemptsCount,
      questionsAtCurrentTier:
          questionsAtCurrentTier ?? this.questionsAtCurrentTier,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      lastFeedback: lastFeedback ?? this.lastFeedback,
    );
  }
}
