import 'package:fitness_tracker/components/calendarpage/pie_chart_widget.dart';
import 'package:flutter/material.dart';

class MacroNutrientsSummaryWidget extends StatelessWidget {
  const MacroNutrientsSummaryWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    double proteinsConsumed = data['macroData']['proteinsConsumed'];
    double fatsConsumed = data['macroData']['fatsConsumed'];
    double carbohydrateConsumed = data['macroData']['carbohydrateConsumed'];
    int caloriesConsumed = data['macroData']['caloriesConsumed'];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedChart(
            radius: 300,
            protein: proteinsConsumed,
            fats: fatsConsumed,
            carbs: carbohydrateConsumed,
          ),

          // Legenda
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '$caloriesConsumed kcal',
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 10,
                        color: Colors.red,
                      ),
                      const Text('Proteine')
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 10,
                        color: Colors.green,
                      ),
                      const Text('Grasimi')
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 10,
                        color: Colors.orange,
                      ),
                      const Text('Carbo')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
