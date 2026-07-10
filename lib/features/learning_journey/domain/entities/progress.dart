enum ProgressLevel { excellent, good, needsImprovement, critical }

class Progress {
  const Progress({
    required this.goalId,
    required this.percentage,
    required this.level,
    required this.lastUpdated,
  });

  final String goalId;

  /// قيمة من 0 إلى 100
  final double percentage;

  final ProgressLevel level;

  final DateTime lastUpdated;
}
