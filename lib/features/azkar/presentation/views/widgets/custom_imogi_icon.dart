import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';

class customImogiIcon extends StatelessWidget {
  const customImogiIcon({required this.imogi, super.key});
  final String imogi;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0x33FFFFFF),
        shape: BoxShape.circle,
      ),
      child: Text(
        imogi,
        style: AppStyles.imogiStyle(context),
      ),
    );
  }
}
