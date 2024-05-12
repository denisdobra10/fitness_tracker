import 'package:fitness_tracker/components/homepage/main_nutritional_data_widget.dart';
import 'package:fitness_tracker/components/homepage/user_banner_widget.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:fitness_tracker/utils/date_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageTopWidget extends StatelessWidget {
  const HomepageTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // User banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: UserBannerWidget(
              formattedCurrentDate: DateService.formatDateToday(),
              userName: appCoreProvider.userData['user']['name'],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Main nutritional data widget
          MainNutritionalDataWidget(
            data: appCoreProvider.userData['dailyMacroData'],
          ),
        ],
      ),
    );
  }
}
