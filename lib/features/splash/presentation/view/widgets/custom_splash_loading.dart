import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';

class CustomSplashLoading extends StatelessWidget {
  const CustomSplashLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index.isNaN
                ? LightAppColors.secondColor
                : LightAppColors.whiteColor99,
          ),
        );
      },
      size: 20.0,
    );
  }
}
