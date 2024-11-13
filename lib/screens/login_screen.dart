import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:insta_dam/services/list_storage_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isDebugMode = false; //TODO: quitar debug mode para prod
  bool notvisible = true;
  bool isRemembered = true;

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  void initState() {
    loadRememberMe();
    autoCompleteCredentials(controllerUsername, controllerPassword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/logo.jpg",
                  width: 200,
                  height: 100,
                ),
                Image.asset(
                  "assets/img/instadam.jpg",
                  width: 300,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Connect through images',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
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
                            borderSide: BorderSide(
                                color: Colors.pinkAccent, width: 3.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
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
                              icon: Icon(notvisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  notvisible = !notvisible;
                                });
                              },
                            )),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        obscureText: notvisible,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.pinkAccent,
                            value: isRemembered,
                            onChanged: (bool? value) {
                              setState(() {
                                isRemembered = value!;
                                saveRememberMe();
                              });
                            },
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        isDebugMode
                            ? print(
                                'Para hacer las comprobaciones quita debugmode')
                            : checkUser();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        'Enter',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: const Text(
                            "Sign up here!",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Username', controllerUsername.text);
    prefs.setString('Password', controllerPassword.text);
  }

  void saveRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRemembered', isRemembered);
  }

  Future<void> loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isRemembered = prefs.getBool('isRemembered') ?? false;
    });
  }

void checkUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final userList = SharedPrefList();

  List<String>? usernameList = await userList.getList('username');
  List<String>? passwordList = await userList.getList('password');

  if (usernameList != null && passwordList != null && usernameList.isNotEmpty && passwordList.isNotEmpty) {
    // Verifica si el nombre de usuario existe en la lista
    if (usernameList.contains(controllerUsername.text)) {
      int userNumber = usernameList.indexOf(controllerUsername.text);

      // Compara la contraseña en la posición del usuario encontrado
      if (passwordList[userNumber] == controllerPassword.text) {
        await prefs.setInt('userId', userNumber);

        Navigator.pushNamed(context, '/home');

        if (isRemembered == true) {
          saveCredentials();
        }
      } else {
        // Contraseña incorrecta
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect password'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      // Usuario no encontrado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username not found'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } else {
    // Listas vacías o nulas
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No registered users found. Please sign up first.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}


}

void autoCompleteCredentials(TextEditingController controllerUsername,
    TextEditingController controllerPassword) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('Username');
  String? password = prefs.getString('Password');

  if (username != null) {
    controllerUsername.text = username;
  } else if (username == null) {
    controllerUsername.text = "";
  }

  if (password != null) {
    controllerPassword.text = password;
  } else if (password == null) {
    controllerPassword.text = "";
  }
}
