import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    // Pick an image from the gallery
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null)
          Image.file(_image!, width: 100, height: 100), // Display the selected image
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Select Image'),
        ),
      ],
    );
  }
}
