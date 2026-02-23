import 'package:flutter/material.dart';
import 'package:sakina_app/features/quran/services/quran_pages_service.dart';
import 'package:sakina_app/features/quran/presentation/views/widgets/surah_title.dart';
import 'package:sakina_app/features/quran/presentation/views/widgets/quran_text.dart';

class QuranPageContent extends StatelessWidget {
  final QuranPage pageData;
  final int pageIndex;
  final List<QuranPage> allPages;
  final String currentSurahName;

  const QuranPageContent({
    super.key,
    required this.pageData,
    required this.pageIndex,
    required this.allPages,
    required this.currentSurahName,
  });

  bool shouldShowSurahTitle(String surahName) {
    if (pageIndex == 0) return true;

    final previousPage = allPages[pageIndex - 1];

    for (var surah in previousPage.surahs) {
      if (surah.surahName == surahName) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
                bottom: 70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: pageData.surahs.asMap().entries.map((entry) {
                  int surahIndexInPage = entry.key;
                  var surahInPage = entry.value;
                  String surahName = surahInPage.surahName;
                  List<Ayah> verses = surahInPage.ayahs;

                  bool showTitle = shouldShowSurahTitle(surahName);

                  return Column(
                    children: [
                      SurahTitle(
                        surahName: surahName,
                        showTitle: showTitle && surahIndexInPage == 0,
                      ),
                      QuranText(verses: verses),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
