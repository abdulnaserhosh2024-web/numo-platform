import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/goal_discovery_controller.dart';
import '../../widgets/goal_question_step.dart';

class GoalWhyPage extends ConsumerStatefulWidget {
  const GoalWhyPage({super.key});

  @override
  ConsumerState<GoalWhyPage> createState() => _GoalWhyPageState();
}

class _GoalWhyPageState extends ConsumerState<GoalWhyPage> {
  final TextEditingController _controller = TextEditingController();

  bool get _canContinue => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();

    final draft = ref.read(goalDiscoveryControllerProvider);
    _controller.text = draft.motivation ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    ref.read(goalDiscoveryControllerProvider.notifier).updateMotivation(value);

    setState(() {});
  }

  void _continue() {
    if (!_canContinue) return;

    FocusScope.of(context).unfocus();

    // TODO: الانتقال إلى GoalSuccessPage
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(goalDiscoveryControllerProvider);

    return GoalQuestionStep(
      currentStep: 2,
      totalSteps: 3,
      title: 'لماذا يعتبر هذا الهدف مهمًا بالنسبة لك؟',
      description: 'ما الذي سيتغير في حياتك عندما تحققه؟',
      label: 'سبب الهدف',
      hintText: 'مثال: أريد الدراسة في ألمانيا.',
      controller: _controller,
      onChanged: _onChanged,
      onContinue: _continue,
      canContinue: _canContinue,
    );
  }
}
