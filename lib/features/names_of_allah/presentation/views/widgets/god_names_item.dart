import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sakina_app/features/names_of_allah/data/models/god_names_category_model.dart';
import 'package:sakina_app/features/names_of_allah/presentation/views/god_names_detials_view.dart';

class GodNamesItem extends StatelessWidget {
  final GodNamesCategoryModel category;

  const GodNamesItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(23),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryDetailsScreen(godNamesCategoryModel: category);
            },
          ),
        );
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: category.colors, // 🔥 هنا بيستخدم الألوان اللي جاية
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                size: 40,
                color: Colors.white,
              ),

              const SizedBox(height: 14),
              Text(
                category.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
