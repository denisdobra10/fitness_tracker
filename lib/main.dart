import 'package:fitness_tracker/pages/build_profile_page.dart';
import 'package:fitness_tracker/pages/home_page.dart';
import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppCore(),
      child: const FitnessTrackerApp(),
    ),
  );
}

class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 74, 49, 240),
        ),
        scaffoldBackgroundColor: Colors.grey[300],
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: Provider.of<AppCore>(context, listen: false).hasProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred: ${snapshot.error}'),
            );
          } else {
            final hasProfile = snapshot.data ?? false;
            return hasProfile ? const HomePage() : const BuildProfilePage();
          }
        },
      ),
    );
  }
}
