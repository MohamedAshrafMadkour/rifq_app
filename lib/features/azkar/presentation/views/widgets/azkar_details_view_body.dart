import 'package:flutter/material.dart';
import 'package:sakina_app/features/azkar/data/models/zekr_model.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/back_row.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/custom_appbar.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/zekr_list_view.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  AzkarDetailsViewBody({required this.azkar, super.key});
  final List<ZekrModel> azkar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          sizedBox: false,
        ),
        SizedBox(
          height: 10,
        ),
        BackRow(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ZekrListView(
              azkarList: azkar,
            ),
          ),
        ),
      ],
    );
  }
}
