import 'package:fitness_tracker/components/homepage/eaten_meal_box.dart';
import 'package:flutter/material.dart';

class MealsSummaryWidget extends StatelessWidget {
  const MealsSummaryWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    List<dynamic> meals = data['meals'];

    List<Widget> mealRows = [];
    for (int i = 0; i < meals.length; i += 2) {
      int endIndex = (i + 2 <= meals.length) ? i + 2 : meals.length;
      List<dynamic> currentRowMeals = meals.sublist(i, endIndex);

      mealRows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: currentRowMeals.map((meal) {
            return EatenMealBox(
              mealType: meal['type'],
              name: meal['title'],
              kcal: meal['kcal'].toString(),
              protein: meal['protein'],
              fat: meal['fat'],
              carbo: meal['carbohydrate'],
            );
          }).toList(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mesele avute'.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
            wordSpacing: 2,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: mealRows,
            ),
          ),
        ),
      ],
    );
  }
}
