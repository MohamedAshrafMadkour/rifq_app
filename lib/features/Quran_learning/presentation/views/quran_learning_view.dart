import 'package:flutter/material.dart';
import 'package:sakina_app/features/Quran_learning/presentation/views/widgets/quran_learning_view_body.dart';

class QuranLearningView extends StatelessWidget {
  const QuranLearningView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark
            ? const Color(0xFF1C1C1A)
            : const Color(0xFFF8F7F4),
        body: const QuranLearningViewBody(),
      ),
    );
  }
}
