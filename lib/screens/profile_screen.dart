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
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: FractionalOffset(.2, .5),
                  child: CircleAvatar(backgroundImage: NetworkImage("https://media.licdn.com/dms/image/v2/D5603AQHyYxdhP8mV2Q/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1719498858258?e=2147483647&v=beta&t=k2WoJyiwPQnDjvjr9wvnazb1eGIL519yW_sxjdujmtI"),
                  radius: 55,)
                ),
                
                Align(
                  alignment: const FractionalOffset(.5, .5),
                  child: ElevatedButton(onPressed: () {}, child: const Text("Seguir")),
                ),

                Align(
                  alignment: const FractionalOffset(.5, .5),
                  child: ElevatedButton(onPressed: () {}, child: const Text("Mensaje")),
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