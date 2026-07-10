import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../learning_workspace/presentation/pages/learning_workspace_page.dart';
import '../providers/learners_provider.dart';
import '../widgets/learner_card.dart';

class LearnersPage extends ConsumerWidget {
  const LearnersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final learners = ref.watch(learnersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Learners')),
      body: learners.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No learners found'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              final learner = items[index];

              return LearnerCard(
                learner: learner,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => LearningWorkspacePage(learner: learner),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
