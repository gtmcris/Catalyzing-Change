import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:userhomepage/pages/report.dart';
import 'package:userhomepage/widgets/home_details.dart';
import 'package:userhomepage/widgets/profile.dart';
import 'package:userhomepage/pages/schedule.dart';
import 'package:userhomepage/widgets/profile_widgets/profile/profile_new.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    HomeDetails(),
    UserSchedule(),
    ReportPage(),
    UserProfilePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(
            255, 250, 241, 255), // Set your desired light purple color here
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (int _index) {
            setState(() {
              _currentIndex = _index;
            });
          },
          items: [
            SalomonBottomBarItem(
              selectedColor: const Color.fromARGB(255, 23, 0, 88),
              unselectedColor: Colors.black,
              icon: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            SalomonBottomBarItem(
              selectedColor: const Color.fromARGB(255, 23, 0, 88),
              unselectedColor: Colors.black,
              icon: const Icon(Icons.schedule_outlined),
              title: const Text("Schedule"),
            ),
            SalomonBottomBarItem(
              selectedColor: const Color.fromARGB(255, 23, 0, 88),
              unselectedColor: Colors.black,
              icon: const Icon(Icons.report),
              title: const Text("Report"),
            ),
            SalomonBottomBarItem(
              selectedColor: const Color.fromARGB(255, 23, 0, 88),
              unselectedColor: Colors.black,
              icon: const Icon(Icons.person_2),
              title: const Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
