import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sakina_app/core/constants/app_images/app_icons/app_icons.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/Quran_learning/data/models/all_courses_model.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_slider.dart';

class AllCoursesItemBody extends StatelessWidget {
  const AllCoursesItemBody({required this.allCoursesModel, super.key});
  final AllCoursesModel allCoursesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: ShapeDecoration(
            color: const Color(0x190D7E5E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            allCoursesModel.type,
            style: AppStyles.textRegular12(context).copyWith(
              color: const Color(0xFF0D7E5E),
            ),
          ),
        ),

        SizedBox(
          height: 8,
        ),

        Text(
          allCoursesModel.title,
          style: AppStyles.textMedium18(context).copyWith(
            color: const Color(0xFF1A1A1A),
          ),
        ),

        SizedBox(
          height: 4,
        ),

        Row(
          children: [
            SvgPicture.asset(
              AppIcons.iconsTime,
              color: Color(0xFF6B6B6B),
              height: 14,
            ),

            Text(
              '  ${allCoursesModel.time.toStringAsFixed(0)} دقيقة',
              style: AppStyles.textRegular14(context).copyWith(
                color: const Color(0xFF6B6B6B),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              '${allCoursesModel.allSesionsCount.toStringAsFixed(0)} درس',
              style: AppStyles.textRegular14(context).copyWith(
                color: const Color(0xFF6B6B6B),
              ),
            ),
          ],
        ),
        if (!allCoursesModel.isLocked)
          isLockedSection(
            allCoursesModel: allCoursesModel,
          ),
      ],
    );
  }
}

class isLockedSection extends StatelessWidget {
  const isLockedSection({required this.allCoursesModel, super.key});
  final AllCoursesModel allCoursesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${allCoursesModel.completeSesionsCount.toStringAsFixed(0)} من ${allCoursesModel.allSesionsCount.toStringAsFixed(0)} دروس',
              style: AppStyles.textRegular12(context).copyWith(
                color: const Color(0xFF1A1A1A),
              ),
            ),

            Text(
              '${allCoursesModel.Presentage.toStringAsFixed(0)}%',
              style: AppStyles.textRegular12(context).copyWith(
                color: const Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 6,
        ),

        CustomSlider(
          max: allCoursesModel.allSesionsCount,
          value: allCoursesModel.completeSesionsCount,
        ),
      ],
    );
  }
}
