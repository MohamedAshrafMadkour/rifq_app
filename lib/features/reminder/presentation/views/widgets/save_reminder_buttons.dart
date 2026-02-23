import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class SaveReminderButtons extends StatelessWidget {
  const SaveReminderButtons({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: ShapeDecoration(
                color: isDark
                    ? const Color(0xFF242421)
                    : const Color(0xFFF8F7F4),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: isDark
                        ? const Color(0x1AFFFFFF)
                        : const Color(0x1E0D7E5E),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'إلغاء',
                style: AppStyles.textMedium14(context).copyWith(
                  color: isDark
                      ? const Color(0xFFF2F2F0)
                      : const Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0D7E5E),
                    Color(0xFF0A6349),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'حفظ التذكير',
                style: AppStyles.textMedium14(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
