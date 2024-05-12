import 'package:fitness_tracker/components/buildprofilepage/question_page.dart';
import 'package:fitness_tracker/pages/building_profile_page.dart';
import 'package:flutter/material.dart';

class BuildProfilePage extends StatefulWidget {
  const BuildProfilePage({super.key});

  @override
  State<BuildProfilePage> createState() => _BuildProfilePageState();
}

class _BuildProfilePageState extends State<BuildProfilePage> {
  final List<String> questions = [
    'Cum te numesti',
    'Alege sexul (masculin/feminin)',
    'Alege varsta',
    'Greutate (kg)',
    'Inaltime (cm)',
    'Nivel de activitate',
  ];

  final PageController _controller = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregatirea profilului'),
        toolbarHeight: 100,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          return QuestionPage(
            question: questions[index],
            onNextPressed: () {
              if (_currentPageIndex < questions.length - 1) {
                setState(() {
                  _currentPageIndex++;
                });
                _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              } else {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 1500),
                    pageBuilder: (_, __, ___) => const BuildingProfilePage(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
