import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/learner.dart';
import 'learner_providers.dart';

part 'learners_provider.g.dart';

@riverpod
class Learners extends _$Learners {
  @override
  Future<List<Learner>> build() async {
    final getAllLearners = ref.watch(getAllLearnersProvider);

    return getAllLearners();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final getAllLearners = ref.read(getAllLearnersProvider);

      return getAllLearners();
    });
  }
}
