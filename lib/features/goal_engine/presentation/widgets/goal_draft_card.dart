import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/design_system/components/cards/app_info_card.dart';
import '../../domain/value_objects/goal_draft.dart';
import '../controllers/goal_discovery_controller.dart';

class GoalDraftCard extends ConsumerWidget {
  const GoalDraftCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(goalDiscoveryControllerProvider);

    return AppInfoCard(
      title: '🎯 رحلتك حتى الآن',
      child: _DraftContent(draft: draft),
    );
  }
}

class _DraftContent extends StatelessWidget {
  const _DraftContent({required this.draft});

  final GoalDraft draft;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if ((draft.desiredOutcome ?? '').isNotEmpty) ...[
          const Text('🎯 الهدف', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(draft.desiredOutcome!),
          const SizedBox(height: 16),
        ],

        if ((draft.motivation ?? '').isNotEmpty) ...[
          const Text(
            '❤️ الدافع',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(draft.motivation!),
          const SizedBox(height: 16),
        ],

        if ((draft.successCriteria ?? '').isNotEmpty) ...[
          const Text(
            '🏁 النجاح',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(draft.successCriteria!),
        ],
      ],
    );
  }
}
