import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/noorder.dart';

class Faviourtefood extends StatefulWidget {
  const Faviourtefood({super.key});

  @override
  State<Faviourtefood> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Faviourtefood> {
  // ignore: non_constant_identifier_names
  TextEditingController NameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassVisible = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
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
                    'Find Your \nFavorite Food',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  // const Center(
                  //   child: Image.asset(
                  //     'assets/images/no-page.png',
                  //     width:
                  //         200, // You can set the width/height based on your needs
                  //     height: 200,
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Search...', // Placeholder text inside the search bar
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon:
                          const Icon(Icons.search), // Icon on the left side
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Rounded corners
                      ),
                      contentPadding: const EdgeInsets.all(
                          10), // Padding inside the text field
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/images/no-page.png', // Path to your image in the assets folder
                      width: 180, // Set a width for the image (optional)
                      height: 136, // Set a height for the image (optional)
                      fit: BoxFit.cover, // Adjust the image scaling (optional)
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'We couldnt find any result! ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF101010)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Please check your search for any typos or \n spelling errors, or try a different search \n term. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF878787)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NoOrder(),
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
                        'Next',
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
