import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminder_item_icon.dart';

class ReminderReview extends StatelessWidget {
  const ReminderReview({
    required this.icon,
    required this.time,
    required this.title,
    required this.colors,
    super.key,
  });

  final String title, time;
  final List<Color> colors;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        gradient: isDark
            ? const LinearGradient(
                colors: [
                  Color(0xFF2A2926),
                  Color(0xFF1F1F1C),
                ],
              )
            : const LinearGradient(
                colors: [
                  Color(0xFFE8F5F1),
                  Color(0xFFF4E5C2),
                ],
              ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isDark ? const Color(0x1AFFFFFF) : const Color(0x4C0C7E5E),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'معاينة التذكير',
            style: AppStyles.textRegular12(context).copyWith(
              color: isDark ? const Color(0xFF9E9E9B) : const Color(0xFF6B6B6B),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              ReminderItemIcon(
                colorsList: colors,
                icon: icon,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.textRegular16(context).copyWith(
                        color: isDark
                            ? const Color(0xFFF2F2F0)
                            : const Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          time,
                          style: AppStyles.textRegular12(context).copyWith(
                            color: const Color(0xFF9E9E9B),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.alarm,
                          size: 12,
                          color: Color(0xFF9E9E9B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
