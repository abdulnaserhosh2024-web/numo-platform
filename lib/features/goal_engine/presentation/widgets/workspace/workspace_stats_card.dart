import 'package:flutter/material.dart';

import '../../../../../shared/design_system/components/cards/app_info_card.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class WorkspaceStatsCard extends StatelessWidget {
  const WorkspaceStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppInfoCard(
      title: '📊 إحصائيات',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem('🔥', '0', 'أيام'),
          _StatItem('📚', '0', 'ساعات'),
          _StatItem('✅', '0', 'جلسات'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem(this.emoji, this.value, this.label);

  final String emoji;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 26)),
        Text(value, style: AppTypography.headline),
        Text(label, style: AppTypography.caption),
      ],
    );
  }
}
