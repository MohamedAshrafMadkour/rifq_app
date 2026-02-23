import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    required this.max,
    required this.value,
    super.key,
  });
  final double max, value;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
        ),
        child: Slider(
          padding: EdgeInsets.zero,
          max: max,
          value: value,
          onChanged: (_) {},
          activeColor: const Color(0xff0D7E5E),
          inactiveColor: const Color(0xffC3DAD3),
        ),
      ),
    );
  }
}
