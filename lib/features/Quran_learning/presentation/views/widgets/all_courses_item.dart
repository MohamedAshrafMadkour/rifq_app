import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_images/app_icons/app_icons.dart';
import 'package:sakina_app/features/Quran_learning/data/models/all_courses_model.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/all_courses_item_body.dart';

class AllCoursesItem extends StatelessWidget {
  const AllCoursesItem({
    required this.allCoursesModel,
    super.key,
  });

  final AllCoursesModel allCoursesModel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Opacity(
      opacity: allCoursesModel.isLocked ? 0.6 : 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: ShapeDecoration(
          color: isDark
              ? const Color(0xFF242421) // Card Dark
              : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isDark
                  ? const Color(0x1AFFFFFF) // subtle border
                  : const Color(0x1E0D7E5E),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            allCoursesModel.isLocked
                ? const LockedAllCoursePlayIcon()
                : const UnLockedAllCoursePlayIcon(),
            const SizedBox(width: 16),
            Expanded(
              child: AllCoursesItemBody(
                allCoursesModel: allCoursesModel,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class UnLockedAllCoursePlayIcon extends StatelessWidget {
  const UnLockedAllCoursePlayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: MediaQuery.sizeOf(context).width * .1302325581395349,
      height: MediaQuery.sizeOf(context).height * .0600858369098712,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.50, 0.00),
          end: Alignment(0.50, 1.00),
          colors: [
            Color(0xFFD4AF37),
            Color(0xFFC4941F),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: isDark
            ? [
                const BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ]
            : const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 6,
                  offset: Offset(0, 4),
                  spreadRadius: -1,
                ),
              ],
      ),
      child: const Icon(
        Icons.play_arrow_outlined,
        color: Colors.white,
        size: 34,
      ),
    );
  }
}

class LockedAllCoursePlayIcon extends StatelessWidget {
  const LockedAllCoursePlayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.sizeOf(context).width * .1302325581395349,
      height: MediaQuery.sizeOf(context).height * .0600858369098712,
      decoration: ShapeDecoration(
        color: isDark
            ? const Color(0xFF2E2E2C) // بدل الرمادي الفاتح
            : const Color(0xFFE8E6E1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: isDark
            ? [
                const BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ]
            : const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 6,
                  offset: Offset(0, 4),
                  spreadRadius: -1,
                ),
              ],
      ),
      child: Image.asset(
        AppIcons.iconsLock,
        color: isDark ? const Color(0xFF9E9E9B) : null,
      ),
    );
  }
}
