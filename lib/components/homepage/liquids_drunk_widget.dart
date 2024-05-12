import 'package:fitness_tracker/components/homepage/liquid_data_container.dart';
import 'package:fitness_tracker/services/api_service.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';

class LiquidsDrunkWidget extends StatelessWidget {
  const LiquidsDrunkWidget({
    super.key,
    required this.interactable,
    required this.appCoreProvider,
    this.water,
    this.juice,
    this.coffee,
    this.tea,
  });

  final bool interactable;
  final AppCore appCoreProvider;
  final int? water, juice, coffee, tea;

  void updateLiquid(int userId, String type) async {
    final response = await ApiService().updateLiquid(userId, type);
    appCoreProvider.updateUserData(response!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // Apa si suc
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: LiquidDataContainer(
                      containerColor: Colors.lightBlue,
                      transparency: 0.2,
                      liquidName: "Apa",
                      cups: (water) != null
                          ? water
                          : appCoreProvider.userData['liquidsData']['water'],
                      interactable: interactable,
                      onPressed: () => updateLiquid(
                          appCoreProvider.userData['user']['id'], 'water'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: LiquidDataContainer(
                      containerColor: Colors.orange,
                      transparency: 0.2,
                      liquidName: "Suc Natural",
                      cups: (juice != null)
                          ? juice
                          : appCoreProvider.userData['liquidsData']['juice'],
                      interactable: interactable,
                      onPressed: () => updateLiquid(
                          appCoreProvider.userData['user']['id'], 'juice'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Cafea si ceai
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: LiquidDataContainer(
                    containerColor: Colors.brown,
                    transparency: 0.2,
                    liquidName: "Cafea",
                    cups: (coffee != null)
                        ? coffee
                        : appCoreProvider.userData['liquidsData']['coffee'],
                    interactable: interactable,
                    onPressed: () => updateLiquid(
                        appCoreProvider.userData['user']['id'], 'coffee'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: LiquidDataContainer(
                    containerColor: Colors.green,
                    transparency: 0.2,
                    liquidName: "Ceai",
                    cups: (tea != null)
                        ? tea
                        : appCoreProvider.userData['liquidsData']['tea'],
                    interactable: interactable,
                    onPressed: () => updateLiquid(
                        appCoreProvider.userData['user']['id'], 'tea'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
