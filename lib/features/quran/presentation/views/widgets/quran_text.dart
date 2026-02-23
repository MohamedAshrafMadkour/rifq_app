import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/styles/app_styles.dart';
import 'package:sakina_app/features/quran/services/quran_pages_service.dart';

class QuranText extends StatelessWidget {
  final List<Ayah> verses;

  const QuranText({
    super.key,
    required this.verses,
  });

  String toArabicNumber(int number) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    String numStr = number.toString();
    for (int i = 0; i < english.length; i++) {
      numStr = numStr.replaceAll(english[i], arabic[i]);
    }
    return numStr;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(
          fontSize: AppStyles.getResponsiveFontSize(context, fontSize: 31),
          fontFamily: 'Amiri',
          height: 1.7,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        children: verses.map<InlineSpan>((verse) {
          if (verse.index == 0) {
            return WidgetSpan(
              child: Center(
                child: Text(
                  verse.text,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            );
          } else {
            return TextSpan(
              children: [
                TextSpan(text: '${verse.text} '),
                TextSpan(
                  text: '﴿${toArabicNumber(verse.index)}﴾ ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
        }).toList(),
      ),
    );
  }
}
