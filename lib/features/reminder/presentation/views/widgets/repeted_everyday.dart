import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminder_item.dart';

class RepetedEveryday extends StatefulWidget {
  const RepetedEveryday({required this.onChanged, super.key});
  final void Function(bool) onChanged;

  @override
  State<RepetedEveryday> createState() => _RepetedEverydayState();
}

class _RepetedEverydayState extends State<RepetedEveryday> {
  bool repeted = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: isDark ? const Color(0xFF242421) : const Color(0xFFE8E6E1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'تكرار يومي',
            style: AppStyles.textMedium14(context).copyWith(
              color: isDark ? const Color(0xFFF2F2F0) : const Color(0xFF1A1A1A),
            ),
          ),
          CustomReminderSwitch(
            value: repeted,
            onChanged: (value) {
              repeted = value;
              setState(() {});
              widget.onChanged(value);
            },
            rtl: true,
            width: 60,
          ),
        ],
      ),
    );
  }
}
