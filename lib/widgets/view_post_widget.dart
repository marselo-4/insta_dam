import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

Widget viewPostWidget(String descripcion, String userName, String postImage, bool isLiked) {
  return Card(
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
                          backgroundImage: AssetImage('assets/img/avatar.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          userName,
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
                          image: FileImage(File(postImage)),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 10),
                    /*Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isLiked ? Colors.red : null,
                          ),
                          onPressed: () {
                            isLiked = !isLiked;
                                                      },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chat_bubble_rounded),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.send_rounded),
                          onPressed: () {},
                        ),
                      ],
                    ),*/
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Liked by ${userName} and ${Random().nextInt(100)} others',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(descripcion, style: const TextStyle(fontWeight: FontWeight.w700),),
                        const SizedBox(height: 5),
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
  }

