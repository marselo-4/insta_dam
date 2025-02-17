import 'package:flutter/material.dart';
import 'package:insta_dam/widgets/post_widget.dart';
import 'package:insta_dam/widgets/stories_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:insta_dam/services/list_storage_services.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  void loadPosts() async {
    final postList = SharedPrefList();

    final List<String>? imagePaths = await postList.getList('imageList');
        final List<String>? descriptionList = await postList.getList('descriptionList');


    if (imagePaths != null) {
      final prefs = await SharedPreferences.getInstance();
      SharedPrefList data = SharedPrefList();
      int? userId = prefs.getInt('userId');
      String shared_username = userId != null
          ? (await data.getDataById('username', userId) ?? 'me')
          : 'me';

      setState(() {
        posts.clear();

        for (int i = imagePaths.length -1; i >= 0; i--) {
          posts.add(Post(
            userName: shared_username, //TODO cambiar mas adelante
            postImage: imagePaths[i], description: "$shared_username: ${descriptionList![i]}",
          ));
        }
      });
    } else {
      print('IMAGEPATHS ES NULL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: StoriesWidget(),
          ),
          PostWidget(posts: posts),
        ],
      ),
    );
  }
}
