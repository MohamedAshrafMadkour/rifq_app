import 'package:flutter/material.dart';
import 'package:sakina_app/features/azkar/data/models/zekr_model.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/zekr_item.dart';

class ZekrListView extends StatelessWidget {
  const ZekrListView({required this.azkarList, super.key});
  final List<ZekrModel> azkarList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: azkarList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ZekrItem(
            zekrModel: azkarList[index],
          ),
        );
      },
    );
  }
}
