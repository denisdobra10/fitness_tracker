import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RoundedChart extends StatelessWidget {
  const RoundedChart({
    super.key,
    required this.radius,
    required this.protein,
    required this.fats,
    required this.carbs,
  });

  final double radius, protein, fats, carbs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius / 2,
      height: radius / 2,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: (protein > 0) ? protein : 33,
              color: Colors.red,
              title: '${protein.toStringAsFixed(1)} g',
              // radius: proteinRadius,
            ),
            PieChartSectionData(
              value: (fats > 0) ? fats : 33,
              color: Colors.green,
              title: '${fats.toStringAsFixed(1)} g',
              // radius: fatsRadius,
            ),
            PieChartSectionData(
              value: (carbs > 0) ? carbs : 33,
              color: Colors.orange,
              title: '${carbs.toStringAsFixed(1)} g',
              // radius: carbsRadius,
            ),
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}
