import 'package:flutter/material.dart';
import 'package:sakina_app/features/Quran_learning/data/models/continue_learning_model.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/continue_learning_list_view.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/custom_title.dart';

class ContinueLearningSection extends StatelessWidget {
  ContinueLearningSection({super.key});
  List<ContinueLearningModel> items = [
    ContinueLearningModel(title: 'المد والقصر', time: '12:30'),
    ContinueLearningModel(title: 'أحكام النون الساكنة', time: '15:45'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomTitle(title: 'استكمل التعلم'),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .22,
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: ContinueLearningListView(items: items),
          ),
        ),
      ],
    );
  }
}
