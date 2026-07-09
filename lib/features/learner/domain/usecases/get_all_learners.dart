
import '../entities/learner.dart';
import '../repositories/learner_repository.dart';

class GetAllLearners {
  const GetAllLearners(this._repository);

  final LearnerRepository _repository;

  Future<List<Learner>> call() {
    return _repository.getAll();
  }
}
