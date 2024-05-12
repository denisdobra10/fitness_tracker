import 'package:fitness_tracker/components/buildprofilepage/activity_selection_widget.dart';
import 'package:fitness_tracker/components/buildprofilepage/age_selection_widget.dart';
import 'package:fitness_tracker/components/buildprofilepage/gender_selection_widget.dart';
import 'package:fitness_tracker/components/buildprofilepage/height_selection_widget.dart';
import 'package:fitness_tracker/components/buildprofilepage/weight_selection_widget.dart';
import 'package:fitness_tracker/components/buildprofilepage/name_selection_widget.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final String question;
  final VoidCallback onNextPressed;

  const QuestionPage({
    super.key,
    required this.question,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: const Interval(0.5, 1, curve: Curves.easeInOut),
              )),
              child: Text(
                question,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            if (question == 'Cum te numesti')
              NameSelectionWidget(onNextPressed: onNextPressed),
            if (question == 'Alege sexul (masculin/feminin)')
              GenderSelectionWidget(onNextPressed: onNextPressed),
            if (question == 'Alege varsta')
              AgeSelectionWidget(onNextPressed: onNextPressed),
            if (question == 'Greutate (kg)')
              WeightSelectionWidget(onNextPressed: onNextPressed),
            if (question == 'Inaltime (cm)')
              HeightSelectionWidget(onNextPressed: onNextPressed),
            if (question == 'Nivel de activitate')
              ActivityLevelSelectionWidget(onNextPressed: onNextPressed),
          ],
        ),
      ),
    );
  }
}
