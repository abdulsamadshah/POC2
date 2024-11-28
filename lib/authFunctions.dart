import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/forget.dart';
// ignore: depend_on_referenced_packages

class AuthServices {

  static Future<void> saveUser(String name, String email, String uid) async {
    try {
      await FirebaseFirestore.instance.collection('register').doc(uid).set({
        'uid': uid,
        'email': email,
        'username': name,
        'gender': "",
        'dateOfBirth': "",
        'mobNo': "",
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("User data saved to Firestore.");
    } catch (e) {
      print("Error saving user data to Firestore: $e");
    }
  }


  static signupUser(String email, String password, String name, BuildContext context) async {
    try {
      // Create user in Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Update display name and email after registration
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);

      // Save user details to Firestore
      await saveUser(name, email, userCredential.user!.uid);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful')),
      );

      // Navigate to the next screen or close the registration screen
      // Navigator.pushReplacementNamed(context, '/home'); // Example navigation

    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The email provided is already in use.';
      } else {
        errorMessage = 'Error: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      // General error handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are Logged in')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Forget()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password did not match')));
      }
    }
  }
}

