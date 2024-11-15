import 'dart:io';
import 'dart:math';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class Post {
  //final String avatarImage;
  final String userName;
  final String postImage;
  final String description;
  bool isLiked;
  List<Map<String, String>> comments;

  Post({
    //required this.avatarImage,
    required this.userName,
    required this.postImage,
    required this.description,
    this.isLiked = false,
    this.comments = const [
      {'user': 'Carlos', 'comment': 'Lets fucking go!'},
    ],
  });
}

class PostWidget extends StatefulWidget {
  final List<Post> posts;

  const PostWidget({super.key, required this.posts});

  @override
  PostWidgetState createState() => PostWidgetState();
}

class PostWidgetState extends State<PostWidget> {
  final TextEditingController _commentController = TextEditingController();
  int? _selectedPostIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          final post = widget.posts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/img/avatar.webp'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          post.userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(post.postImage)),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            post.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: post.isLiked ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              post.isLiked = !post.isLiked;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chat_bubble_rounded),
                          onPressed: () {
                            setState(() {
                              _selectedPostIndex = index;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.send_rounded),
                          onPressed: () {
                            Share.shareXFiles([XFile(post.postImage)], text: post.description);
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Liked by ${post.userName} and 100 others',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(post.description, style: const TextStyle(fontWeight: FontWeight.w700),),
                        const SizedBox(height: 5),
                        Text(
                          'View all ${post.comments.length} comments',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ...post.comments.map((comment) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${comment['user']}: ${comment['comment']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          );
                        }),
                        if (_selectedPostIndex == index)
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _commentController,
                                  decoration: const InputDecoration(
                                    hintText: 'Add a comment...',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send_rounded),
                                onPressed: () {
                                  setState(() {
                                    post.comments = List.from(post.comments)
                                      ..add({
                                        'user': post.userName,
                                        'comment': _commentController.text,
                                      });
                                    _commentController.clear();
                                    _selectedPostIndex = null;
                                  });
                                },
                              ),
                            ],
                          ),
                        Text(
                          Random().nextInt(23) + 1 > 1
                              ? '${Random().nextInt(24)} hours ago'
                              : '${Random().nextInt(24)} hour ago',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
