import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/fake_learner_repository.dart';
import '../../domain/repositories/learner_repository.dart';
import '../../domain/usecases/get_all_learners.dart';

part 'learner_providers.g.dart';

@riverpod
LearnerRepository learnerRepository(Ref ref) {
  return FakeLearnerRepository();
}

@riverpod
GetAllLearners getAllLearners(Ref ref) {
  return GetAllLearners(ref.watch(learnerRepositoryProvider));
}
