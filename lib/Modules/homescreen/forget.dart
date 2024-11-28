// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/category.dart';
import 'package:getxbase/Modules/homescreen/faviourtefood.dart';
import 'package:getxbase/Modules/homescreen/profiledetails.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Forget> {
  // ignore: non_constant_identifier_names
  TextEditingController NameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassVisible = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // ignore: avoid_unnecessary_containers
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const Text(
                    'Enter your email address and we’ll send you\n confirmation code to reset your password ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF878787)),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF000000)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Your Email',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 230),
                  ElevatedButton(
                    onPressed: () {
                      displaybottomsheet(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Faviourtefood(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE8C00),
                      minimumSize: const Size(350, 0),
                      alignment: Alignment.bottomCenter,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> displaybottomsheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) => SingleChildScrollView(
      child: Container(
        height: 500,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image display
            Image.asset(
              'assets/images/illustration-success.png', // Ensure the correct path to your image
              height: 168, // Adjust the height of the image
              width: 207, // Adjust the width of the image
            ),
            const SizedBox(height: 20), // Space between image and text
            const Text(
              'Password Changed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10), // Space between title and description
            const Text(
              'Password changed successfully. You can log in again with the new password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Category(), // No semicolon here
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFE8C00),
                minimumSize: const Size(350, 0),
                alignment: Alignment.bottomCenter,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Verify Account',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
