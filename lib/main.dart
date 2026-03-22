import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi_calculator/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: "assets/splash/splash.png",
        nextScreen: Home(),
        duration: 1500,
        splashIconSize: 250,
        centered: true,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
