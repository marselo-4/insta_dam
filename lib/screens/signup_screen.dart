import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();

  bool toggleVisibility1 = true;
  bool toggleVisibilty2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/logo.jpg",
                width: 100,
                height: 75,
              ),
              Image.asset(
                "assets/img/instadam.jpg",
                width: 150,
                height: 60,
              ),
              const Text(
                'Connect through images',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'roboto',
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.pinkAccent,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 3.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Surname',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.pinkAccent,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 3.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                     TextField(
                      controller: usernameValue,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.pinkAccent,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 3.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordValue,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pinkAccent, width: 3.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.pinkAccent,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.pinkAccent,
                            icon: Icon(toggleVisibility1
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                toggleVisibility1 = !toggleVisibility1;
                              });
                            },
                          )),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obscureText: toggleVisibility1,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Repeat',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pinkAccent, width: 3.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.pinkAccent,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.pinkAccent,
                            icon: Icon(toggleVisibilty2
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                toggleVisibilty2 = !toggleVisibilty2;
                              });
                            },
                          )),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obscureText: toggleVisibilty2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    getUsername();
                      
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: const Text(
                            "Log in here!",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
void saveUsername() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', usernameValue.text);
  print("username guardado correctamente: " + usernameValue.text);
}

void savePassword() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('password', passwordValue.text);
  print("password guardada correctamente: $passwordValue");
}

void getUsername() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString("username");

  if (usernameValue.text == username) {
     print("usuario guardado: " + usernameValue.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Username already chosen'), 
      duration: Duration(seconds: 2),));
  }else{
    savePassword();
    saveUsername();
    Navigator.pushNamed(context, '/home');

  }

 
}

}
