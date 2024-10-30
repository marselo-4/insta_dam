import 'package:flutter/material.dart';
import 'package:insta_dam/widgets/landing_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    //_checkFirstTime(); //TODO: Descomentar esta linea para implementar la funcionalidad
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (!isFirstTime) {
      _navigateToLogin();
    } else {
      setState(() {
        _isFirstTime = true;
      });
      prefs.setBool('isFirstTime', false);
    }
  }

  void _navigateToLogin() {
    Navigator.of(context).pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    if (!_isFirstTime) {
      return Container();
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          if (index == 2) {
        _navigateToLogin();
          }
        },
        children: [
          landingWidget("assets/img/marketing.png", "¡Descubre la mejor app para publicitar tu negocio!"),
          landingWidget("assets/img/error.png", "Ahorra tiempo y dinero con nosotros"),
          Container()
        ],
      ),
    );
  }
}