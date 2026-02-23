import 'package:flutter/material.dart';

class ReminderItemIcon extends StatelessWidget {
  const ReminderItemIcon({
    required this.colorsList,
    required this.icon,
    super.key,
  });
  final IconData icon;
  final List<Color> colorsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.50, 0.00),
          end: Alignment(0.50, 1.00),
          colors: colorsList,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 6,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
