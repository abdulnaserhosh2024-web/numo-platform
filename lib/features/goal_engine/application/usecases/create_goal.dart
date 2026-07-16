import 'dart:math';

import '../../domain/entities/goal.dart';
import '../../domain/entities/goal_category.dart';
import '../../domain/entities/goal_status.dart';
import '../../domain/repositories/goal_repository.dart';
import '../../domain/value_objects/goal_draft.dart';

class CreateGoal {
  const CreateGoal(this.repository);

  final GoalRepository repository;

  Future<Goal> call(GoalDraft draft) async {
    final now = DateTime.now();

    final goal = Goal(
      id: _generateId(),
      title: draft.desiredOutcome!.trim(),
      category: GoalCategory.other,
      motivation: draft.motivation!.trim(),
      successCriteria: draft.successCriteria!.trim(),
      status: GoalStatus.draft,
      createdAt: now,
      updatedAt: now,
      deadline: null,
    );

    await repository.saveGoal(goal);

    return goal;
  }

  String _generateId() {
    final random = Random();
    return '${DateTime.now().millisecondsSinceEpoch}${random.nextInt(99999)}';
  }
}
