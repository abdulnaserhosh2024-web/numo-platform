import '../../domain/entities/goal.dart';
import '../../domain/entities/goal_status.dart';

class MarkGoalReady {
  const MarkGoalReady();

  Goal call(Goal goal) {
    if (!goal.isReadyToStart) {
      throw StateError(
        'Goal must have a title, motivation, and success criteria.',
      );
    }

    return Goal(
      id: goal.id,
      title: goal.title,
      category: goal.category,
      motivation: goal.motivation,
      successCriteria: goal.successCriteria,
      status: GoalStatus.ready,
      createdAt: goal.createdAt,
      updatedAt: DateTime.now(),
      deadline: goal.deadline,
    );
  }
}
