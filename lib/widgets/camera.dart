import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final _picker = ImagePicker();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: _image == null
                  ? const Text('No image selected.')
                  : Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.camera);

                setState(() {
                  if (pickedFile != null) {
                    _image = File(pickedFile.path);
                  } else {
                    _image = null;
                  }
                });
              },
              child: const Text('Take Picture'),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Describe your complaint here',
              ),
              maxLines: null,
            ),
            ElevatedButton(
              onPressed: () {
                // upload image and complaint description here
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
