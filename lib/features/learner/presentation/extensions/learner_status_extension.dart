import '../../../../shared/design_system/components/badges/status_badge.dart';
import '../../domain/entities/learner.dart';

extension LearnerStatusX on LearnerStatus {
  StatusBadgeType get badgeType {
    switch (this) {
      case LearnerStatus.active:
        return StatusBadgeType.active;

      case LearnerStatus.inactive:
        return StatusBadgeType.inactive;

      case LearnerStatus.archived:
        return StatusBadgeType.inactive;
    }
  }

  String get label {
    switch (this) {
      case LearnerStatus.active:
        return 'ACTIVE';

      case LearnerStatus.inactive:
        return 'INACTIVE';

      case LearnerStatus.archived:
        return 'ARCHIVED';
    }
  }
}
