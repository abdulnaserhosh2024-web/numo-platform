import 'package:flutter/material.dart';

import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class WorkspaceGreeting extends StatelessWidget {
  const WorkspaceGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '☀️ صباح الخير',
          style: AppTypography.headline,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'لنحقق هدفك اليوم.',
          style: AppTypography.body,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
