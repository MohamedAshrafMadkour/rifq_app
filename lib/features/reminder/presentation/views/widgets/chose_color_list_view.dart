import 'package:flutter/material.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/chose_color_item.dart';

class ChoseColorListView extends StatefulWidget {
  const ChoseColorListView({required this.onTap, super.key});
  final void Function(List<Color> colors) onTap;
  @override
  State<ChoseColorListView> createState() => _ChoseColorListViewState();
}

class _ChoseColorListViewState extends State<ChoseColorListView> {
  int selectedIndex = -2;
  List<List<Color>> colors = [
    [const Color(0xFF0D7E5E), const Color(0xFF0A6349)],
    [const Color(0xFFD4AF37), const Color(0xFFC4941F)],
    [const Color(0xFF3B82F6), const Color(0xFF2563EB)],
    [const Color(0xFF9333EA), const Color(0xFF7C3AED)],
    [const Color(0xFFEC4899), const Color(0xFFDB2777)],
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(colors[index]);
            },
            child: SizedBox(
              width: (screenWidth - 40) / colors.length, // يقسم الشاشة عليهم
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ChoseColorItem(
                  colors: colors[index],
                  isSelected: index == selectedIndex,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
