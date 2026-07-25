import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/design_system/components/buttons/primary_button.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';
import '../../../application/providers/goal_providers.dart';
import '../../controllers/goal_discovery_controller.dart';
import '../../widgets/goal_draft_card.dart';
import '../workspace/goal_workspace_page.dart';

class GoalReviewPage extends ConsumerStatefulWidget {
  const GoalReviewPage({super.key});

  @override
  ConsumerState<GoalReviewPage> createState() => _GoalReviewPageState();
}

class _GoalReviewPageState extends ConsumerState<GoalReviewPage> {
  bool _isCreating = false;

  Future<void> _createGoal() async {
    final draft = ref.read(goalDiscoveryControllerProvider);

    if (!draft.isComplete || _isCreating) {
      return;
    }

    setState(() {
      _isCreating = true;
    });

    try {
      final goal = await ref.read(createGoalProvider)(draft);

      if (!mounted) return;

      ref.read(goalDiscoveryControllerProvider.notifier).reset();

      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<void>(builder: (_) => GoalWorkspacePage(goal: goal)),
        (route) => false,
      );
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _isCreating = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لم نتمكن من إنشاء هدفك. حاول مرة أخرى.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(goalDiscoveryControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppSpacing.lg),

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
                        'لقد أصبح هدفك واضحًا.\n'
                        'راجع التفاصيل قبل البدء.',
                        textAlign: TextAlign.center,
                        style: AppTypography.body,
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      const GoalDraftCard(),

                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              OutlinedButton(
                onPressed: _isCreating
                    ? null
                    : () {
                        Navigator.of(context).pop();
                      },
                child: const Text('العودة للتعديل'),
              ),

              const SizedBox(height: AppSpacing.md),

              PrimaryButton(
                label: _isCreating ? 'جاري إنشاء الهدف...' : 'ابدأ رحلتي',
                onPressed: draft.isComplete && !_isCreating
                    ? _createGoal
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
