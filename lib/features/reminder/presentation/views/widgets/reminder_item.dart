import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/constants/app_images/app_icons/app_icons.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/core/service/data_base_service.dart';
import 'package:sakina_app/core/service/notification_service.dart';
import 'package:sakina_app/features/reminder/data/models/reminder_model.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminder_item_icon.dart';

class ReminderItem extends StatefulWidget {
  const ReminderItem({required this.reminderModel, super.key});
  final ReminderModel reminderModel;
  @override
  State<ReminderItem> createState() => _ReminderItemState();
}

class _ReminderItemState extends State<ReminderItem> {
  bool isEnabled = true;
  DateTime convertTimeStringToDateTime(String time) {
    final now = DateTime.now();

    final parts = time.split(":");

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    DateTime scheduled = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    return scheduled;
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Opacity(
      opacity: widget.reminderModel.isEnabled ? 1 : 0.6,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
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
          children: [
            ReminderItemIcon(
              icon: widget.reminderModel.icon,
              colorsList: widget.reminderModel.colors,
            ),

            const SizedBox(width: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.reminderModel.title,
                  style: AppStyles.textMedium18(context).copyWith(
                    color: isDark
                        ? const Color(0xFFF2F2F0)
                        : const Color(0xFF1A1A1A),
                  ),
                ),

                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.iconsTime,
                      color: isDark
                          ? const Color(0xFF9E9E9B)
                          : const Color(0xFF6B6B6B),
                      height: 12,
                    ),
                    Text(
                      '  ${widget.reminderModel.time}',
                      style: AppStyles.textRegular14(context).copyWith(
                        color: isDark
                            ? const Color(0xFF9E9E9B)
                            : const Color(0xFF6B6B6B),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),

            CustomReminderSwitch(
              value: widget.reminderModel.isEnabled,
              rtl: true,
              width: 50,
              onChanged: (value) async {
                final int id = widget.reminderModel.id!;

                setState(() {
                  widget.reminderModel.isEnabled = value;
                });

                await DataBaseService.instance.updateReminderEnabled(
                  id: id,
                  isEnabled: value,
                );

                if (!value) {
                  await NotificationService
                      .instance
                      .flutterLocalNotificationsPlugin
                      .cancel(id: id);
                } else {
                  final scheduledTime = convertTimeStringToDateTime(
                    widget.reminderModel.time,
                  );

                  await NotificationService.instance.scheduleNotification(
                    id: id,
                    title: widget.reminderModel.title,
                    body: "حان وقت التذكير",
                    scheduledTime: scheduledTime,
                    repeatedEveryday: widget.reminderModel.repeatedEveryday,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomReminderSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final bool rtl;

  const CustomReminderSwitch({
    required this.rtl,
    required this.width,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width,
        height: 30,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: value
              ? const Color(0xFF0D7E5E) // ON
              : (isDark
                    ? const Color(0xFF2E2E2C) // OFF dark
                    : const Color(0xFFF5F5F5)), // OFF light
          boxShadow: value
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.3 : 0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                    spreadRadius: -2,
                  ),
                ],
        ),
        child: Align(
          alignment: ((rtl) ? value : !value)
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
