import 'package:flutter/material.dart';

import '../../../domain/entities/goal.dart';
import '../../../../../shared/design_system/components/cards/app_info_card.dart';
import '../../../../../shared/design_system/tokens/app_spacing.dart';
import '../../../../../shared/design_system/tokens/app_typography.dart';

class GoalWorkspacePage extends StatelessWidget {
  const GoalWorkspacePage({super.key, required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مساحة الهدف'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '🎯 هدفك الحالي',
                textAlign: TextAlign.right,
                style: AppTypography.headline,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppInfoCard(
                title: 'الهدف',
                child: Text(
                  goal.title,
                  textAlign: TextAlign.right,
                  style: AppTypography.body,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppInfoCard(
                title: 'لماذا هذا الهدف مهم؟',
                child: Text(
                  goal.motivation,
                  textAlign: TextAlign.right,
                  style: AppTypography.body,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppInfoCard(
                title: 'كيف ستعرف أنك نجحت؟',
                child: Text(
                  goal.successCriteria,
                  textAlign: TextAlign.right,
                  style: AppTypography.body,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const AppInfoCard(
                title: 'الخطوة التالية',
                child: Text(
                  'سنبدأ قريبًا ببناء خطتك التعليمية ومساعدتك في العثور على المدرس المناسب.',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
