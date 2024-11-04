import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo;
    });
  }

  void _publishPost() {
    // TODO: Enviar los datos a la lista
    final String description = _descriptionController.text;
    if (_image != null && description.isNotEmpty) {
      print('Publicar: ${_image!.path}, Descripción: $description');
      Navigator.pushNamed(context, '/home');
      setState(() {
        _image = null;
        _descriptionController.clear();
      });
    } else {
      AlertDialog(
        title: const Text('Error'),
        content: const Text(
            'No se ha seleccionado una imagen o no se ha añadido una descripción'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _image == null
              ? <Widget>[
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Seleccionar imagen'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _takePhoto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Take a photo'),
                  ),
                ]
              : <Widget>[
                  Image.file(File(_image!.path), width: 350, height: 350),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Añadir una descripción...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _publishPost,
                    child: const Text('Publicar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
