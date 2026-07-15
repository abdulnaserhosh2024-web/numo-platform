import '../../domain/entities/goal.dart';
import '../../domain/entities/goal_category.dart';
import '../../domain/entities/goal_status.dart';
import '../../domain/repositories/goal_repository.dart';

class CreateGoalRequest {
  const CreateGoalRequest({
    required this.id,
    required this.title,
    required this.category,
    required this.motivation,
    required this.successCriteria,
    this.deadline,
  });

  final String id;
  final String title;
  final GoalCategory category;
  final String motivation;
  final String successCriteria;
  final DateTime? deadline;
}

class CreateGoal {
  const CreateGoal(this.repository);

  final GoalRepository repository;

  Future<Goal> call(CreateGoalRequest request) async {
    final now = DateTime.now();

    final goal = Goal(
      id: request.id,
      title: request.title.trim(),
      category: request.category,
      motivation: request.motivation.trim(),
      successCriteria: request.successCriteria.trim(),
      status: GoalStatus.draft,
      createdAt: now,
      updatedAt: now,
      deadline: request.deadline,
    );

    await repository.saveGoal(goal);

    return goal;
  }
}
