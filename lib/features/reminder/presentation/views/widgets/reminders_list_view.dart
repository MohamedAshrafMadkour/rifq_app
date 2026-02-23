import 'package:flutter/material.dart';
import 'package:sakina_app/features/reminder/data/models/reminder_model.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminder_item.dart';

class RemindersListView extends StatelessWidget {
  const RemindersListView({required this.reminderItems, super.key});
  final List<ReminderModel> reminderItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: reminderItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ReminderItem(
            reminderModel: reminderItems[index],
          ),
        );
      },
    );
  }
}
