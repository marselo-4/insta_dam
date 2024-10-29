import 'package:flutter/material.dart';

  Widget LandingWidget (String imagen, String descripcion) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagen, width: 400,),
              const SizedBox(height: 8.0),
              Text(
                descripcion,
                style: const TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
        ),
      ),
    );
  }

  