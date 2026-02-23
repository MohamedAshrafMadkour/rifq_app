import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_background_icon.dart';

class ExcellentMessage extends StatelessWidget {
  const ExcellentMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        const CustomBackgroundIcon(
          icon: Icons.star,
        ),
        const SizedBox(height: 16),

        Text(
          'أحسنت!',
          style: AppStyles.textMedium18(context).copyWith(
            color: isDark
                ? const Color(0xFFF2F2F0) // أبيض مريح
                : Colors.black,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'لقد أكملت 23 درسًا هذا الشهر. استمر في التعلم لتحقيق أهدافك.',
          textAlign: TextAlign.center,
          style: AppStyles.textRegular14(context).copyWith(
            color: isDark
                ? const Color(0xFF9E9E9B) // رمادي فاتح للدارك
                : const Color(0xFF6B6B6B),
          ),
        ),
      ],
    );
  }
}
