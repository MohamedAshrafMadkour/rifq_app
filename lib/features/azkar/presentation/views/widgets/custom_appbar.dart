import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/features/azkar/data/models/counter_model.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/appbar_header.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/counter_row.dart';

class CustomAppbar extends StatelessWidget {
  CustomAppbar({super.key, this.sizedBox = true});
  final bool sizedBox;
  final List<CounterModel> items = [
    CounterModel(count: 11, title: 'الفئات'),
    CounterModel(count: 0, title: 'مكتملة اليوم'),
    CounterModel(count: 0, title: 'المفضله'),
  ];
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
      //  alignment: Alignment.topCenter,
      width: double.infinity,

      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.card : DarkAppColors.accentGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppbarHeader(),
          SizedBox(
            height: 20,
          ),
          CounterRow(
            items: items,
          ),
          sizedBox
              ? SizedBox(
                  height: 12,
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }
}
