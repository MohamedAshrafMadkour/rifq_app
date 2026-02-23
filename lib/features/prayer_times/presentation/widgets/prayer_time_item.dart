import 'package:flutter/material.dart';
import 'package:sakina_app/features/prayer_times/presentation/widgets/active_card.dart';
import 'package:sakina_app/features/prayer_times/presentation/widgets/normal_prayer.dart';

class PrayerTimeRow extends StatelessWidget {
  final String prayerName;
  final String time;
  final IconData icon;
  final bool isActive;
  final String? remainingTime;

  const PrayerTimeRow({
    super.key,
    required this.prayerName,
    required this.time,
    required this.icon,
    this.isActive = false,
    this.remainingTime,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return ActiveCard(
        icon: icon, 
        isActive: isActive, 
        prayerName: prayerName, 
        time: time, 
        remainingTime: remainingTime ?? '',
      );
    } 
       return NormalPrayer(
      icon: icon, 
      isActive: isActive, 
      prayerName: prayerName, 
      time: time, 
    );
  }
}