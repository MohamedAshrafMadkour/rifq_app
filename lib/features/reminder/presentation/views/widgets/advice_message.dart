import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_background_icon.dart';

class AdviceMessage extends StatelessWidget {
  const AdviceMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomBackgroundIcon(
          icon: Icons.lightbulb_outline,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نصيحة',
                style: AppStyles.textMedium18(context).copyWith(
                  color: isDark ? const Color(0xFFF2F2F0) : Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'المداومة على الأذكار اليومية تجلب السكينة والطمأنينة للقلب. احرص على تفعيل التذكيرات لتبقى على اتصال دائم بالله.',
                textAlign: TextAlign.right,
                maxLines: 7,
                style: AppStyles.textRegular14(context).copyWith(
                  color: isDark
                      ? const Color(
                          0xFFD6C9A3,
                        ) // بيج فاتح مريح على الخلفية الغامقة
                      : const Color(0xFF6B6B6B),
                  height: 1.63,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
