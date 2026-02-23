import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/core/service/data_base_service.dart';
import 'package:sakina_app/core/service/notification_service.dart';

import 'package:sakina_app/features/reminder/data/models/reminder_model.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/chose_color_list_view.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/chose_icon_grid_view.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/custom_text_field.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminder_review.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/repeted_everyday.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/save_reminder_buttons.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/time_picker_field.dart';

class AddReminderViewBody extends StatefulWidget {
  const AddReminderViewBody({super.key});

  @override
  State<AddReminderViewBody> createState() => _AddReminderViewBodyState();
}

class _AddReminderViewBodyState extends State<AddReminderViewBody> {
  String? selectedTime;
  bool repeatedEveryday = false;

  String title = 'عنوان التذكير';
  String time = '12:00 ص';
  IconData selectedIcon = Icons.alarm;
  List<Color> selectedColors = [
    const Color(0xFF0D7E5E),
    const Color(0xFF0A6349),
  ];
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

    // 👇 لو الوقت عدى النهارده، خليه بكرة
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    return scheduled;
  }

  Future<void> saveReminder() async {
    final reminder = ReminderModel(
      isEnabled: true,
      title: title,
      time: time, // دي "HH:mm"
      iconCode: selectedIcon.codePoint,
      colors: selectedColors,
      repeatedEveryday: repeatedEveryday,
    );

    final int id = await DataBaseService.instance.addReminder(reminder);

    // تحويل الـ String لـ DateTime قبل الجدولة
    final DateTime scheduledDateTime = convertTimeStringToDateTime(
      reminder.time,
    );

    await NotificationService.instance.scheduleNotification(
      id: id,
      title: reminder.title,
      body: "حان وقت التذكير",
      scheduledTime: scheduledDateTime, // بقت DateTime دلوقتي
      repeatedEveryday: reminder.repeatedEveryday,
    );

    log("Reminder saved & scheduled with id: $id at $scheduledDateTime");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          CloseIcon(),
          SizedBox(
            height: 8,
          ),
          Text(
            'إضافة تذكير جديد',
            style: AppStyles.textSemiBold24(context),
          ),
          SizedBox(
            height: 24,
          ),
          LableText(
            text: 'عنوان التذكير',
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 52,
            child: CustomTextField(
              hint: '...مثال: صلاة الضحى، قراءة ورد',
              onSubmitted: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          LableText(
            text: 'وقت التذكير',
          ),
          SizedBox(
            height: 8,
          ),
          TimePickerField(
            onTimeSelected: (TimeOfDay p1) {
              setState(() {
                time =
                    "${p1.hour.toString().padLeft(2, '0')}:${p1.minute.toString().padLeft(2, '0')}";
              });
            },
          ),

          ////////
          SizedBox(
            height: 24,
          ),
          LableText(
            text: 'اختر الأيقونة',
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .123,
            child: ChoseIconGridView(
              onTap: (IconData iconCode) {
                setState(() {
                  selectedIcon = iconCode;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LableText(
            text: 'اختر اللون',
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            child: ChoseColorListView(
              onTap: (List<Color> colors) {
                setState(() {
                  selectedColors = colors;
                });
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          RepetedEveryday(
            onChanged: (bool p1) {
              repeatedEveryday = p1;
              setState(() {});
            },
          ),
          SizedBox(
            height: 24,
          ),
          ReminderReview(
            time: time,
            title: title,
            colors: selectedColors,
            icon: selectedIcon,
          ),
          SizedBox(
            height: 32,
          ),
          SaveReminderButtons(
            onTap: saveReminder,
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}

class LableText extends StatelessWidget {
  const LableText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Text(
      text,
      style: AppStyles.textMedium14(context).copyWith(
        color: isDark ? const Color(0xFFF2F2F0) : const Color(0xFF1A1A1A),
      ),
    );
  }
}

class CloseIcon extends StatelessWidget {
  const CloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.close,
        color: isDark ? const Color(0xFFF2F2F0) : const Color(0xff1A1A1A),
      ),
    );
  }
}
