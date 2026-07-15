import 'package:flutter/material.dart';

import '../../../../shared/design_system/components/buttons/primary_button.dart';
import '../../../../shared/design_system/tokens/app_typography.dart';
import 'goal_discovery/goal_discovery_page.dart';

class GoalWelcomePage extends StatelessWidget {
  const GoalWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Expanded(child: _Content()),
              PrimaryButton(
                label: 'ابدأ رحلتي',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const GoalDiscoveryPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🎯', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 32),
            Text(
              'ابدأ رحلتك اليوم',
              textAlign: TextAlign.center,
              style: AppTypography.headline,
            ),
            const SizedBox(height: 16),
            Text(
              'كل إنجاز عظيم يبدأ بهدف واحد.\n'
              'سنساعدك على تحويل حلمك إلى خطة واضحة، '
              'ونرافقك حتى تحققه.',
              textAlign: TextAlign.center,
              style: AppTypography.body,
            ),
          ],
        ),
      ),
    );
  }
}
