import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoUpload extends StatefulWidget {
  const ProfilePhotoUpload({super.key});

  @override
  _ProfilePhotoUploadState createState() => _ProfilePhotoUploadState();
}

class _ProfilePhotoUploadState extends State<ProfilePhotoUpload> {
  File? _image; // To hold the selected image

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Profile Photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected image
            _image == null
                ? const Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: const Text('Select from Gallery'),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
              child: const Text('Take a Photo'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfilePhotoUpload(),
  ));
}
