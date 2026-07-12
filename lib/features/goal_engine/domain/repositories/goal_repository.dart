
import '../entities/goal.dart';

abstract class GoalRepository {
  Future<void> create(Goal goal);

  Future<Goal?> findById(String id);

  Future<List<Goal>> findAll();

  Future<void> update(Goal goal);

  Future<void> delete(String id);
}
