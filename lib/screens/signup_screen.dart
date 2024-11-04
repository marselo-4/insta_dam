import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool visible1 = true;
  bool visible2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        prefixIcon: Icon(Icons.person , color: Colors.pinkAccent,),
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
                        prefixIcon: Icon(Icons.person , color: Colors.pinkAccent,),
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
                        labelText: 'Username',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon: Icon(Icons.person , color: Colors.pinkAccent,),
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
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pinkAccent, width: 3.0),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline_rounded , color: Colors.pinkAccent,),
                          suffixIcon: IconButton(  color: Colors.pinkAccent,
                            icon: Icon(visible1
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                visible1 = !visible1;
                              });
                            },
                          )),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obscureText: visible1,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Repeat',
                          labelStyle: const TextStyle(
                              color: Colors.pinkAccent, fontSize: 15),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pinkAccent, width: 3.0),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline_rounded , color: Colors.pinkAccent,),
                          suffixIcon: IconButton(  color: Colors.pinkAccent,
                            icon: Icon(visible2
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                visible2 = !visible2;
                              });
                            },
                          )),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obscureText: visible2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                           Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.pinkAccent,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
