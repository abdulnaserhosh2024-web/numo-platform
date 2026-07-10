import '../../domain/entities/learner.dart';
import '../../domain/repositories/learner_repository.dart';

class FakeLearnerRepository implements LearnerRepository {
  final List<Learner> _learners = [
    Learner(
      id: '1',
      fullName: 'Ahmed Ali',
      email: 'ahmed@example.com',
      status: LearnerStatus.active,
      createdAt: DateTime(2026, 1, 1),
      updatedAt: DateTime(2026, 1, 1),
    ),
    Learner(
      id: '2',
      fullName: 'Sara Omar',
      email: 'sara@example.com',
      status: LearnerStatus.active,
      createdAt: DateTime(2026, 1, 2),
      updatedAt: DateTime(2026, 1, 2),
    ),
  ];

  @override
  Future<List<Learner>> getAll() async {
    return _learners;
  }

  @override
  Future<Learner?> getById(String id) async {
    try {
      return _learners.firstWhere((learner) => learner.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> create(Learner learner) async {
    _learners.add(learner);
  }

  @override
  Future<void> update(Learner learner) async {
    final index = _learners.indexWhere((item) => item.id == learner.id);

    if (index == -1) {
      return;
    }

    _learners[index] = learner;
  }

  @override
  Future<void> delete(String id) async {
    _learners.removeWhere((learner) => learner.id == id);
  }
}
