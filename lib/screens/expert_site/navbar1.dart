import 'package:farmo_exp/screens/expert_site/chat.dart';
import 'package:farmo_exp/screens/expert_site/expertScreen.dart';
import 'package:farmo_exp/screens/expert_site/news_feed.dart';
import 'package:farmo_exp/screens/expert_site/expert_post.dart';
import 'package:farmo_exp/screens/expert_site/problems_users.dart';
import 'package:farmo_exp/screens/farmer_site/register_login/camera_screen.dart';
import 'package:farmo_exp/screens/farmer_site/register_login/farmer_dashboard.dart';
import 'package:flutter/material.dart';

class NavBar111 extends StatefulWidget {
  const NavBar111({Key? key}) : super(key: key);

  @override
  State<NavBar111> createState() => _NavBar111State();
}

class _NavBar111State extends State<NavBar111> {
  int current_index = 0;
  final List<Widget> pages = [
      UserProblem(),
      NewsFeed(),
      Chat(),
      Problem(),
   
   

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
          backgroundColor: Colors.green,
          iconSize: 26,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: current_index,
          selectedFontSize: 20,
          unselectedFontSize: 14,
          onTap: OnTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.feed), label: "Solution", tooltip: "Solution"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message", tooltip: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: "Settings",
                tooltip: "Settings"),
          ]),
    );
  }
}
