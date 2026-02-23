import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/core/manager/theme_hydrated_cubit.dart';
import 'package:sakina_app/core/widgets/custom_app_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.isShow,
    required this.subTitle,
    required this.title,
    super.key,
  });

  final String title;
  final String subTitle;
  final bool isShow;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    final textColor = isDark
        ? DarkAppColors.textPrimary
        : LightAppColors.whiteColor;
    final subTextColor = isDark
        ? DarkAppColors.textSecondary
        : const Color.fromRGBO(255, 255, 255, 0.85);
    return CustomAppBarContainer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12, right: 16, top: 8),
          child: Column(
            children: [
              const SizedBox(width: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_forward,
                      color: textColor,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: AppStyles.textMedium24(context).copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    isShow
                        ? Icon(
                            Icons.location_on_outlined,
                            color: subTextColor,
                            size: 18,
                          )
                        : const SizedBox(width: 30),

                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          subTitle,
                          textAlign: TextAlign.right,
                          style: AppStyles.textRegular16(context).copyWith(
                            color: subTextColor,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
