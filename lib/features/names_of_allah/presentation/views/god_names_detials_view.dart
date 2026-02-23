import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakina_app/features/names_of_allah/data/models/god_names_category_model.dart';
import 'package:sakina_app/features/reminder/presentation/views/widgets/reminder_appbar.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final GodNamesCategoryModel godNamesCategoryModel;
  const CategoryDetailsScreen({
    required this.godNamesCategoryModel,
    super.key,
  });

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  dynamic data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    final String response = await rootBundle.loadString(
      widget.godNamesCategoryModel.assetPath,
    );
    final decoded = json.decode(response);

    setState(() {
      data = decoded;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark
            ? const Color(0xFF1C1C1A)
            : const Color(0xFFF8F7F4),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  ReminderAppbar(
                    title: widget.godNamesCategoryModel.title,
                    showIcon: false,
                  ),
                  Expanded(child: _buildContent()),
                ],
              ),
      ),
    );
  }

  Widget _buildContent() {
    switch (widget.godNamesCategoryModel.id) {
      case "all":
      case "quran":
        return _buildNormalNames();

      case "pairs":
        return _buildPairs();

      case "not_in_quran":
        return _buildSimpleList();

      case "greatest_name":
        return _buildGreatestName();

      case "duaa":
        return _buildDuaa();

      default:
        return const Center(child: Text("لا يوجد محتوى"));
    }
  }

  // ------------------------------
  // 1️⃣ الأسماء العادية
  Widget _buildNormalNames() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return _card(
          title: item["name"],
          subtitle: item["meaning"],
        );
      },
    );
  }

  // ------------------------------
  // 2️⃣ الأسماء المتقابلة
  Widget _buildPairs() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return _card(
          title: item["pair"],
          subtitle: item["meaning"],
        );
      },
    );
  }

  // ------------------------------
  // 3️⃣ غير المذكورة في القرآن
  Widget _buildSimpleList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data["names"].length,
      itemBuilder: (context, index) {
        final name = data["names"][index];
        return _card(title: name);
      },
    );
  }

  // ------------------------------
  // 4️⃣ اسم الله الأعظم
  Widget _buildGreatestName() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...data["references"].map<Widget>((ref) {
          return _card(
            title: ref["hadith_source"],
            subtitle: ref["text"],
          );
        }).toList(),
      ],
    );
  }

  // ------------------------------
  // 5️⃣ الأدعية
  Widget _buildDuaa() {
    if (data is! Map) {
      return const Center(
        child: Text("خطأ في تحميل البيانات"),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // العنوان
        _specialHeaderCard(
          title: data["title"] ?? "",
          description: data["description"] ?? "",
        ),

        const SizedBox(height: 20),

        // الأحاديث
        ...List.generate(
          data["references"].length,
          (index) {
            final ref = data["references"][index];

            return _hadithCard(
              source: ref["hadith_source"] ?? "",
              text: ref["text"] ?? "",
            );
          },
        ),
      ],
    );
  }

  // ------------------------------
  // Card UI موحد
  Widget _card({required String title, String? subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(height: 1.6),
            ),
          ],
        ],
      ),
    );
  }

  Widget _specialHeaderCard({
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _hadithCard({
    required String source,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            source,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(height: 1.8),
          ),
        ],
      ),
    );
  }
}
