import 'package:fitness_tracker/components/calendarpage/macro_summary_widgets.dart';
import 'package:flutter/material.dart';

class CalendarNavBarWidget extends StatelessWidget {
  const CalendarNavBarWidget({
    super.key,
    required this.selectedDate,
    required this.onPreviousDate,
    required this.onNextDate,
    required this.formattedDate,
    required this.dayData,
  });

  final DateTime selectedDate;
  final VoidCallback onPreviousDate;
  final VoidCallback onNextDate;
  final String formattedDate;
  final Map<String, dynamic> dayData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Nav arrows
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onPreviousDate,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    onPressed: onNextDate,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
            MacroNutrientsSummaryWidget(data: dayData)
          ],
        ),
      ),
    );
  }
}
