
import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/avatar/app_avatar.dart';
import '../../../../shared/design_system/components/badges/status_badge.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import '../../../learner/domain/entities/learner.dart';
import '../../../learner/presentation/extensions/learner_status_extension.dart';

class WorkspaceHeader extends StatelessWidget {
  const WorkspaceHeader({
    super.key,
    required this.fullName,
    required this.status,
    this.imageUrl,
  });

  final String fullName;
  final LearnerStatus status;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppAvatar(
          name: fullName,
          imageUrl: imageUrl,
          size: AppAvatarSize.large,
        ),

        const SizedBox(height: AppSpacing.md),

        Text(
          fullName,
          style: AppTypography.headline,
        ),

        const SizedBox(height: AppSpacing.sm),

        StatusBadge(
          label: status.label,
          type: status.badgeType,
        ),
      ],
    );
  }
}
