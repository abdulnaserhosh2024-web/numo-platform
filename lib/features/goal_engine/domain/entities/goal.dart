import 'goal_category.dart';
import 'goal_status.dart';

class Goal {
  const Goal({
    required this.id,
    required this.title,
    required this.category,
    required this.motivation,
    required this.successCriteria,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deadline,
  });
  bool get isReadyToStart {
    return title.trim().isNotEmpty &&
        motivation.trim().isNotEmpty &&
        successCriteria.trim().isNotEmpty;
  }

  final String id;
  final String title;
  final GoalCategory category;
  final String motivation;
  final String successCriteria;
  final GoalStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deadline;
}
