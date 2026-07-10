import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import '../providers/learners_provider.dart';
import '../widgets/learner_card.dart';

class LearnersPage extends ConsumerWidget {
  const LearnersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final learnersAsync = ref.watch(learnersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Learners')),
      body: learnersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Something went wrong.',
                  style: AppTypography.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  error.toString(),
                  style: AppTypography.caption,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.md),
                FilledButton(
                  onPressed: () {
                    ref.read(learnersProvider.notifier).refresh();
                  },
                  child: const Text('Try again'),
                ),
              ],
            ),
          ),
        ),
        data: (learners) {
          if (learners.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('No learners yet', style: AppTypography.title),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Add your first learner.',
                      style: AppTypography.caption,
                    ),
                  ],
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () {
              return ref.read(learnersProvider.notifier).refresh();
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: learners.length,
              separatorBuilder: (_, __) {
                return const SizedBox(height: AppSpacing.md);
              },
              itemBuilder: (context, index) {
                final learner = learners[index];

                return LearnerCard(
                  learner: learner,
                  onTap: () {
                    // TODO: فتح Learning Workspace الخاصة بالمتعلم.
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
