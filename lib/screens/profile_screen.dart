  import 'dart:math';

  import 'package:flutter/material.dart';

  class ProfileScreen extends StatefulWidget {

    const ProfileScreen({super.key});

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
  }

  class _ProfileScreenState extends State<ProfileScreen> {
    List<String> posts = [
      'https://picsum.photos/500/800',
      'https://picsum.photos/500/800',
      'https://picsum.photos/500/800',
      'https://picsum.photos/500/800',
      'https://picsum.photos/500/800',

    ];
    String followersNumber = Random().nextInt(1000).toString();
    String followingNumber = Random().nextInt(100).toString();
    String username = "alvaromillaness";
    String accName = 'Alvaro Millanes Sabaté';
    String descripcion = 'Viviendo una aventura a la vez 🌍✨\n'
      'Aquí para compartir lo que amo y lo que hago ❤️\n'
      'Amante de los pequeños detalles y las grandes experiencias 🌟';

    

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: const FractionalOffset(.05, 2),
                      child: Text(
                      username,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    )
                  ),
            
            //foto + seguidores, seguidos...
            Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                padding: const EdgeInsets.only(left: 8, right: 8),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: FractionalOffset(.2, .5),
                      child: CircleAvatar(backgroundImage: AssetImage('assets/img/avatar.jpg'),
                      radius: 45,)
                    ),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(posts.length.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        const Text("pubicaciones")
                      ],
                    ),
            
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(followersNumber, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        const Text("seguidores")
                      ],  
                    ),
            
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(followingNumber, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        const Text("siguiendo")
                      ],
                    )
                  ],
                )
            
                
              ),
            // descripcion
            Center(
              
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(maxHeight: 150),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Nombre persona
                    Text(accName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  
                  //descripcion
                  Text(descripcion, maxLines: 5, overflow: TextOverflow.ellipsis,)
                  ],
                  
                ),
              ),
            ),
            //editar + compartir
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.black, width: .5), 
                          ),
                          padding: const EdgeInsets.all(8), 
                        ),
                        child: const Text(
                          'Editar',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16), 
                        ),
                      ),
                    ),
            
                    const SizedBox(width: 8), 
            
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.black, width: .5),
                          ),
                          padding: const EdgeInsets.all(8),
                        ),
                        child: const Text(
                          'Compartir',
                          style: TextStyle(color: Colors.black, fontSize: 16), 
                        ),
                      ),
                    ),
                  ],
                ),
            
              ),
            ),
            //posts
            Expanded(
              child: GridView.builder(
                
                itemCount: posts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.network(posts[index], fit: BoxFit.cover,)
                    ),
                  );
                }
                ),
            ),
            
              ],
            ),
          )
        
      );
    }
  }