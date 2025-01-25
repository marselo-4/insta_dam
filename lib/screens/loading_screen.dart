import 'package:flutter/material.dart';
import 'package:insta_dam/screens/home_screen.dart';
import 'package:insta_dam/screens/landing_screen.dart';
import 'package:insta_dam/screens/login_screen.dart';
import 'package:insta_dam/screens/post_screen.dart';
import 'package:insta_dam/screens/profile_screen.dart';
import 'package:insta_dam/screens/settings_screen.dart';
import 'package:insta_dam/screens/signup_screen.dart';
import 'package:insta_dam/services/sql_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  Future<String> getRoute() async {
    String ruta = await SqlService.selectSessionPath();
    print("main --> " + ruta);
    return ruta;
  }

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    widget.getRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: widget.getRoute(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('${snapshot.data}');

              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    switch (snapshot.data!) {
                      case '/loading':
                        return const LoadingScreen();
                      case '/landing':
                        return const LandingScreen();
                      case '/login':
                        return const LoginScreen();
                      case '/signup':
                        return const SignUpScreen();
                      case '/home':
                        return HomeScreen(0);
                      case '/post':
                        return HomeScreen(1);
                      case '/profile':
                        return HomeScreen(2);
                      case '/settings':
                        return HomeScreen(3);
                      default:
                        return HomeScreen(0);
                    }
                  })));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
