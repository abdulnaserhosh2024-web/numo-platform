import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/inputs/app_text_field.dart';
import 'goal_step_layout.dart';

class GoalQuestionStep extends StatelessWidget {
  const GoalQuestionStep({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    required this.description,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.onContinue,
    required this.canContinue,
    this.header,
  });

  final int currentStep;
  final int totalSteps;
  final String title;
  final String description;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onContinue;
  final bool canContinue;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return GoalStepLayout(
      currentStep: currentStep,
      totalSteps: totalSteps,
      title: title,
      description: description,
      header: header,
      buttonLabel: 'متابعة',
      onContinue: canContinue ? onContinue : null,
      child: AppTextField(
        controller: controller,
        label: label,
        hintText: hintText,
        onChanged: onChanged,
      ),
    );
  }
}
