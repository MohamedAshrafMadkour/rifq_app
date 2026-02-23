import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.hint, super.key, this.onSubmitted});
  final String? hint;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      onSubmitted: onSubmitted,
      style: TextStyle(
        color: isDark ? const Color(0xFFF2F2F0) : Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyles.textRegular14(context).copyWith(
          color: isDark ? const Color(0xFF9E9E9B) : const Color(0xFF6B6B6B),
        ),
        filled: true,
        fillColor: isDark ? const Color(0xFF242421) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
