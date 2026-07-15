import '../entities/goal.dart';

abstract interface class GoalRepository {
  Future<void> saveGoal(Goal goal);

  Future<Goal?> getGoalById(String id);

  Future<List<Goal>> getGoals();

  Future<void> deleteGoal(String id);
}
