import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("Create account")),
          ElevatedButton(onPressed: () {}, child: Text("Login"))
        ],
      ),
    );
  }
}

// TODO: name, surname, usarname(id unique), password, repeat
// TODO: Create account button
// TODO:  Shared prefernces check id unic username
// TODO: Login button --> login_screen