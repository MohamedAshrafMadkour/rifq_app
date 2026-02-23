import 'package:flutter/material.dart';

class SettingModel {
  final String title;
  final String subTitle;
  final bool isShow;
  final IconData icon;
  SettingModel({
    required this.title,
    required this.subTitle,
    required this.isShow,
    required this.icon,
  });
  static List<SettingModel> firstSettingList = [
    SettingModel(
      title: 'الوضع الليلي',
      subTitle: 'تبديل بين الوضع الفاتح والداكن',
      isShow: true,
      icon: Icons.dark_mode_outlined,
    ),
    SettingModel(
      title: 'الأشعارات',
      subTitle: 'تفعيل الأشعارات',
      isShow: false,
      icon: Icons.notifications_none_outlined,
    ),
  ];
  static List<SettingModel> secondSettingList = [
    SettingModel(
      isShow: false,
      title: 'نوع الرسم',
      subTitle: 'تغيير نوع الرسم',
      icon: Icons.color_lens_outlined,
    ),
    SettingModel(
      isShow: false,
      title: 'حجم الخط',
      subTitle: 'تغيير حجم الخط',
      icon: Icons.format_size,
    ),
  ];
}
