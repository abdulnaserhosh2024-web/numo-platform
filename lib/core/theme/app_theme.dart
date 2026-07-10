import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B82F6)),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    );
  }
}
