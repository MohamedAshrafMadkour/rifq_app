import 'package:flutter/material.dart';

class ChoseColorItem extends StatelessWidget {
  const ChoseColorItem({
    required this.colors,
    required this.isSelected,
    super.key,
  });
  final List<Color> colors;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isSelected ? 1 : .6,
      child: Container(
        height: 50,

        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, 0.00),
            end: Alignment(0.50, 1.00),
            colors: colors,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
