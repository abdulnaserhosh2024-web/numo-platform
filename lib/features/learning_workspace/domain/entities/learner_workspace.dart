import '../../../learner/domain/entities/learner.dart';
import '../../../learning_journey/domain/entities/learning_goal.dart';
import '../../../learning_journey/domain/entities/learning_journey.dart';
import '../../../learning_journey/domain/entities/learning_session.dart';

class LearnerWorkspace {
  const LearnerWorkspace({
    required this.learner,
    required this.journey,
    required this.progress,
    this.currentGoal,
    this.nextSession,
    this.lastSession,
  });

  final Learner learner;

  final LearningJourney journey;

  final LearningGoal? currentGoal;

  final LearningSession? nextSession;

  final LearningSession? lastSession;

  /// قيمة من 0 إلى 1
  final double progress;
}
