enum DifficultyTier {
  mid('Mid', 'Mid-Level', 0.35, 25000),
  senior('Senior', 'Senior-Level', 0.65, 40000),
  techLead('Tech Lead', 'Tech Lead', 0.90, 55000);

  final String label;
  final String description;
  final double questionWeight; // dq in Elo formula
  final int targetResponseTimeMs; // target response time in ms

  const DifficultyTier(
    this.label,
    this.description,
    this.questionWeight,
    this.targetResponseTimeMs,
  );

  static DifficultyTier fromString(String raw) {
    final lower = raw.trim().toLowerCase();
    if (lower.contains('tech') || lower.contains('lead')) {
      return DifficultyTier.techLead;
    }
    if (lower.contains('senior')) {
      return DifficultyTier.senior;
    }
    return DifficultyTier.mid;
  }
}
