import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

enum StatusBadgeType { active, inactive, pending, warning, success }

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.type});

  final String label;
  final StatusBadgeType type;

  Color get backgroundColor {
    switch (type) {
      case StatusBadgeType.active:
        return AppColors.success.withValues(alpha: 0.12);
      case StatusBadgeType.inactive:
        return AppColors.border;
      case StatusBadgeType.pending:
        return AppColors.warning.withValues(alpha: 0.12);
      case StatusBadgeType.warning:
        return AppColors.warning.withValues(alpha: 0.18);
      case StatusBadgeType.success:
        return AppColors.success.withValues(alpha: 0.18);
    }
  }

  Color get textColor {
    switch (type) {
      case StatusBadgeType.active:
        return AppColors.success;
      case StatusBadgeType.inactive:
        return AppColors.textSecondary;
      case StatusBadgeType.pending:
        return AppColors.warning;
      case StatusBadgeType.warning:
        return AppColors.warning;
      case StatusBadgeType.success:
        return AppColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
