import 'dart:io';
import 'dart:math';
import 'package:insta_dam/services/list_storage_services.dart';
import 'package:flutter/material.dart';
import 'package:insta_dam/widgets/post_widget.dart';
import 'package:insta_dam/widgets/view_post_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
    loadData();
  }

  void loadPosts() async {
    final postList = SharedPrefList();

    final List<String>? imagePaths = await postList.getList('imageList');
    final List<String>? descriptionList =
        await postList.getList('descriptionList');

    if (imagePaths != null) {
      setState(() {
        posts.clear();

        for (int i = 0; i < imagePaths.length; i++) {
          posts.add(Post(
              postImage: imagePaths[i],
              description: descriptionList![i],
              userName: username ?? ""));
        }
      });
    } else {
      print('IMAGEPATHS ES NULL');
    }
  }

  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    SharedPrefList data = SharedPrefList();
    int? userId = prefs.getInt('userId');

    if (userId != null) {
      // Usa await para obtener los valores específicos de la lista según el ID del usuario
      username = await data.getDataById('username', userId);
      String? name = await data.getDataById('name', userId);
      String? surname = await data.getDataById('surname', userId);
      accName = '$name $surname';
    } else {
      // Si no hay un userId, toma los valores directamente de SharedPreferences
      accName = '${prefs.getString("name")} ${prefs.getString("surname")}';
    }

    // Actualiza el estado para reflejar los cambios en la interfaz de usuario
    setState(() {});
  }

  String followersNumber = Random().nextInt(1000).toString();
  String followingNumber = Random().nextInt(100).toString();
  String? username = "";
  String? accName = '';
  String? descripcion = 'Viviendo una aventura a la vez 🌍✨';

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
                  username!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),

          //foto + seguidores, seguidos...
          Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                      alignment: FractionalOffset(.2, .5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/avatar.jpg'),
                        radius: 45,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        posts.length.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("pubicaciones")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        followersNumber,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("seguidores")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        followingNumber,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("siguiendo")
                    ],
                  )
                ],
              )),
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
                  Text(
                    accName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),

                  //descripcion
                  Text(
                    descripcion!,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  )
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side:
                              const BorderSide(color: Colors.black, width: .5),
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                      child: const Text(
                        'Editar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Share.share('Mira mi perfil de InstaDam! Me llamo $username y tengo ${posts.length} publicaciones! 🌍✨');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side:
                              const BorderSide(color: Colors.black, width: .5),
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
          Expanded(
            child: GridView.builder(
                itemCount: posts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(2),
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                    ),
                                    child: viewPostWidget(
                                        "$username: ${posts[index].description} ",
                                        username ?? "",
                                        posts[index].postImage,
                                        posts[index].isLiked)),
                              ),
                            );
                          },
                          child: Image.file(
                            File(posts[index].postImage),
                            fit: BoxFit.cover,
                          )));
                }),
          ),
        ],
      ),
    ));
  }
}
