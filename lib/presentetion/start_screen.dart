import 'dart:async';

import 'package:algoocean_app/presentetion/home_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    });
    super.initState();
  }  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Algoocen",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
      ),
    );
  }
}
