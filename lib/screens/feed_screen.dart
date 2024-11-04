import 'package:flutter/material.dart';
import 'package:insta_dam/widgets/post_widget.dart';
import 'package:insta_dam/widgets/stories_widget.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
final List<Post> posts = [
      Post(
        avatarUrl: 'https://media.licdn.com/dms/image/v2/D4D03AQG3aHvipA2thA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1715028282158?e=2147483647&v=beta&t=JTgZSJUblPpLwbazUh0AAPAS-zq1VtHpr8YGcgSG7WY',
        userName: 'Carlos',
        postImageUrl: 'https://picsum.photos/500/800',
      ),
      Post(
        avatarUrl: 'https://media.licdn.com/dms/image/v2/D4D03AQFx6717ghkM1w/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1713525824551?e=2147483647&v=beta&t=1Dmd1eLIq_ajfCuB5tDJVOA72RKlVzbM6H62HQmXiNI',
        userName: 'Lujan',
        postImageUrl: 'https://picsum.photos/500/800',
      ),
      Post(
        avatarUrl: 'https://picsum.photos/200',
        userName: 'Alvaro',
        postImageUrl: 'https://picsum.photos/500/800',
      ),
      Post(
        avatarUrl: 'https://media.licdn.com/dms/image/v2/D5603AQHyYxdhP8mV2Q/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1719498858258?e=2147483647&v=beta&t=k2WoJyiwPQnDjvjr9wvnazb1eGIL519yW_sxjdujmtI',
        userName: 'Jass',
        postImageUrl: 'https://i.redd.it/fxr1utfxnvb71.jpg',
      ),
      Post(
        avatarUrl: 'https://picsum.photos/200',
        userName: 'Miguel',
        postImageUrl: 'https://picsum.photos/500/800',
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: StoriesWidget()
          ),
          PostWidget(posts: posts,)
        ],
      ),
    );
  }
}