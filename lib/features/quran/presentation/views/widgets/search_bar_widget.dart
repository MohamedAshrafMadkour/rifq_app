import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const SearchBarWidget({
    super.key,
    this.hintText = 'ابحث عن سورة...',
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTapOutside: (event) {
          // Close keyboard when user taps outside
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
          ),
          prefixIcon: Icon(
            Icons.search, 
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        ),
      ),
    );
  }
}
