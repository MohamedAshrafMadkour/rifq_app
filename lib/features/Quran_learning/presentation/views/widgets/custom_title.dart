import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Text(
      title,
      style: AppStyles.textMedium20(context).copyWith(
        color: isDark ? const Color(0xFFF2F2F0) : const Color(0xFF1A1A1A),
      ),
    );
  }
}
