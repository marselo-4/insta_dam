import 'package:flutter/material.dart';
import 'package:insta_dam/screens/home_screen.dart';
import 'package:insta_dam/screens/settings_screen.dart';
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
                    
                    switch (snapshot.data!) 
                    {
                      case ('/settings'):
                        return const SettingsScreen();

                      default:
                        return const HomeScreen();
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
