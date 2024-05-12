import 'package:flutter/material.dart';
import 'package:fitness_tracker/components/calendarpage/calendar_navbar_widget.dart';
import 'package:fitness_tracker/components/calendarpage/meals_summary_widget.dart';
import 'package:fitness_tracker/components/homepage/liquids_drunk_widget.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime selectedDate;
  Map<String, dynamic>? selectedDateData;
  late List<String> availableDates;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    availableDates = (appCoreProvider.userData['calendar'] as List<dynamic>)
        .map((entry) => entry['date'] as String)
        .toList();

    selectedDateData =
        (appCoreProvider.userData['calendar'] as List<dynamic>).firstWhere(
      (obj) => obj['date'] == _formatDate(selectedDate),
      orElse: () => null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top navbar between summary sorted by day
        CalendarNavBarWidget(
          dayData: selectedDateData!,
          formattedDate: _formatDate(selectedDate),
          selectedDate: selectedDate,
          onPreviousDate: () {
            final previousDates = availableDates
                .where((date) => date.compareTo(_formatDate(selectedDate)) < 0)
                .map(DateTime.parse)
                .toList();
            if (previousDates.isNotEmpty) {
              setState(() {
                selectedDate = previousDates.first;
                selectedDateData =
                    (appCoreProvider.userData['calendar'] as List<dynamic>)
                        .firstWhere(
                  (obj) => obj['date'] == _formatDate(selectedDate),
                  orElse: () => null,
                );
              });
            }
          },
          onNextDate: () {
            final nextDates = availableDates
                .where((date) => date.compareTo(_formatDate(selectedDate)) > 0)
                .map(DateTime.parse)
                .toList();
            if (nextDates.isNotEmpty) {
              setState(() {
                selectedDate = nextDates.first;
                selectedDateData =
                    (appCoreProvider.userData['calendar'] as List<dynamic>)
                        .firstWhere(
                  (obj) => obj['date'] == _formatDate(selectedDate),
                  orElse: () => null,
                );
              });
            }
          },
        ),

        // Liquids summary
        LiquidsDrunkWidget(
          interactable: false,
          appCoreProvider: appCoreProvider,
          water: selectedDateData!['liquidsData']['water'],
          juice: selectedDateData!['liquidsData']['juice'],
          coffee: selectedDateData!['liquidsData']['coffee'],
          tea: selectedDateData!['liquidsData']['tea'],
        ),

        // Meals summary
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: MealsSummaryWidget(data: selectedDateData!),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    return '$year-$month-$day';
  }
}
