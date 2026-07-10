import '../entities/learner.dart';

abstract interface class LearnerRepository {
  Future<List<Learner>> getAll();

  Future<Learner?> getById(String id);

  Future<void> create(Learner learner);

  Future<void> update(Learner learner);

  Future<void> delete(String id);
}
