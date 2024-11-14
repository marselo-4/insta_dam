import 'package:flutter/material.dart';

class Story {
  final String imageUrl;
  final String userName;

  Story(this.imageUrl, this.userName);
}

class StoriesWidget extends StatelessWidget {
  final List<Story> stories = [
    Story('https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg', 'Me'),
    Story('https://media.licdn.com/dms/image/v2/D4D03AQFx6717ghkM1w/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1713525824551?e=2147483647&v=beta&t=1Dmd1eLIq_ajfCuB5tDJVOA72RKlVzbM6H62HQmXiNI', 'Lujan'),
    Story('https://media.licdn.com/dms/image/v2/D4D03AQF8MdlsetrN5A/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1731361197002?e=1736985600&v=beta&t=cX1sHhoJFT_nAawc1fIMg_f2zqqq773TiqsHbGlP2lk', 'Alvaro'),
    Story('https://media.licdn.com/dms/image/v2/D5603AQHyYxdhP8mV2Q/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1719498858258?e=2147483647&v=beta&t=k2WoJyiwPQnDjvjr9wvnazb1eGIL519yW_sxjdujmtI', 'Jass'),
    Story('https://picsum.photos/200', 'Miguel'),
    Story('https://picsum.photos/200', 'Jorge'),
    Story('https://picsum.photos/200', 'Luis'),
    Story('https://picsum.photos/200', 'Jose'),
    Story('https://picsum.photos/200', 'Juan'),
    Story('https://picsum.photos/200', 'Pedro'),
  ];

  StoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: stories.map((story) {
          return Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 2),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(story.imageUrl),
                ),
                Text(story.userName),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
