import 'dart:convert';
import 'package:flutter/material.dart';

class ReminderModel {
  final int? id; // 👈 مهم
  bool repeatedEveryday;

  bool isEnabled;
  final String title;
  final String time;
  final int iconCode;
  final List<Color> colors; // ✅

  ReminderModel({
    required this.isEnabled, required this.title, required this.time, required this.iconCode, required this.colors, required this.repeatedEveryday, this.id,
  });

  // للتحويل إلى Map (للتخزين)
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'enabled': isEnabled ? 1 : 0,
      'repeatedEveryday': repeatedEveryday ? 1 : 0, // 👈 جديد

      'title': title,
      'time': time,
      'icon': iconCode,
      'colors': jsonEncode(colors.map((c) => c.value).toList()),
    };
  }

  // للقراءة من DB
  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      id: map['Id'],
      isEnabled: map['enabled'] == 1,
      repeatedEveryday: map['repeatedEveryday'] == 1, // 👈 جديد

      title: map['title'],
      time: map['time'],
      iconCode: map['icon'],
      colors: (jsonDecode(map['colors']) as List).map((e) => Color(e)).toList(),
    );
  }
  @override
  String toString() {
    return '''
Reminder(
  title: $title,
  time: $time,
  enabled: $isEnabled,
  icon: $iconCode,
  colors: ${colors.map((c) => c.value).toList()}
)
''';
  }

  // IconData للعرض
  IconData get icon => IconData(iconCode, fontFamily: 'MaterialIcons');
}
