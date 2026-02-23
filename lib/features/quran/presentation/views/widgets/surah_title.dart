import 'package:flutter/material.dart';

class SurahTitle extends StatelessWidget {
  final String surahName;
  final bool showTitle;

  const SurahTitle({
    super.key,
    required this.surahName,
    required this.showTitle,
  });

  @override
  Widget build(BuildContext context) {
    if (!showTitle) return const SizedBox.shrink();

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          '﴿  سورة $surahName  ﴾',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
