import 'package:farmo_exp/screens/farmer_site/register_login/camera_screen.dart';
import 'package:farmo_exp/screens/farmer_site/register_login/farmer_login.dart';
import 'package:farmo_exp/screens/onboarding_screens/roleSelectionScreen.dart';
import 'package:farmo_exp/widgets/navbar.dart';

import 'package:flutter/material.dart';

import 'screens/farmer_site/register_login/farmer_dashboard.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'RoleScreen',
      routes: {
        'RoleScreen': (context) => RoleSelectionScreen(),
        'FarmerLogin': (context) => FarmerLogin(),
        'Navbar': (context) => NavBar(),
        'FarmerDash': (context) => FarmerDash(),
        'CameraScreen': (context) => CameraScreen(),
      },
    ),
  );
}
