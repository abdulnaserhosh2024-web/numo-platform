import '../entities/learner.dart';
import '../repositories/learner_repository.dart';

class AddLearner {
  const AddLearner(this.repository);

  final LearnerRepository repository;

  Future<void> call(Learner learner) {
    return repository.create(learner);
  }
}
