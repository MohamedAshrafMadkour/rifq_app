import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakina_app/core/constants/app_images/app_icons/app_icons.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/azkar/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.categoryModel, super.key});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: categoryModel.colors,
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 مهم
        children: [
          Text(
            categoryModel.imogi,
            style: const TextStyle(fontSize: 25),
          ),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryModel.title,
                      style: AppStyles.textMedium18(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ' ${categoryModel.subTitle.toStringAsFixed(0)}',
                      style: AppStyles.textRegular14(context),
                    ),
                  ],
                ),
              ),

              SvgPicture.asset(
                AppIcons.iconsArrow,
                height: 20,
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
