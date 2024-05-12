import 'package:fitness_tracker/components/homepage/macro_nutrients_progress_indicators_widget.dart';
import 'package:fitness_tracker/components/homepage/radial_progress_indicator.dart';
import 'package:flutter/material.dart';

class MainNutritionalDataWidget extends StatelessWidget {
  const MainNutritionalDataWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    double progressValue = data['caloriesConsumed'] / data['caloriesToEat'];

    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Radial progress calories
          RadialProgressIndicator(
            progress: progressValue,
            remainingCalories: data['caloriesLeft'].toString(),
          ),

          // Macro nutrients progress indicators
          MacroNutrientsProgressIndicatorsWidget(
            data: data,
          ),
        ],
      ),
    );
  }
}
