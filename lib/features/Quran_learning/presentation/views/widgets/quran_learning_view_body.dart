import 'package:flutter/material.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/all_courses_section.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/continue_learning_section.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_background_message.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/excellent_message.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/quran_learning_view_header.dart';

class QuranLearningViewBody extends StatelessWidget {
  const QuranLearningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: QuranLearningViewHeader()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(child: ContinueLearningSection()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 26,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: AllCoursesSection(),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
            child: CustomBackgroundMessage(
              child: ExcellentMessage(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
          ),
        ),
      ],
    );
  }
}
