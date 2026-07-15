import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/goal_discovery_controller.dart';
import '../../widgets/goal_draft_card.dart';
import '../../../../../shared/design_system/components/buttons/primary_button.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class GoalReviewPage extends ConsumerWidget {
  const GoalReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(goalDiscoveryControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              const Text(
                '🎉',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 56),
              ),

              const SizedBox(height: AppSpacing.lg),

              Text(
                'رائع!',
                textAlign: TextAlign.center,
                style: AppTypography.headline,
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                'لقد أصبح هدفك واضحًا.\nراجع التفاصيل قبل البدء.',
                textAlign: TextAlign.center,
                style: AppTypography.body,
              ),

              const SizedBox(height: AppSpacing.xl),

              const GoalDraftCard(),

              const Spacer(),

              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('تعديل'),
              ),

              const SizedBox(height: AppSpacing.md),

              PrimaryButton(
                label: 'ابدأ رحلتي',
                onPressed: () {
                  // TODO: CreateGoal + الانتقال إلى Workspace
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
