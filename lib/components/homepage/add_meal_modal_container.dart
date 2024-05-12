import 'package:fitness_tracker/components/rounded_button.dart';
import 'package:fitness_tracker/services/api_service.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMealModalContainer extends StatefulWidget {
  const AddMealModalContainer({
    super.key,
  });

  @override
  State<AddMealModalContainer> createState() => _AddMealModalContainerState();
}

class _AddMealModalContainerState extends State<AddMealModalContainer> {
  final mealTypesAvailable = ['Mic dejun', 'Pranz', 'Cina', 'Snack'];
  final macroNutrientsEnergeticValues = {'protein': 4, 'fat': 9, 'carbo': 4};
  late String selectedMealType;

  TextEditingController caloriesController = TextEditingController();

  double proteins = 0, fats = 0, carbs = 0, calories = 0;
  String title = "";

  void calculateCalories() {
    calories = proteins * macroNutrientsEnergeticValues['protein']! +
        fats * macroNutrientsEnergeticValues['fat']! +
        carbs * macroNutrientsEnergeticValues['carbo']!;

    if (calories > 0) {
      caloriesController.text = '$calories (kcal)';
    }
  }

  void addMeal(AppCore appCore, BuildContext context) async {
    final response = await ApiService().createMeal({
      "userId": appCore.userData['user']['id'],
      "type": selectedMealType,
      "title": title,
      "kcal": calories.toInt(),
      "protein": proteins,
      "fat": fats,
      "carbohydrate": carbs
    });

    appCore.updateUserData(response!);
  }

  @override
  void initState() {
    super.initState();
    selectedMealType = mealTypesAvailable[0];
  }

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Adauga o noua masa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Tipul Mesei',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedMealType,
                    onChanged: (newValue) {
                      setState(() {
                        selectedMealType = newValue!;
                      });
                    },
                    items: mealTypesAvailable
                        .map<DropdownMenuItem<String>>((String value) =>
                            DropdownMenuItem<String>(
                                value: value, child: Text(value)))
                        .toList(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Titlu',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        proteins = double.parse(value.replaceAll(',', '.'));
                        calculateCalories();
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Proteine (g)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        fats = double.parse(value.replaceAll(',', '.'));
                        calculateCalories();
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Grasimi (g)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        carbs = double.parse(value.replaceAll(',', '.'));
                        calculateCalories();
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Carbo (g)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: caloriesController,
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Calories (kcal)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'De stiut:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text:
                        'Caloriile se calculeaza automat in functie de numarul de proteine, grasimi si carbohidrati ai mesei.',
                  ),
                ],
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            Center(
              child: RoundedButton(
                onPressed: () {
                  addMeal(appCoreProvider, context);
                  Navigator.of(context).pop();
                },
                value: const Text("Adauga Masa"),
                width: double.infinity,
                height: 40,
                borderRadius: 20,
                textColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
