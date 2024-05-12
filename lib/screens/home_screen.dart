import 'package:fitness_tracker/components/homepage/homepage_top_widget.dart';
import 'package:fitness_tracker/components/homepage/liquids_drunk_widget.dart';
import 'package:fitness_tracker/components/homepage/today_eaten_meals_widget.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Column(
      children: [
        // Widget-ul de top
        const HomepageTopWidget(),

        // The rest of free space
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Today eaten meals widget
                const TodayEatenMealsListWidget(
                    scrollDirection: Axis.horizontal),

                // Liquids drunk widgets
                LiquidsDrunkWidget(
                  interactable: true,
                  appCoreProvider: appCoreProvider,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
