
import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class NumoApp extends StatelessWidget {
  const NumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numo',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text(
            'Numo 2.0',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
