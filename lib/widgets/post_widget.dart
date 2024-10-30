import 'package:flutter/material.dart';

class Post {
  final String avatarUrl;
  final String userName;
  final String postImageUrl;
  bool isLiked;

  Post({
    required this.avatarUrl,
    required this.userName,
    required this.postImageUrl,
    this.isLiked = false,
  });
}

class PostWidget extends StatefulWidget {
  final List<Post> posts;

  PostWidget({required this.posts});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          final post = widget.posts[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(post.avatarUrl), // Avatar URL from Post object
                        ),
                        SizedBox(width: 10),
                        Text(
                          post.userName, // Username from Post object
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 300, // Fixed height for post image
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(post.postImageUrl), // Post image URL from Post object
                          fit: BoxFit.cover,
                        ),
                        color: Colors.grey[300], // Placeholder color
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            post.isLiked ? Icons.favorite : Icons.favorite_border,
                            color: post.isLiked ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              post.isLiked = !post.isLiked;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
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