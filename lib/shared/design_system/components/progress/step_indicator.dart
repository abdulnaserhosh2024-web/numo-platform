
import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_spacing.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalSteps,
        (index) {
          final isActive = index < currentStep;

          return Expanded(
            child: Container(
              height: 4,
              margin: EdgeInsets.only(
                right: index == totalSteps - 1 ? 0 : AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primary
                    : AppColors.border,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          );
        },
      ),
    );
  }
}
