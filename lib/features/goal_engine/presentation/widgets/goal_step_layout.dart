import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/buttons/primary_button.dart';
import '../../../../shared/design_system/components/progress/step_indicator.dart';
import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';

class GoalStepLayout extends StatelessWidget {
  const GoalStepLayout({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    required this.description,
    required this.child,
    required this.buttonLabel,
    required this.onContinue,
  });

  final int currentStep;
  final int totalSteps;

  final String title;
  final String description;

  final Widget child;

  final String buttonLabel;

  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),

              StepIndicator(currentStep: currentStep, totalSteps: totalSteps),

              const SizedBox(height: AppSpacing.xl),

              Text(
                title,
                textAlign: TextAlign.right,
                style: AppTypography.headline,
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                description,
                textAlign: TextAlign.right,
                style: AppTypography.body,
              ),

              const SizedBox(height: AppSpacing.xl),

              child,

              const Spacer(),

              PrimaryButton(label: buttonLabel, onPressed: onContinue),
            ],
          ),
        ),
      ),
    );
  }
}
