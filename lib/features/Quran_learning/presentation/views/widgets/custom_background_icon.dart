import 'package:flutter/material.dart';

class CustomBackgroundIcon extends StatelessWidget {
  const CustomBackgroundIcon({
    super.key,
    this.icon,
  });

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: ShapeDecoration(
        color: const Color(0xFFD4AF37),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        shadows: isDark
            ? const [
                BoxShadow(
                  color: Color(0x66D4AF37),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}
