
import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'package:numo/features/learner/presentation/pages/learners_page.dart';

class NumoApp extends StatelessWidget {
  const NumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const LearnersPage(),
    );
  }
}
