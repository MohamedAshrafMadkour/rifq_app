import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_colors/dark_app_colors.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class ZekrItemBottom extends StatelessWidget {
  const ZekrItemBottom({required this.type1, required this.type2, super.key});
  final String type1, type2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .1209302325581395,
        ),
        Expanded(
          child: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              CustomTypeContainer(
                backgroundColor: Color(0xFFD4AF37),
                title: type1,
              ),

              CustomTypeContainer(
                backgroundColor: Colors.white,
                title: type2,
                borderColor: Color(0x1E0D7E5E),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTypeContainer extends StatelessWidget {
  const CustomTypeContainer({
    required this.backgroundColor,
    required this.title,
    this.borderColor,
    super.key,
  });
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),

      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: isDark
            ? DarkAppColors.primaryLight
            : LightAppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isDark
                ? DarkAppColors.primaryLight
                : LightAppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: AppStyles.textMedium14(context),
      ),
    );
  }
}
