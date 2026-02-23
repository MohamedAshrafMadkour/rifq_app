import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:sakina_app/core/notification/prayer_model.dart';
import 'package:sakina_app/core/notification/prayer_notification.dart';

class PrayerTask extends TaskHandler {
  List<PrayerNoteModel> prayers = [];

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {}

  @override
  void onRepeatEvent(DateTime timestamp) async {
    try {
      if (prayers.isEmpty) return;

      final currentPrayer = await calculateCurrentPrayer(prayers);

      await PrayerNotification.showCurrentPrayerNotification(
        currentPrayer.name,
        currentPrayer.time,
      );
    } catch (e) {
      // return ServerFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    print(
      'Prayer foreground task destroyed at $timestamp, timeout: $isTimeout',
    );
  }
}

Future<PrayerNoteModel> calculateCurrentPrayer(
  List<PrayerNoteModel> prayersFromPackage,
) async {
  final now = DateTime.now();

  if (prayersFromPackage.isEmpty) {
    throw Exception('No prayer times provided');
  }

  PrayerNoteModel current = prayersFromPackage.first;

  for (var prayer in prayersFromPackage) {
    final parts = prayer.time.split(':');
    final prayerTime = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );

    if (now.isAfter(prayerTime)) {
      current = prayer;
    }
  }

  return current;
}
