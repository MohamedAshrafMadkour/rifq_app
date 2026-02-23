import 'package:flutter/material.dart';
import 'package:sakina_app/features/azkar/presentation/views/widgets/counter_widget.dart';

class CounterRow extends StatelessWidget {
  const CounterRow({required this.items, super.key});
  final List items;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((item) {
        return CounterWidget(counterModel: item);
      }).toList(),
    );
  }
}
