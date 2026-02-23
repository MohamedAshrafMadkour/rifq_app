import 'package:flutter/material.dart';

class MorningEveningDropdown extends StatefulWidget {
  const MorningEveningDropdown({super.key});

  @override
  State<MorningEveningDropdown> createState() => _MorningEveningDropdownState();
}

class _MorningEveningDropdownState extends State<MorningEveningDropdown> {
  final List<String> items = ['صباحًا', 'مساءً'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

      decoration: BoxDecoration(
        color: Colors.white, // خلفية بيضا ✅
        borderRadius: BorderRadius.circular(12),
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedIndex,
          dropdownColor: Colors.white,
          isExpanded: true, // علشان يملى العرض

          items: List.generate(
            items.length,
            (index) => DropdownMenuItem<int>(
              value: index,
              child: Text(items[index]),
            ),
          ),

          onChanged: (value) {
            setState(() {
              selectedIndex = value!;
            });
          },
        ),
      ),
    );
  }
}
