import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina_app/core/helper/shared_prefs.dart';
import 'package:sakina_app/core/notification/adhan_notification.dart';
import 'package:sakina_app/core/notification/azkar_notification_service.dart';
import 'package:sakina_app/core/notification/moring_evening_zakar_notification.dart';
import 'package:sakina_app/core/notification/notification_cancel.dart';
import 'package:sakina_app/core/notification/quran_notification.dart';
import 'package:sakina_app/features/notification_view/presentation/manager/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.inital());

  Future<void> loadSettings() async {
    final stateLoaded = NotificationState(
      adhan: SharedPref.getBool('adhan'),
      salawat: SharedPref.getBool('salawat'),
      randomAzkar: SharedPref.getBool('randomAzkar'),
      morningEvening: SharedPref.getBool('morningEvening'),
      dailyWerd: SharedPref.getBool('dailyWerd'),
    );

    emit(stateLoaded);

    if (stateLoaded.salawat) await AzkarNotificationService.scheduleTasbih();
    if (stateLoaded.randomAzkar) {
      await AzkarNotificationService.showRepeatedRandomZikr();
    }
    if (stateLoaded.morningEvening) {
      await MorningEveningAzkarNotification.scheduleMorning();
      await MorningEveningAzkarNotification.scheduleEvening();
    }
  }

  Future<void> toggleAdhan(bool value) async {
    SharedPref.setBool('adhan', value);

    if (value) {
      await AdhanNotification.scheduleAdhan(
        dateTime: DateTime.now(),
        prayer: PrayerType.fajr,
        id: 19,
      );
    } else {
      await NotificationCancelSetting.cancelAllNotification();
    }

    emit(state.copyWith(adhan: value));
  }

  Future<void> toggleSalawat(bool value) async {
    SharedPref.setBool('salawat', value);

    if (value) {
      await AzkarNotificationService.scheduleTasbih();
    } else {
      await NotificationCancelSetting.cancelNotification(id: 402);
    }

    emit(state.copyWith(salawat: value));
  }

  Future<void> toggleRandomAzkar(bool value) async {
    SharedPref.setBool('randomAzkar', value);

    if (value) {
      await AzkarNotificationService.showRepeatedRandomZikr();
    } else {
      await NotificationCancelSetting.cancelNotification(id: 401);
    }

    emit(state.copyWith(randomAzkar: value));
  }

  Future<void> toggleMorningEvening(bool value) async {
    if (value) {
      await MorningEveningAzkarNotification.scheduleMorning();
      await MorningEveningAzkarNotification.scheduleEvening();
    } else {
      await MorningEveningAzkarNotification.cancelAll();
    }
    emit(state.copyWith(morningEvening: value));
  }

  Future<void> toggleDailyWerd(bool value) async {
    SharedPref.setBool('dailyWerd', value);

    if (value) {
      await QuranNotification.scheduleDailyWerd();
    } else {
      await NotificationCancelSetting.cancelNotification(id: 600);
    }

    emit(state.copyWith(dailyWerd: value));
  }
}
