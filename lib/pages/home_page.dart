import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:userhomepage/widgets/home_details.dart';
import 'package:userhomepage/widgets/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    HomeDetails(),
    Container(color: Colors.green),
    ProfileSection(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (int _index) {
          setState(() {
            _currentIndex = _index;
          });
        },
        items: [
          SalomonBottomBarItem(
            selectedColor: Colors.red,
            unselectedColor: Colors.blueGrey,
            icon: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.green,
            unselectedColor: Colors.blueGrey,
            icon: const Icon(Icons.add),
            title: const Text("Add"),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.blue,
            unselectedColor: Colors.blueGrey,
            icon: const Icon(Icons.person_2),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
