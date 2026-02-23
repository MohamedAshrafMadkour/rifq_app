import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_routes.dart';
import 'package:sakina_app/core/widgets/custom_app_bar.dart';
import 'package:sakina_app/features/tasbih/presentation/view/widgets/custom_tasbih_list.dart';
import 'package:sakina_app/features/tasbih/presentation/view/widgets/tasbih_hadith_item.dart';
import 'package:sakina_app/features/tasbih/presentation/view/widgets/tasbih_section.dart';

class TasbihViewBody extends StatelessWidget {
  const TasbihViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.qiblaView),
      child: CustomScrollView(
        slivers: const [
          SliverToBoxAdapter(
            child: CustomAppBar(
              isShow: false,
              subTitle: 'سبّح واذكر الله في كل وقت',
              title: 'المسبحة الإلكترونية',
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(right: 20),
            sliver: CustomTasbihList(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: TasbihSection(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TasbihHadithItem(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
