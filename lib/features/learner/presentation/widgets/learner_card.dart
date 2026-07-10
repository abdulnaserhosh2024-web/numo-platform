import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/avatar/app_avatar.dart';
import '../../../../shared/design_system/components/cards/app_card.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import '../../domain/entities/learner.dart';

class LearnerCard extends StatelessWidget {
  const LearnerCard({
    super.key,
    required this.learner,
    this.onTap,
  });

  final Learner learner;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          AppAvatar(
            name: learner.fullName,
          ),

          const SizedBox(width: AppSpacing.md),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  learner.fullName,
                  style: AppTypography.title,
                ),

                const SizedBox(height: AppSpacing.xs),

                Text(
                  learner.status.name.toUpperCase(),
                  style: AppTypography.caption,
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
