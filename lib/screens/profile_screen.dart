import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'bazoca33',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
         
        //foto + seguidores, seguidos...
        Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            color: Colors.blue,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(backgroundImage: "profile_image.png",)
                )
              ],
            )

            
          ),
        // descripcion
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            color: Colors.purple,
          ),
        ),
        //follow + mensaje
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            color: Colors.red,
          ),
        ),
        //posts
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.green,
          ),
        ),
        
          ],
        )
      
    );
  }
}