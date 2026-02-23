import 'package:flutter/material.dart';
import 'package:sakina_app/features/quran/presentation/views/widgets/DotsLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sakina_app/features/quran/models/surah_model.dart';
import 'package:sakina_app/features/quran/services/quran_pages_service.dart';
import 'package:sakina_app/features/quran/presentation/views/widgets/page_indicator.dart';
import 'package:sakina_app/features/quran/presentation/views/widgets/quran_page_content.dart';

class SurahDetailsView extends StatefulWidget {
  final Surah surah;

  const SurahDetailsView({super.key, required this.surah});

  @override
  State<SurahDetailsView> createState() => SurahDetailsViewState();
}

class SurahDetailsViewState extends State<SurahDetailsView> {
  late Future<List<QuranPage>> quranPages;
  final PageController pageController = PageController();
  int currentPage = 0;
  int initialPage = 0;
  String currentSurahName = '';

  @override
  void initState() {
    super.initState();
    currentSurahName = widget.surah.name;
    loadPages();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> loadPages() async {
    quranPages = QuranPagesService.getAllPages();
    
    // Load saved page for this specific surah
    final prefs = await SharedPreferences.getInstance();
    final surahKey = 'last_page_${widget.surah.name}';
    final savedPage = prefs.getInt(surahKey);
    
    // Get the first page of this surah
    final firstPageOfSurah = await QuranPagesService.getPageNumberForSurah(widget.surah.name);
    
    // Check if saved page is still within this surah
    bool isStillInThisSurah = false;
    if (savedPage != null) {
      final savedPageData = (await quranPages)[savedPage];
      for (var surah in savedPageData.surahs) {
        if (surah.surahName == widget.surah.name) {
          isStillInThisSurah = true;
          break;
        }
      }
    }
    
    // Use saved page if it's still in this surah, otherwise use first page
    initialPage = (isStillInThisSurah && savedPage != null) ? savedPage : firstPageOfSurah;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients && mounted) {
        pageController.jumpToPage(initialPage);
        setState(() {
          currentPage = initialPage;
        });
      }
    });

    setState(() {});
  }

  // Save current page for this specific surah
  Future<void> saveCurrentPage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    final surahKey = 'last_page_${widget.surah.name}';
    await prefs.setInt(surahKey, page);
  }

  String getCurrentSurahName(QuranPage pageData) {
    if (pageData.surahs.isNotEmpty) {
      return pageData.surahs.first.surahName;
    }
    return widget.surah.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 50),

          Expanded(
            child: FutureBuilder<List<QuranPage>>(
              future: quranPages,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: DotsLoader(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('حدث خطأ في تحميل القرآن'),
                  );
                } else if (snapshot.hasData) {
                  final pages = snapshot.data!;

                  return Stack(
                    children: [
                      PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                            currentSurahName =
                                getCurrentSurahName(pages[index]);
                          });
                          // Save current page to SharedPreferences
                          saveCurrentPage(index);
                        },
                        itemCount: pages.length,
                        itemBuilder: (context, pageIndex) {
                          final pageData = pages[pageIndex];

                          return QuranPageContent(
                            pageData: pageData,
                            pageIndex: pageIndex,
                            allPages: pages,
                            currentSurahName: currentSurahName,
                          );
                        },
                      ),

                      PageIndicator(
                        currentPage: currentPage,
                        totalPages: pages.length,
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}