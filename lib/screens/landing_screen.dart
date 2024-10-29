import 'package:flutter/material.dart';
import 'package:insta_dam/widgets/landing_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          LandingWidget("assets/img/marketing.png", "¡Descubre la mejor app para publicitar tu negocio!"),
          LandingWidget("assets/img/error.png", "Ahorra tiempo y dinero con nosotros"),
          LandingWidget("https://github.com/marselo-4/maps_app/blob/main/assets/img/error.png?raw=true", "lorem ipsum dolor sit amet"),
        ],
      ),
    );
  }
}