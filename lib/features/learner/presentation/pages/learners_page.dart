import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/learners_provider.dart';

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
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final learner = items[index];

              return ListTile(
                leading: CircleAvatar(child: Text(learner.fullName[0])),
                title: Text(learner.fullName),
                subtitle: Text(learner.email ?? 'No email'),
              );
            },
          );
        },
      ),
    );
  }
}
