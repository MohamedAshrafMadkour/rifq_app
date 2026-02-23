import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class AddNewReminderButton extends StatelessWidget {
  const AddNewReminderButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDark ? DarkAppColors.container : LightAppColors.whiteColor,
          border: Border.all(
            color: isDark
                ? DarkAppColors.primaryLight
                : LightAppColors.primaryColor,

            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? DarkAppColors.glow : LightAppColors.blackColor19D,
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: isDark ? const Color(0xFF9E9E9B) : const Color(0xFF6B6B6B),
            ),
            Text(
              '  إضافة تذكير جديد',
              style: AppStyles.textRegular16(context).copyWith(
                color: isDark
                    ? const Color(0xFFF2F2F0)
                    : const Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
