import 'package:flutter/material.dart';
import 'package:insta_dam/bbdd/db.dart';
import 'package:insta_dam/screens/home_screen.dart';
import 'package:insta_dam/screens/landing_screen.dart';
import 'package:insta_dam/screens/loading_screen.dart';
import 'package:insta_dam/screens/login_screen.dart';
import 'package:insta_dam/screens/post_screen.dart';
import 'package:insta_dam/screens/profile_screen.dart';
import 'package:insta_dam/screens/settings_screen.dart';
import 'package:insta_dam/screens/signup_screen.dart';
import 'package:insta_dam/services/sql_service.dart';

void main() {
  runApp(const InstaDam());
  DB.initdb();
  SqlService.selectSessionPath();
  }

class InstaDam extends StatefulWidget {
  const InstaDam({super.key});
  
  @override
  State<InstaDam> createState() => _InstaDamState();
}

class _InstaDamState extends State<InstaDam> {
  final bool isDebugMode = false;
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'InstaDam',
            initialRoute: "/loading",
            routes: {
              '/loading': (context) => const LoadingScreen(),
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