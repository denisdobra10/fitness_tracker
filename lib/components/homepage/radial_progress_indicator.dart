import 'package:fitness_tracker/components/homepage/radial_painter.dart';
import 'package:flutter/material.dart';

class RadialProgressIndicator extends StatelessWidget {
  const RadialProgressIndicator({
    super.key,
    required this.progress,
    required this.remainingCalories,
  });

  final double progress;
  final String remainingCalories;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progress: progress, context: context),
      child: SizedBox(
        width: 125,
        height: 125,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: remainingCalories,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const TextSpan(text: '\n'),
                TextSpan(
                  text: 'kcal ramase',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
