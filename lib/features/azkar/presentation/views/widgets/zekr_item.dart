import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/features/azkar/data/models/zekr_model.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/zekr_item_bottom.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/zekr_item_header.dart';

import '../../../../../core/constants/app_colors/light_app_colors.dart';

class ZekrItem extends StatelessWidget {
  const ZekrItem({required this.zekrModel, super.key});
  final ZekrModel zekrModel;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark ? DarkAppColors.container : LightAppColors.whiteColor,
        border: Border.all(
          color: isDark
              ? DarkAppColors.primaryLight
              : LightAppColors.primaryColor,

          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? DarkAppColors.glow : LightAppColors.blackColor19D,
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZekrItemHeader(
            count: zekrModel.count,
            zekr: zekrModel.zekr,
          ),
          SizedBox(
            height: 8,
          ),
          ZekrItemBottom(
            type1: zekrModel.type1,
            type2: zekrModel.type2,
          ),
        ],
      ),
    );
  }
}
