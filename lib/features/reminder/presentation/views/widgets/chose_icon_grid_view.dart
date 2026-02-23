import 'package:flutter/material.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/chose_icon_item.dart';

class ChoseIconGridView extends StatefulWidget {
  const ChoseIconGridView({required this.onTap, super.key});
  final void Function(IconData iconCode) onTap;
  @override
  State<ChoseIconGridView> createState() => _ChoseIconGridViewState();
}

class _ChoseIconGridViewState extends State<ChoseIconGridView> {
  List<IconData> icons = [
    Icons.light_mode_outlined,
    Icons.dark_mode_outlined,
    Icons.alarm,
    Icons.favorite_outline,
    Icons.notifications_outlined,
    Icons.menu_book_outlined,
    Icons.coffee_outlined,
    Icons.wb_twilight,
    Icons.wb_twilight,
    Icons.star_outline,
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: icons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });

            widget.onTap(icons[index]);
          },
          child: ChoseIconItem(
            isSelected: selectedIndex == index,
            icon: icons[index],
          ),
        );
      },
    );
  }
}
