import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/local_goal_repository.dart';
import '../../domain/repositories/goal_repository.dart';
import '../usecases/create_goal.dart';

final goalRepositoryProvider = Provider<GoalRepository>(
  (ref) => LocalGoalRepository(),
);

final createGoalProvider = Provider<CreateGoal>(
  (ref) => CreateGoal(ref.read(goalRepositoryProvider)),
);
