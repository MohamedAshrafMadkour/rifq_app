import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_routes.dart';
import 'package:sakina_app/features/azkar/data/models/category_model.dart';
import 'package:sakina_app/features/azkar/presentation/views/azkar_details_view.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/category_item.dart';

class CategoryGirdView extends StatelessWidget {
  const CategoryGirdView({required this.items, super.key});
  final List<CategoryModel> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsetsGeometry.zero,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.291666666666667,
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AzkarDetailsView(
                    zekr: items[index].zekrList,
                  );
                },
              ),
            );
          },
          child: CategoryItem(
            categoryModel: items[index],
          ),
        );
      },
    );
  }
}
