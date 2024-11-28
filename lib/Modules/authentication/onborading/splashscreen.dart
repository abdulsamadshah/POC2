// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:getxbase/login.dart';
//
// // import 'home.dart';
// // Adjust if necessary
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
//
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         const Duration(seconds: 3),
//         () => Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => const LoginForm())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                   "assets/images/serve-bg.png"), // Adjust path as necessary
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: 340,
//                       margin: const EdgeInsets.only(top: 400.0),
//                       padding:
//                           const EdgeInsets.all(15.0), // Padding around the text
//                       decoration: BoxDecoration(
//                         color: const Color(
//                             0xFFFE8C00), // Background color of the box
//                         borderRadius:
//                             BorderRadius.circular(50), // Rounded corners
//                       ),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           Text(
//                             'We serve incomparable delicacies',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 32,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white),
//                           ),
//                           SizedBox(height: 10), // Space between texts
//                           Text(
//                             'All the best restaurants with their top menu waiting for you, they cant’t wait for your order!! sdf',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.white),
//                           ),
//                           SizedBox(height: 80),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             child: Row(
//                               children: <Widget>[
//                                 Expanded(
//                                   child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       "Skip",
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: Text(
//                                       "Next",
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
//

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxbase/Modules/homescreen/category.dart';
import 'package:getxbase/login.dart';
import 'package:getxbase/home.dart'; // Adjust the path if necessary

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    Timer(
      const Duration(seconds: 2),
      () {
        // Check if the user is logged in
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Navigate to Home if logged in
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Category()));
        } else {
          // Navigate to Login if not logged in
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>  LoginForm()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/serve-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 340,
                      margin: const EdgeInsets.only(top: 400.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFE8C00),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'We serve incomparable delicacies',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'All the best restaurants with their top menu waiting for you, they can’t wait for your order!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(height: 80),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Skip",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
