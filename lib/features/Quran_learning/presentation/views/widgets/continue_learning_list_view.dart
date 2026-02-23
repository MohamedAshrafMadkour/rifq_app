import 'package:flutter/material.dart';
import 'package:sakina_app/features/Quran_learning/data/models/continue_learning_model.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/continue_learning_item.dart';

class ContinueLearningListView extends StatelessWidget {
  const ContinueLearningListView({required this.items, super.key});
  final List<ContinueLearningModel> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ContinueLearningItem(
            continueLearningModel: items[index],
          ),
        );
      },
    );
  }
}
