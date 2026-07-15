import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/goal_discovery_controller.dart';
import '../../widgets/goal_question_step.dart';
import 'goal_why_page.dart';

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
    if (!_canContinue) return;

    FocusScope.of(context).unfocus();

    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const GoalWhyPage()));
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(goalDiscoveryControllerProvider);

    return GoalQuestionStep(
      currentStep: 1,
      totalSteps: 3,
      title: 'ما الذي تريد تحقيقه؟',
      description:
          'تخيل أننا التقينا بعد عدة أشهر...\n'
          'ما الشيء الذي تتمنى أن تكون قد حققته؟',
      label: 'ما تريد تحقيقه',
      hintText: 'مثال: أريد الحصول على درجة 95 في الرياضيات.',
      controller: _controller,
      onChanged: _onOutcomeChanged,
      onContinue: _continue,
      canContinue: _canContinue,
    );
  }
}
