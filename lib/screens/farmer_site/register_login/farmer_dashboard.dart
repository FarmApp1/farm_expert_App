import 'package:flutter/material.dart';

class FarmerDash extends StatefulWidget {
  const FarmerDash({super.key});

  @override
  State<FarmerDash> createState() => _FarmerDashState();
}

class _FarmerDashState extends State<FarmerDash> {
  @override
  Widget build(BuildContext context) {
    return Text('data', style: TextStyle(color: Colors.white));
  }
}
