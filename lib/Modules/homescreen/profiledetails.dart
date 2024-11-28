import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'category.dart';

class Profiledetails extends StatefulWidget {
  const Profiledetails({super.key});

  @override
  State<Profiledetails> createState() => _CategoryState();
}

final _formKeyss = GlobalKey<FormState>();

final nameController = TextEditingController();
final emailController = TextEditingController();
final mobNoController = TextEditingController();
final genderController = TextEditingController();
final dateofBirthController = TextEditingController();

Map<String, dynamic>? userProfile = {};

class _CategoryState extends State<Profiledetails> {
  File? _image; // To hold the selected image
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<Map<String, dynamic>?> getCurrentUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('register')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void fetchUserProfile() async {
    Map<String, dynamic>? profileData = await getCurrentUserProfile();
    if (profileData != null) {
      nameController.text = profileData['username'] ?? "";
      emailController.text = profileData['email'] ?? "";
      genderController.text = profileData['gender'] ?? "";
      dateofBirthController.text = profileData['dateOfBirth'] ?? "";
      mobNoController.text = profileData['mobNo'] ?? "";
    }
  }

  Future<void> saveUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('register')
            .doc(user.uid)
            .set({
          'uid': user.uid,
          'email': emailController.text,
          'username': nameController.text,
          'gender': genderController.text,
          'dateOfBirth': dateofBirthController.text,
          'mobNo': mobNoController.text,
          'createdAt': FieldValue.serverTimestamp(),
        });



        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Category()));

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/back-left-icon.png',
                            width: 25,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    Text(
                      'Personal Data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
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
              Form(
                key: _formKeyss,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Full Name',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Enter Your Full Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Full Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text('Date of birth'),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: dateofBirthController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Enter Your Date of birth',
                        ),
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() {
                              dateofBirthController.text =
                              "${date.day}/${date.month}/${date.year}";
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your date of birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Gender'),
                      const SizedBox(height: 10.0),
                      DropdownButtonFormField<String>(
                        value: genderController.text.isEmpty
                            ? null
                            : genderController.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: genderController.text.toString()=="" ? "Select Gender":"${genderController.text}",
                        ),
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            genderController.text = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text('Phone'),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: mobNoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Enter your Phone',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Email'),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        enabled: false,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Enter your Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFE8C00),
                          minimumSize: const Size(350, 0),
                          alignment: Alignment.bottomCenter,
                        ),
                        onPressed: () {
                          if (_formKeyss.currentState!.validate()) {
                            saveUserProfile();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: const Text('Save', style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
