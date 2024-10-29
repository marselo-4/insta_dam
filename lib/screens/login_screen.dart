import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/error.png"),
                const Text("Eslogan"),
                TextField(),
                TextField(),
                ElevatedButton(onPressed: () {}, child: Text("Enter")),
                ElevatedButton(onPressed: () {}, child: Text("Register"))
              ],
          ),
      ),
    );
  }
}


// TODO: Logo
// TODO: Eslogan
// TODO: Username + password
// TODO: Enter button --> home_screen
// TODO: Register button --> signup_screen