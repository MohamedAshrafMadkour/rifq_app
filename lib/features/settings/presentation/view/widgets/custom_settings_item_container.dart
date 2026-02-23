import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/manager/theme_hydrated_cubit.dart';

class CustomSettingsItemContainer extends StatelessWidget {
  const CustomSettingsItemContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: isDark ? DarkAppColors.surface : LightAppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isDark
                ? const Color.fromRGBO(
                    39,
                    69,
                    61,
                    1,
                  )
                : const Color.fromRGBO(13, 126, 94, 0.12),
          ),
        ),
        shadows: [
          BoxShadow(
            color: isDark
                ? const Color.fromRGBO(0, 0, 0, 0.25)
                : const Color.fromRGBO(0, 0, 0, 0.10),
            blurRadius: 2,
            offset: const Offset(0, 1),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: isDark
                ? const Color.fromRGBO(0, 0, 0, 0.35)
                : const Color.fromRGBO(0, 0, 0, 0.12),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
