import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/goal_engine/presentation/pages/goal_welcome_page.dart';

class NumoApp extends StatelessWidget {
  const NumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {'/': (_) => const GoalWelcomePage()},
    );
  }
}
