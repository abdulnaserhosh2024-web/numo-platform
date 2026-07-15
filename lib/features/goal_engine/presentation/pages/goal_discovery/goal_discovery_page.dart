import 'package:flutter/material.dart';

import '../../../../../shared/design_system/components/buttons/primary_button.dart';
import '../../../../../shared/design_system/components/inputs/app_text_field.dart';
import '../../../../../shared/design_system/components/progress/step_indicator.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class GoalDiscoveryPage extends StatefulWidget {
  const GoalDiscoveryPage({super.key});

  @override
  State<GoalDiscoveryPage> createState() => _GoalDiscoveryPageState();
}

class _GoalDiscoveryPageState extends State<GoalDiscoveryPage> {
  final TextEditingController _controller = TextEditingController();

  bool get _canContinue => _controller.text.trim().isNotEmpty;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _continue() {
    // TODO: الانتقال إلى Step 2
    debugPrint(_controller.text);
  }

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

              const StepIndicator(currentStep: 1, totalSteps: 3),

              const SizedBox(height: AppSpacing.xl),

              Text(
                'ما الذي تريد تحقيقه؟',
                textAlign: TextAlign.right,
                style: AppTypography.headline,
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                'تخيل أننا التقينا بعد عدة أشهر...\n'
                'ما الشيء الذي تتمنى أن تكون قد حققته؟',
                textAlign: TextAlign.right,
                style: AppTypography.body,
              ),

              const SizedBox(height: AppSpacing.xl),

              AppTextField(
                controller: _controller,
                label: 'ما تريد تحقيقه',
                hintText: 'مثال: أريد الحصول على درجة 95 في الرياضيات.',
                onChanged: (_) {
                  setState(() {});
                },
              ),

              const Spacer(),

              PrimaryButton(
                label: 'متابعة',
                onPressed: _canContinue ? _continue : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
