import 'package:fitness_tracker/pages/home_page.dart';
import 'package:fitness_tracker/services/api_service.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildingProfilePage extends StatefulWidget {
  const BuildingProfilePage({super.key});

  @override
  State<BuildingProfilePage> createState() => _BuildingProfilePageState();
}

class _BuildingProfilePageState extends State<BuildingProfilePage> {
  final imagesURLs = [
    'assets/preparing-profile.gif',
    'assets/profile-built.gif'
  ];

  int phase = 0;
  String imageURL = '';
  bool profileCreated = false;

  @override
  void initState() {
    super.initState();
    imageURL = imagesURLs[phase];

    startProcess();
  }

  void startProcess() async {
    if (phase == 1) {
      await Future.delayed(const Duration(seconds: 5));
      navigateToHomepage();
    } else {
      await Future.delayed(const Duration(seconds: 5));

      setState(() {
        phase++;
        imageURL = imagesURLs[phase];
      });

      // Restart the process
      startProcess();
    }
  }

  void navigateToHomepage() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1500),
        pageBuilder: (_, __, ___) => const HomePage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  void sendDataToApi(AppCore provider) async {
    var response = await ApiService().createUser(provider.initialProfileData);
    provider.updateUserData(response!);

    setState(() {
      profileCreated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appCoreProvider = Provider.of<AppCore>(context);
    if (!profileCreated) {
      sendDataToApi(appCoreProvider);
    }

    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeInOut,
            ),
          ),
          child: Image.asset(imageURL),
        ),
      ),
    );
  }
}
