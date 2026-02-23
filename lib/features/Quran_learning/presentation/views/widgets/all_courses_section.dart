import 'package:flutter/material.dart';
import 'package:sakina_app/features/Quran_learning/data/models/all_courses_model.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/all_courses_list_view.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_title.dart';

class AllCoursesSection extends StatelessWidget {
  AllCoursesSection({super.key});
  List<AllCoursesModel> allCourseList = [
    AllCoursesModel(
      isLocked: false,
      type: 'تجويد',
      title: 'أحكام التجويد للمبتدئين',
      time: 45,
      allSesionsCount: 12,
      completeSesionsCount: 8,
    ),
    AllCoursesModel(
      isLocked: false,
      type: 'حفظ',
      title: 'حفظ جزء عم',
      time: 60,
      allSesionsCount: 37,
      completeSesionsCount: 15,
    ),
    AllCoursesModel(
      isLocked: true,
      type: 'تفسير',
      title: 'التفسير الميسر',
      time: 90,
      allSesionsCount: 30,
      completeSesionsCount: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: 'جميع الدورات'),
        SizedBox(
          height: 16,
        ),
        AllCoursesListView(
          items: allCourseList,
        ),
      ],
    );
  }
}
