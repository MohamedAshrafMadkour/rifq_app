import 'dart:convert';
import 'package:flutter/services.dart';

class Ayah {
  final int index;
  final String text;

  Ayah({required this.index, required this.text});

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      index: json['index'],
      text: json['text'],
    );
  }
}

class SurahInPage {
  final String surahName;
  final List<Ayah> ayahs;

  SurahInPage({required this.surahName, required this.ayahs});
}

class QuranPage {
  final int pageIndex;
  final List<SurahInPage> surahs;

  QuranPage({required this.pageIndex, required this.surahs});

  factory QuranPage.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> versesBySura = json['verses_by_sura'];

    final List<SurahInPage> surahsList = [];
    versesBySura.forEach((surahName, verses) {
      final List<Ayah> ayahsList = (verses as List)
          .map((e) => Ayah.fromJson(e))
          .toList();

      surahsList.add(
        SurahInPage(
          surahName: surahName,
          ayahs: ayahsList,
        ),
      );
    });

    return QuranPage(
      pageIndex: json['page_index'],
      surahs: surahsList,
    );
  }
}

class QuranPagesService {
  static Future<List<QuranPage>> getAllPages() async {
    final data = await rootBundle.loadString('assets/json/quran_by_pages.json');
    final jsonResult = json.decode(data) as List;
    return jsonResult.map((e) => QuranPage.fromJson(e)).toList();
  }

  // دالة للحصول على رقم الصفحة اللي فيها سورة معينة
  static Future<int> getPageNumberForSurah(String surahName) async {
    final pages = await getAllPages();

    for (int i = 0; i < pages.length; i++) {
      for (var surah in pages[i].surahs) {
        if (surah.surahName == surahName) {
          return i;
        }
      }
    }

    return 0; // لو مالقاش السورة يرجع أول صفحة
  }
}
