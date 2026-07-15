import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/goal_discovery_controller.dart';
import '../../widgets/goal_draft_card.dart';
import '../../widgets/goal_question_step.dart';
import 'goal_review_page.dart';

class GoalSuccessPage extends ConsumerStatefulWidget {
  const GoalSuccessPage({super.key});

  @override
  ConsumerState<GoalSuccessPage> createState() => _GoalSuccessPageState();
}

class _GoalSuccessPageState extends ConsumerState<GoalSuccessPage> {
  final TextEditingController _controller = TextEditingController();

  bool get _canContinue => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();

    final draft = ref.read(goalDiscoveryControllerProvider);
    _controller.text = draft.successCriteria ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    ref
        .read(goalDiscoveryControllerProvider.notifier)
        .updateSuccessCriteria(value);

    setState(() {});
  }

  void _continue() {
    if (!_canContinue) return;

    FocusScope.of(context).unfocus();

    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const GoalReviewPage()));
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(goalDiscoveryControllerProvider);

    return GoalQuestionStep(
      currentStep: 3,
      totalSteps: 3,
      header: const GoalDraftCard(),
      title: 'كيف ستعرف أنك حققت هذا الهدف؟',
      description: 'صف علامة واضحة تدل على أنك وصلت إلى هدفك.',
      label: 'علامة النجاح',
      hintText: 'مثال: الحصول على معدل 95 أو أكثر.',
      controller: _controller,
      onChanged: _onChanged,
      onContinue: _continue,
      canContinue: _canContinue,
    );
  }
}
