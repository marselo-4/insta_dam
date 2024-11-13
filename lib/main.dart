import 'package:flutter/material.dart';
import 'package:insta_dam/screens/home_screen.dart';
import 'package:insta_dam/screens/landing_screen.dart';
import 'package:insta_dam/screens/login_screen.dart';
import 'package:insta_dam/screens/post_screen.dart';
import 'package:insta_dam/screens/profile_screen.dart';
import 'package:insta_dam/screens/settings_screen.dart';
import 'package:insta_dam/screens/signup_screen.dart';

void main() {
  runApp(const InstaDam());
  }

class InstaDam extends StatelessWidget {
  final bool isDebugMode = true;
  const InstaDam({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'InstaDam',
      home: const LandingScreen(),
      initialRoute: isDebugMode ? '/home' : '/landing',
      routes: {
        '/landing': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/post': (context) => const PostScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

