import 'package:flutter/material.dart';
import 'package:insta_dam/screens/landing_screen.dart';

void main() {
  runApp(const InstaDam());
}

class InstaDam extends StatelessWidget {
  const InstaDam({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'InstaDam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingScreen(),
    );
  }
}

