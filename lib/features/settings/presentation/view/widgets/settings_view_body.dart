import 'package:flutter/material.dart';
import 'package:sakina_app/core/widgets/custom_app_bar.dart';
import 'package:sakina_app/features/settings/presentation/view/widgets/custom_setting_first_list.dart';
import 'package:sakina_app/features/settings/presentation/view/widgets/custom_setting_second_list.dart';
import 'package:sakina_app/features/settings/presentation/view/widgets/settings_header.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const [
        SliverToBoxAdapter(
          child: CustomAppBar(
            isShow: false,
            subTitle: 'تخصيص تجربتك',
            title: 'الإعدادات',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SettingsHeader(
              header: 'الإعدادات العامة',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomSettingFirstList(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SettingsHeader(
              header: ' إعدادات القراءة',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomSettingSecondList(),
          ),
        ),
      ],
    );
  }
}
