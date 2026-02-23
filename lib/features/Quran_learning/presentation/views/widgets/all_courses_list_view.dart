import 'package:flutter/material.dart';
import 'package:sakina_app/features/Quran_learning/data/models/all_courses_model.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/all_courses_item.dart';

class AllCoursesListView extends StatelessWidget {
  const AllCoursesListView({required this.items, super.key});
  final List<AllCoursesModel> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: AllCoursesItem(
            allCoursesModel: items[index],
          ),
        );
      },
    );
  }
}
