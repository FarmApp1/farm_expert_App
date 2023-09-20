import 'package:farmo_exp/screens/farmer_site/register_login/camera_screen.dart';
import 'package:farmo_exp/screens/farmer_site/register_login/farmer_dashboard.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int current_index = 0;
  final List<Widget> pages = [
    CameraScreen(),
    FarmerDash(),
    FarmerDash(),
    FarmerDash(),
  ];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellowAccent,
          iconSize: 26,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: current_index,
          selectedFontSize: 20,
          unselectedFontSize: 14,
          onTap: OnTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.camera), label: "Home", tooltip: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Search", tooltip: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Search", tooltip: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                tooltip: "Settings"),
          ]),
    );
  }
}
