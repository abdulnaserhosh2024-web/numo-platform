
enum LearningJourneyStatus {
  active,
  paused,
  completed,
  cancelled,
}

class LearningJourney {
  const LearningJourney({
    required this.id,
    required this.mentorId,
    required this.learnerId,
    required this.title,
    required this.status,
    required this.startDate,
    this.targetDate,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String mentorId;
  final String learnerId;
  final String title;
  final LearningJourneyStatus status;
  final DateTime startDate;
  final DateTime? targetDate;
  final DateTime createdAt;
  final DateTime updatedAt;
}
