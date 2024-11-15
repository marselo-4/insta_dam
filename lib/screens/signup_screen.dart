import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:insta_dam/services/list_storage_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool toggleVisibility1 = true;
  bool toggleVisibilty2 = true;

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPassword2 = TextEditingController();

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
                "assets/img/logo.webp",
                width: 100,
                height: 75,
              ),
              Image.asset(
                "assets/img/instadam.webp",
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
                    TextField(
                      controller: controllerName,
                      decoration: const InputDecoration(
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
                    TextField(
                      controller: controllerSurname,
                      decoration: const InputDecoration(
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
                      controller: controllerUsername,
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
                      controller: controllerPassword,
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
                      controller: controllerPassword2,
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
                      _checkInput(
                          controllerUsername,
                          controllerName,
                          controllerSurname,
                          controllerPassword,
                          controllerPassword2,
                          context);
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
}

Future<void> _checkInput(
  TextEditingController controllerUsername,
  TextEditingController controllerName,
  TextEditingController controllerSurname,
  TextEditingController controllerPassword,
  TextEditingController controllerPassword2,
  BuildContext context) async {
  
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userList = SharedPrefList();

    Future<List<String>> getOrCreateList(String key) async {
      List<String>? list = await userList.getList(key);
      list ??= [];
      return list;
    }

    List<String> usernameList = await getOrCreateList('username');
    List<String> passwordList = await getOrCreateList('password');
    List<String> nameList = await getOrCreateList('name');
    List<String> surnameList = await getOrCreateList('surname');

    usernameList.add(controllerUsername.text);
    passwordList.add(controllerPassword.text);
    nameList.add(controllerName.text);
    surnameList.add(controllerSurname.text);

    await prefs.setStringList('username', usernameList);
    await prefs.setStringList('password', passwordList);
    await prefs.setStringList('name', nameList);
    await prefs.setStringList('surname', surnameList);

    int userId = usernameList.indexOf(controllerUsername.text);
    if (userId != -1) {
      await prefs.setInt('userId', userId);
    } else {
      print('Username not found');
    }

    await prefs.setString('Username', controllerUsername.text);
    prefs.setString('Password', controllerPassword.text);
    //await prefs.setBool('isRemembered', true);
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? users = prefs.getStringList('username');
  bool validUsername = true;

  if (users != null && users.isNotEmpty) {
    if (users.contains(controllerUsername.text)) {
      validUsername = false;
    }
  }

  if (controllerUsername.text.isEmpty || controllerPassword.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill in all the fields'),
        duration: Duration(seconds: 2),
      ),
    );
  } else if (controllerPassword.text.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password must be at least 6 characters long'),
        duration: Duration(seconds: 2),
      ),
    );
  } else if (controllerPassword.text != controllerPassword2.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Passwords do not match'),
        duration: Duration(seconds: 2),
      ),
    );
  } else if (!validUsername) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Username already chosen'),
      duration: Duration(seconds: 2),
    ));
  } else {
    saveData();
    Navigator.pushNamed(context, '/home');
  }
}
