import '../../domain/entities/goal.dart';
import '../../domain/repositories/goal_repository.dart';

class LocalGoalRepository implements GoalRepository {
  final List<Goal> _goals = [];

  @override
  Future<void> saveGoal(Goal goal) async {
    _goals.add(goal);
  }

  @override
  Future<Goal?> getGoalById(String id) async {
    try {
      return _goals.firstWhere((goal) => goal.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Goal>> getGoals() async {
    return List.unmodifiable(_goals);
  }

  @override
  Future<void> deleteGoal(String id) async {
    _goals.removeWhere((goal) => goal.id == id);
  }
}
