import '../entities/learner_workspace.dart';
import '../repositories/learner_workspace_repository.dart';

class GetLearnerWorkspace {
  const GetLearnerWorkspace(this.repository);

  final LearnerWorkspaceRepository repository;

  Future<LearnerWorkspace> call(String learnerId) {
    return repository.getWorkspace(learnerId);
  }
}
