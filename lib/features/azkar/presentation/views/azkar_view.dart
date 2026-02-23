import 'package:flutter/material.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/azkar_view_body.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Color(0xff1C1C1A) : Color(0xffF8F7F4),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: AzkarViewBody(),
      ),
    );
  }
}
