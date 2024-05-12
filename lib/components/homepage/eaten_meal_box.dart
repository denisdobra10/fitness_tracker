import 'package:flutter/material.dart';

class EatenMealBox extends StatelessWidget {
  const EatenMealBox({
    super.key,
    required this.mealType,
    required this.name,
    required this.kcal,
    required this.protein,
    required this.fat,
    required this.carbo,
  });

  final String mealType, name, kcal;
  final double protein, fat, carbo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealType.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '$kcal kcal',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              '${protein.toString()}g proteina',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
            Text(
              '${fat.toString()}g grasimi',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
            Text(
              '${carbo.toString()}g carbohidrati',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
