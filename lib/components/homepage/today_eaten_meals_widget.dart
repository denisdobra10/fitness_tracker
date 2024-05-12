import 'package:fitness_tracker/components/homepage/eaten_meal_box.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodayEatenMealsListWidget extends StatelessWidget {
  const TodayEatenMealsListWidget({
    super.key,
    required this.scrollDirection,
  });

  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    List<Widget> mealsList = (List.from(appCoreProvider.userData['todayMeals'])
            .isNotEmpty)
        ? [
            for (Map<String, dynamic> meal
                in List.from(appCoreProvider.userData['todayMeals']).reversed)
              EatenMealBox(
                mealType: meal['type'],
                name: meal['title'],
                kcal: meal['kcal'].toString(),
                protein: meal['protein'],
                fat: meal['fat'],
                carbo: meal['carbohydrate'],
              ),
          ]
        : [
            const Text(
              'Adauga o masa, apasand butonul +',
              style: TextStyle(fontSize: 16),
            ),
          ];

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mesele tale azi'.toUpperCase(),
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

          // Today eaten meals list
          SingleChildScrollView(
            scrollDirection: scrollDirection,
            child: Row(
              children: mealsList,
            ),
          ),
        ],
      ),
    );
  }
}
