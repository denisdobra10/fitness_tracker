import 'package:flutter/material.dart';

class MacroNutrientProgressIndicator extends StatelessWidget {
  const MacroNutrientProgressIndicator({
    super.key,
    required this.name,
    required this.leftAmount,
    required this.progress,
    required this.progressColor,
  });

  final String name;
  final double leftAmount, progress;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  height: 10,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Container(
                  height: 10,
                  width: (progress <= 1) ? 100 * progress : 100,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Text("${leftAmount.toStringAsFixed(1)} g ramase"),
          ],
        ),
      ],
    );
  }
}
