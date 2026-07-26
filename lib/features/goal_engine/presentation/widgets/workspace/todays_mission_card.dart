import 'package:flutter/material.dart';

import '../../../../../shared/design_system/components/cards/app_info_card.dart';
import '../../../../../shared/design_system/components/buttons/primary_button.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class TodaysMissionCard extends StatelessWidget {
  const TodaysMissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInfoCard(
      title: '📅 مهمة اليوم',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'لم يتم إنشاء خطة بعد.',
            textAlign: TextAlign.right,
            style: AppTypography.body,
          ),
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(
            label: 'أنشئ أول خطة',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
