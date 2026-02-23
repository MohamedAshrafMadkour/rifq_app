import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/service/notification_service.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_appbar_title.dart';

class ReminderAppbar extends StatelessWidget {
  const ReminderAppbar({
    this.showIcon = true,
    required this.title,
    super.key,
  });
  final String title;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.card : DarkAppColors.accentGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppbarTitle(title: title),
          if (showIcon)
            Container(
              padding: EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 0.20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33554400),
                ),
              ),
              child: GestureDetector(
                onTap: () async {
                  NotificationService.instance.showInstantNotification();
                },

                child: Icon(
                  Icons.add,
                  color: isDark ? Colors.black : Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
