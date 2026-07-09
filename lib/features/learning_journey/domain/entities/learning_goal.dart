
enum LearningGoalStatus {
  notStarted,
  inProgress,
  completed,
  paused,
  cancelled,
}

enum LearningGoalPriority {
  low,
  medium,
  high,
}

class LearningGoal {
  const LearningGoal({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.createdAt,
    required this.updatedAt,
    this.targetDate,
  });

  final String id;
  final String title;
  final String description;
  final LearningGoalStatus status;
  final LearningGoalPriority priority;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? targetDate;
}
