import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class BackRow extends StatelessWidget {
  const BackRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(
            10.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xff6B6B6B),
              size: 16,
            ),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          'العودة للفئات',
          style: AppStyles.textMedium14(context),
        ),
      ],
    );
  }
}
