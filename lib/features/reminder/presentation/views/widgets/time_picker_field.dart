import 'package:flutter/material.dart';

class TimePickerField extends StatefulWidget {
  const TimePickerField({required this.onTimeSelected, super.key});
  final Function(TimeOfDay) onTimeSelected;
  @override
  State<TimePickerField> createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
  TimeOfDay? selectedTime;

  Future<void> pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF0A6349),
            ),

            timePickerTheme: const TimePickerThemeData(
              dialHandColor: Color(0xFF0A6349),
              hourMinuteTextColor: Color(0xFF0A6349),
              hourMinuteColor: Color(0x140A6349),
              dayPeriodColor: Color(0x140A6349),
              dayPeriodTextColor: Color(0xFF0A6349),
            ),

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF0A6349),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
      widget.onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedTime != null;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: pickTime,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 56,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF242421) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF0A6349)
                : (isDark ? const Color(0x1AFFFFFF) : const Color(0x1E0A6349)),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.access_time,
              color: isSelected
                  ? const Color(0xFF0A6349)
                  : const Color(0xFF9E9E9B),
            ),
            const SizedBox(width: 12),
            Text(
              selectedTime != null
                  ? selectedTime!.format(context)
                  : 'اختر الوقت',
              style: TextStyle(
                color: isSelected
                    ? (isDark ? const Color(0xFFF2F2F0) : Colors.black)
                    : const Color(0xFF9E9E9B),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
