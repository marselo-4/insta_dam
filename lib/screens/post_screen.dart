import 'dart:io';
import 'package:insta_dam/screens/feed_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:insta_dam/services/list_storage_services.dart';

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
    final String description = _descriptionController.text;
    if (_image != null && description.isNotEmpty) {
      savePost(_image, description);
      setState(() {
        _image = null;
        _descriptionController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post publicado'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("There's no image or description"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void savePost(XFile? image, String description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (image != null) {
      //Guardar el path de la imagen
      final directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/${image.name}';

      await File(image.path).copy(imagePath);

      //Guardar post en shared
      final postList = SharedPrefList();
      List<String>? imageList = await postList.getList('imageList');
      List<String>? descriptionList = await postList.getList('descriptionList');

      if (imageList != null && imageList.isNotEmpty) {
        imageList.add(imagePath);
        await prefs.setStringList('imageList', imageList);
      } else {
        imageList = [];
        imageList.add(imagePath);
        await prefs.setStringList('imageList', imageList);
      }

      if (descriptionList != null && descriptionList.isNotEmpty) {
        descriptionList.add(imagePath);
        await prefs.setStringList('descriptionList', descriptionList);
      } else {
        descriptionList = [];
        descriptionList.add(imagePath);
        await prefs.setStringList('descriptionList', descriptionList);
      }
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
