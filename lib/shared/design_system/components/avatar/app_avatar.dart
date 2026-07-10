
import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_typography.dart';

enum AppAvatarSize {
  small,
  medium,
 large,
}

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    required this.name,
    this.imageUrl,
    this.size = AppAvatarSize.medium,
    this.backgroundColor,
  });

  final String name;
  final String? imageUrl;
  final AppAvatarSize size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final dimension = switch (size) {
      AppAvatarSize.small => 32.0,
      AppAvatarSize.medium => 48.0,
      AppAvatarSize.large => 64.0,
    };

    final initial = name.trim().isEmpty
        ? '?'
        : name.trim()[0].toUpperCase();

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: dimension / 2,
        backgroundImage: NetworkImage(imageUrl!),
      );
    }

    return CircleAvatar(
      radius: dimension / 2,
      backgroundColor: backgroundColor ?? AppColors.primary,
      child: Text(
        initial,
        style: AppTypography.body.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
