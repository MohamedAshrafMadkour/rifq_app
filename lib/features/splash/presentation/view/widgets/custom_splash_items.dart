import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/splash/presentation/view/widgets/custom_divider.dart';
import 'package:sakina_app/features/splash/presentation/view/widgets/custom_splash_loading.dart';
import 'package:sakina_app/features/splash/presentation/view/widgets/custom_splash_logo.dart';
import 'package:sakina_app/l10n/app_localizations.dart';

class CustomSplashItems extends StatelessWidget {
  const CustomSplashItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSplashLogo(),
        const SizedBox(height: 32),
        Text(
          locale.splashViewTitle,
          textAlign: TextAlign.center,
          style: AppStyles.textMedium36(
            context,
          ).copyWith(color: LightAppColors.whiteColor),
        ),
        const SizedBox(height: 16),
        const CustomDivider(),
        const SizedBox(height: 16),
        Text(
          locale.splashViewSubTitle,
          textAlign: TextAlign.center,
          style: AppStyles.textRegular20(
            context,
          ).copyWith(color: LightAppColors.secondColor),
        ),
        const SizedBox(height: 8),
        Text(
          locale.splashViewDesc,
          textAlign: TextAlign.center,
          style:
              AppStyles.textRegular14(
                context,
              ).copyWith(
                color: LightAppColors.whiteColor99,
              ),
        ),
        const SizedBox(height: 48),
        const CustomSplashLoading(),
      ],
    );
  }
}
