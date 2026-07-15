import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/design_system/components/inputs/app_text_field.dart';
import '../../controllers/goal_discovery_controller.dart';
import '../../widgets/goal_step_layout.dart';

class GoalDiscoveryPage extends ConsumerStatefulWidget {
  const GoalDiscoveryPage({super.key});

  @override
  ConsumerState<GoalDiscoveryPage> createState() => _GoalDiscoveryPageState();
}

class _GoalDiscoveryPageState extends ConsumerState<GoalDiscoveryPage> {
  final TextEditingController _controller = TextEditingController();

  bool get _canContinue => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();

    final draft = ref.read(goalDiscoveryControllerProvider);
    _controller.text = draft.desiredOutcome ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onOutcomeChanged(String value) {
    ref.read(goalDiscoveryControllerProvider.notifier).updateOutcome(value);

    setState(() {});
  }

  void _continue() {
    if (!_canContinue) {
      return;
    }

    FocusScope.of(context).unfocus();

    // TODO: الانتقال إلى صفحة الدافع.
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(goalDiscoveryControllerProvider);

    return GoalStepLayout(
      currentStep: 1,
      totalSteps: 3,
      title: 'ما الذي تريد تحقيقه؟',
      description:
          'تخيل أننا التقينا بعد عدة أشهر...\n'
          'ما الشيء الذي تتمنى أن تكون قد حققته؟',
      buttonLabel: 'متابعة',
      onContinue: _canContinue ? _continue : null,
      child: AppTextField(
        controller: _controller,
        label: 'ما تريد تحقيقه',
        hintText: 'مثال: أريد الحصول على درجة 95 في الرياضيات.',
        onChanged: _onOutcomeChanged,
      ),
    );
  }
}
