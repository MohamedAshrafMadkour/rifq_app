import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_slider.dart';

class QuranLearningViewHeaderBody extends StatelessWidget {
  const QuranLearningViewHeaderBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: isDark
            ? const Color(0xFF242421) // card لون أفتح سنة من الخلفية
            : const Color(0xFFF8F7F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: isDark
            ? [
                const BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                  spreadRadius: -5,
                ),
              ]
            : const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 10,
                  offset: Offset(0, 8),
                  spreadRadius: -6,
                ),
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 25,
                  offset: Offset(0, 20),
                  spreadRadius: -5,
                ),
              ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تقدمك هذا الأسبوع',
                    style: AppStyles.textRegular14(context).copyWith(
                      color: isDark
                          ? const Color(0xFF9E9E9B) // رمادي فاتح للدارك
                          : const Color(0xFF6B6B6B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '5 دروس',
                    style: AppStyles.textMedium24(context).copyWith(
                      color: isDark
                          ? const Color(0xFFF2F2F0) // أبيض مريح
                          : const Color(0xFF1A1A1A),
                      height: 1.33,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    '78%',
                    style: AppStyles.textRegular30(context).copyWith(
                      color: isDark
                          ? const Color(0xFFF2F2F0)
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                  Text(
                    'مكتمل',
                    style: AppStyles.textRegular14(context).copyWith(
                      color: isDark
                          ? const Color(0xFF9E9E9B)
                          : const Color(0xFF6B6B6B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const CustomSlider(
            max: 100,
            value: 67,
          ),
        ],
      ),
    );
  }
}
