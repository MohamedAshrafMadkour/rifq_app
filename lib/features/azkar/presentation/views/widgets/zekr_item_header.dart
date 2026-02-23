import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/custom_fav_icon.dart';

class ZekrItemHeader extends StatelessWidget {
  const ZekrItemHeader({required this.count, required this.zekr, super.key});
  final int count;
  final String zekr;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            color: isDark
                ? DarkAppColors.primaryLight
                : LightAppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            '$count',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            zekr,
            maxLines: 2,
            textAlign: TextAlign.right,
            overflow: TextOverflow.clip,
            style: AppStyles.textRegular16(context),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        CustomFavIcon(iconSize: 20),
      ],
    );
  }
}
