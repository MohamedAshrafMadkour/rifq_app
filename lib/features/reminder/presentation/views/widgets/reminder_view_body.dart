import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_routes.dart';
import 'package:sakina_app/core/service/data_base_service.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_background_message.dart';
import 'package:sakina_app/features/reminder/data/models/reminder_model.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/add_new_reminder_button.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/advice_message.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminder_appbar.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminders_list_view.dart';

class ReminderViewBody extends StatefulWidget {
  const ReminderViewBody({super.key});

  @override
  State<ReminderViewBody> createState() => _ReminderViewBodyState();
}

class _ReminderViewBodyState extends State<ReminderViewBody> {
  List<ReminderModel> reminderList = [];

  @override
  void initState() {
    super.initState();
    loadReminders();
  }

  void loadReminders() async {
    final data = await DataBaseService.instance.getAllReminders();

    setState(() {
      reminderList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReminderAppbar(
          title: 'التذكيرات',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  RemindersListView(
                    reminderItems: reminderList,
                  ),
                  AddNewReminderButton(
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        AppRoutes.addReminderView,
                      );

                      loadReminders(); // 🔥 reload بعد الرجوع
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(DateTime.now());
                    },
                    child: CustomBackgroundMessage(
                      child: AdviceMessage(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
