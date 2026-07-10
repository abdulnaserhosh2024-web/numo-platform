import '../entities/learner_workspace.dart';

abstract interface class LearnerWorkspaceRepository {
  Future<LearnerWorkspace> getWorkspace(String learnerId);
}
