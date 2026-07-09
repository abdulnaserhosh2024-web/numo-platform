class Assessment {
  const Assessment({
    required this.id,
    required this.goalId,
    required this.title,
    required this.score,
    required this.maxScore,
    required this.createdAt,
    this.notes,
  });

  final String id;

  final String goalId;

  final String title;

  final double score;

  final double maxScore;

  final String? notes;

  final DateTime createdAt;

  double get percentage => (score / maxScore) * 100;
}
