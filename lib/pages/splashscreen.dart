import 'dart:async';
import 'package:dwallet/pages/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Lottie.asset(
        "assets/animations/Animation - 1726249324920.json",
        repeat: true,
        width: 250,
        height: 250,
      ),
    );
  }
}
