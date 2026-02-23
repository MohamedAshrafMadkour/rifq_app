import 'package:flutter/material.dart';

class CustomBackgroundMessage extends StatelessWidget {
  const CustomBackgroundMessage({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
        gradient: isDark
            ? const LinearGradient(
                begin: Alignment(0.50, 0.00),
                end: Alignment(0.50, 1.00),
                colors: [
                  Color(0xFF3A3324), // بني غامق دافئ
                  Color(0xFF2C261B),
                ],
              )
            : const LinearGradient(
                begin: Alignment(0.50, 0.00),
                end: Alignment(0.50, 1.00),
                colors: [
                  Color(0xFFF4E5C2),
                  Color(0xFFE8D7B0),
                ],
              ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: isDark
                ? const Color(0x66D4AF37) // ذهبي شفاف
                : const Color(0xFFD4AF37),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
