import 'package:fitness_tracker/components/homepage/add_meal_modal_container.dart';
import 'package:fitness_tracker/screens/calendar_screen.dart';
import 'package:fitness_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';

final screens = [
  const HomeScreen(),
  const HomeScreen(),
  const CalendarScreen(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void bottomNavbarTapped(int index) {
    if (index == 1) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: AddMealModalContainer(),
          );
        },
      );
      return;
    }

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (value) => bottomNavbarTapped(value),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Icon(
                    Icons.home,
                    color: currentIndex == 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Icon(
                    Icons.add,
                    color: currentIndex == 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
                label: "Acasa"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Icon(
                    Icons.edit_calendar,
                    color: currentIndex == 2
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
                label: "Calendar"),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
