import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraBoarding extends StatefulWidget {
  const CameraBoarding({super.key});

  @override
  State<CameraBoarding> createState() => _CameraBoardingState();
}

class prediction {
  late final String predict;
}

class _CameraBoardingState extends State<CameraBoarding> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = XFile(img!.path);
    });
  }

  Future<void> sendImage(BuildContext context) async {
    final bytes = await image!.readAsBytes();
    final dio = Dio();
    var respuesta;
    dio.options.baseUrl = 'http://192.168.89.114:8000/';
    //dio.options.headers['Authorization'] = 'Bearer your-token';

    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(bytes, filename: 'image.jpg'),
    });

    try {
      final response = await dio.post('api/v1/predecir/', data: formData);
      print(response.data);
      final respuesta = response.data;
      print('Imagen enviada');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Respuesta'),
              content: Text('La fruta es: $respuesta'),
            );
          });
      return respuesta;
    } catch (e) {
      print(e.toString());
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Respuesta'),
            content: Text('La fruta es: $respuesta'),
          );
        });
    // print(bytes);
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                myAlert();
              },
              child: const Text('Upload Photo'),
            ),
            const SizedBox(
              height: 10,
            ),
            //if image not null show the image
            //if image null show text
            image != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sendImage(context);
                          },
                          child: const Text('Send Image'),
                        ),
                      ],
                    ),
                  )
                : const Text(
                    "No Image",
                    style: TextStyle(fontSize: 20),
                  )
          ],
        ),
      ),
    );
  }
}
