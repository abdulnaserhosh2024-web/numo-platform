import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/avatar/app_avatar.dart';
import '../../../../shared/design_system/components/badges/status_badge.dart';
import '../../../../shared/design_system/components/cards/app_card.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import '../../domain/entities/learner.dart';
import '../extensions/learner_status_extension.dart';

class LearnerCard extends StatelessWidget {
  const LearnerCard({required this.learner, this.onTap, super.key});

  final Learner learner;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          AppAvatar(name: learner.fullName),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(learner.fullName, style: AppTypography.title),
                const SizedBox(height: AppSpacing.xs),
                StatusBadge(
                  label: learner.status.label,
                  type: learner.status.badgeType,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
