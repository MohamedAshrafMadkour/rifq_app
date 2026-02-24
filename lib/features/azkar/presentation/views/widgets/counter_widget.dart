import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/azkar/data/models/counter_model.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({required this.counterModel, super.key});
  final CounterModel counterModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .2837209302325581,
      height: MediaQuery.sizeOf(context).height * .0815450643776824,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withValues(alpha: .1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${counterModel.count}',
              style: AppStyles.textRegular24(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,

            child: Text(
              counterModel.title,
              style: AppStyles.textRegular12(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
