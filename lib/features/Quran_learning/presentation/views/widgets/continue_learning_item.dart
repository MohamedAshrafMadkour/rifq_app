import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_images/app_images.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/Quran_learning/data/models/continue_learning_model.dart';

class ContinueLearningItem extends StatelessWidget {
  const ContinueLearningItem({
    required this.continueLearningModel,
    super.key,
  });

  final ContinueLearningModel continueLearningModel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.only(bottom: 13),
        decoration: ShapeDecoration(
          color: isDark
              ? const Color(0xFF242421) // كارد في الدارك
              : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isDark
                  ? const Color(0x1AFFFFFF) // border خفيف أبيض شفاف
                  : const Color(0x1E0D7E5E),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  AppImages.secionImage,
                  height: height * .1373390557939914,
                  width: width * .4255813953488372,
                  fit: BoxFit.cover,
                ),

                // Gradient Overlay
                Container(
                  height: height * .1373390557939914,
                  width: width * .4255813953488372,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.50, 1.00),
                      end: const Alignment(0.50, 0.00),
                      colors: [
                        Colors.black.withOpacity(isDark ? 0.75 : 0.60),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                const PlayIcon(),

                Positioned(
                  left: 0,
                  bottom: 0,
                  child: TimeCounter(
                    time: continueLearningModel.time,
                  ),
                ),
              ],
            ),

            SizedBox(height: height * .0386266094420601),

            Padding(
              padding: const EdgeInsets.only(right: 13.0),
              child: Text(
                continueLearningModel.title,
                style: AppStyles.textRegular14(context).copyWith(
                  color: isDark
                      ? const Color(0xFFF2F2F0) // نص أبيض مريح
                      : const Color(0xFF1A1A1A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayIcon extends StatelessWidget {
  const PlayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.only(right: 4),
      decoration: ShapeDecoration(
        color: isDark
            ? const Color(0xFF2E2E2C) // رمادي غامق بدل الأبيض
            : Colors.white.withOpacity(0.90),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      child: const Icon(
        Icons.play_arrow_outlined,
        color: Color(0xff0D7E5E),
      ),
    );
  }
}

class TimeCounter extends StatelessWidget {
  const TimeCounter({required this.time, super.key});
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: ShapeDecoration(
        color: Colors.black.withValues(alpha: 0.60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        time,
        style: AppStyles.textRegular12(context),
      ),
    );
  }
}
