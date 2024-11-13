import 'dart:io';
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
    // TODO: Enviar los datos a la lista
    final String description = _descriptionController.text;
    if (_image != null && description.isNotEmpty) {
      savePost(_image, description);
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

  void savePost(XFile? image, String description) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (image != null) {
      //Guardar el path de la imagen
      final directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/${image.name}';

      final File savedImage = await File(image.path).copy(imagePath);
      print('Imagen guardada en: $imagePath');
      
      //Guardar post en shared
      final postList = PostList();
      List<String>? imageList = await postList.getList('imageList');
      List<String>? descriptionList = await postList.getList('descriptionList');

      if (imageList != null && imageList.isNotEmpty) {
        imageList.add(imagePath);
        await prefs.setStringList('imageList', imageList);
        print('LISTA IMAGES GUARDADA/ACTUALIZADA');
      }else{
        imageList = [];
        imageList.add(imagePath);
        await prefs.setStringList('imageList', imageList);
        print('LISTA IMAGES CREADA');
      }

      if (descriptionList != null && descriptionList.isNotEmpty) {
        descriptionList.add(imagePath);
        await prefs.setStringList('descriptionList', descriptionList);
        print('LISTA DESCRIPTION GUARDADA/ACTUALIZADA');
      }else{
        descriptionList = [];
        descriptionList.add(imagePath);
        await prefs.setStringList('descriptionList', descriptionList);
        print('LISTA DESCRIPTION CREADA');
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
