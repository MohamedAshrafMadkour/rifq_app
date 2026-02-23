import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_colors/light_app_colors.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/settings/presentation/view/models/setting_model.dart';
import 'package:sakina_app/features/settings/presentation/view/widgets/custom_setting_icon.dart';
import 'package:sakina_app/features/settings/presentation/view/widgets/custom_switch.dart';

class CustomSettingListTile extends StatelessWidget {
  const CustomSettingListTile({required this.setting, super.key});
  final SettingModel setting;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomSettingsIcon(
                    icon: setting.icon,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        setting.title,
                        textAlign: TextAlign.right,
                        style: AppStyles.textRegular16(context).copyWith(
                          height: 1.50,
                        ),
                      ),

                      SizedBox(height: 4),
                      Text(
                        setting.subTitle,
                        textAlign: TextAlign.right,
                        style: AppStyles.textRegular12(context).copyWith(
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  setting.isShow
                      ? CustomSwitch()
                      : Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: LightAppColors.greyColor6B,
                          size: 20,
                        ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
