import 'package:flutter/material.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class CurrentPrayerWidget extends StatefulWidget {
  final PrayerTimes? prayerTimes;
  
  const CurrentPrayerWidget({super.key, this.prayerTimes});

  @override
  State<CurrentPrayerWidget> createState() => _CurrentPrayerWidgetState();
}

class _CurrentPrayerWidgetState extends State<CurrentPrayerWidget> {
  Timer? _timer;
  Prayer? _currentNextPrayer; // Track the current next prayer

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.prayerTimes != null) {
        final next = widget.prayerTimes!.nextPrayer(date: DateTime.now());
        // Only update state if the next prayer has changed
        if (_currentNextPrayer != next) {
          setState(() {
            _currentNextPrayer = next;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String getPrayerName(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return 'صلاة الفجر';
      case Prayer.fajrAfter:
        return 'صلاة الفجر';
      case Prayer.sunrise:
        return 'الشروق';
      case Prayer.dhuhr:
        return 'صلاة الظهر';
      case Prayer.asr:
        return 'صلاة العصر';
      case Prayer.maghrib:
        return 'صلاة المغرب';
      case Prayer.isha:
        return 'صلاة العشاء';
      case Prayer.ishaBefore:
        return 'صلاة العشاء';
    }
  }

  String formatRemainingTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    
    if (hours > 0) {
      return 'متبقي $hours ساعة و $minutes دقيقة';
    } else if (minutes > 0) {
      return 'متبقي $minutes دقيقة';
    } else {
      return 'متبقي $seconds ثانية';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.prayerTimes == null) {
      return SizedBox(height: 80.h);
    }

    final next = widget.prayerTimes!.nextPrayer(date: DateTime.now());
    final format = DateFormat.jm();

    String nextPrayerName = 'لا توجد صلاة';
    String nextPrayerTime = '';
    String remainingTime = '';

    nextPrayerName = getPrayerName(next);
    nextPrayerTime = format.format(widget.prayerTimes!.timeForPrayer(next).toLocal());
    
    final remaining = widget.prayerTimes!.timeForPrayer(next).difference(DateTime.now());
    remainingTime = formatRemainingTime(remaining);

    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
             Text(
              'الصلاة القادمة',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nextPrayerName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              nextPrayerTime,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          remainingTime,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
