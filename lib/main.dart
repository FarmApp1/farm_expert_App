import 'package:farmo_exp/screens/farmer_site/register_login/camera_screen.dart';
import 'package:farmo_exp/screens/farmer_site/register_login/farmer_login.dart';
import 'package:farmo_exp/screens/onboarding_screens/roleSelectionScreen.dart';
import 'package:farmo_exp/widgets/navbar.dart';

import 'package:flutter/material.dart';

import 'screens/farmer_site/register_login/farmer_dashboard.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',

    theme: ThemeData(
      primaryColor: Colors.green,
      hintColor: Colors.greenAccent,
      fontFamily: 'Roboto',
      appBarTheme: AppBarTheme(
        color: Colors.green,
        elevation: 0, // Remove app bar shadow
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          fontSize: 16.0,
          color: Colors.black87, // Adjust text color
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: Colors.green,
      )),
    ), // Change button color
    initialRoute: 'RoleScreen',
    routes: {
      'RoleScreen': (context) => RoleSelectionScreen(),
      'FarmerLogin': (context) => FarmerLogin(),
      'Navbar': (context) => NavBar(),
      'FarmerDash': (context) => FarmerDash(),
      'CameraScreen': (context) => CameraScreen(),
    },
  ));
}
