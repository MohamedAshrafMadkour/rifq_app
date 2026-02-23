import 'package:flutter/material.dart';

class ChoseIconItem extends StatelessWidget {
  const ChoseIconItem({
    required this.icon,
    required this.isSelected,
    super.key,
  });

  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: ShapeDecoration(
        color: isSelected
            ? const Color(0x190D7E5E)
            : (isDark ? const Color(0xFF242421) : Colors.white),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: isSelected
                ? const Color(0xFF0D7E5E)
                : (isDark ? const Color(0x1AFFFFFF) : const Color(0x1E0D7E5E)),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Icon(
        icon,
        color: isDark ? const Color(0xFFF2F2F0) : const Color(0xFF1A1A1A),
      ),
    );
  }
}
