import 'package:fitness_tracker/components/homepage/macro_nutrient_progress_indicator.dart';
import 'package:flutter/material.dart';

class MacroNutrientsProgressIndicatorsWidget extends StatelessWidget {
  const MacroNutrientsProgressIndicatorsWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MacroNutrientProgressIndicator(
          name: "Proteina",
          leftAmount: data['proteinsLeft'],
          progress: data['proteinsConsumed'] / data['proteinToEat'],
          progressColor: Colors.red,
        ),
        MacroNutrientProgressIndicator(
          name: "Grasimi",
          leftAmount: data['fatsLeft'],
          progress: data['fatsConsumed'] / data['fatsToEat'],
          progressColor: Colors.green,
        ),
        MacroNutrientProgressIndicator(
          name: "Carbohidrati",
          leftAmount: data['carbohydratesLeft'],
          progress: data['carbohydrateConsumed'] / data['carbohydratesToEat'],
          progressColor: Colors.orange,
        ),
      ],
    );
  }
}
