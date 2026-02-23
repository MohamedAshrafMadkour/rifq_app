import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class CustomAppbarTitle extends StatelessWidget {
  const CustomAppbarTitle({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 18,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          title,
          style: AppStyles.textMedium24(context),
        ),
      ],
    );
  }
}
