import 'package:flutter/material.dart';
import 'package:sakina_app/features/names_of_allah/data/models/god_names_category_model.dart';
import 'package:sakina_app/features/names_of_allah/presentation/views/widgets/god_names_item.dart';

class GodNamesGridView extends StatelessWidget {
  const GodNamesGridView({
    super.key,
    required this.categories,
  });

  final List<GodNamesCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GodNamesItem(category: category);
      },
    );
  }
}
