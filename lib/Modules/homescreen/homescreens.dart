import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/categoryDetails.dart';
import 'package:getxbase/Modules/homescreen/forget.dart';
import 'package:getxbase/Modules/homescreen/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Homescreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  final _formkeys = GlobalKey<FormState>();
  bool isPassVisible = true;

  // Future<void> _login() async {
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();

  //   if (email.isEmpty || password.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please fill in both fields')),
  //     );
  //     return;
  //   }

  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Login successful')),
  //     );

  //     // Navigate to another screen, e.g., home screen
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Homescreen()),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     String errorMessage;
  //     if (e.code == 'user-not-found') {
  //       errorMessage = 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       errorMessage = 'Wrong password provided.';
  //     } else {
  //       errorMessage = 'Error: ${e.message}';
  //     }

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(errorMessage)),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkeys,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login to your \naccount.',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const Text(
                    'Please sign in to your account ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF878787)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Email Address ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add email format validation if necessary
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPassVisible,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(
                        icon: Icon(isPassVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPassVisible = !isPassVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Your other widgets here
                        InkWell(
                          onTap: () {
                            // Navigate to the Forget Password page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Forget(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFE8C00),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await _login();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Register(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE8C00),
                      minimumSize: const Size(350, 0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: const Divider(
                              color: Color(0xFF878787),
                              height: 56,
                            )),
                      ),
                      const Text(
                        'Or sign in with',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF878787),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: const Divider(
                              color: Color(0xFF878787),
                              height: 36,
                            )),
                      ),
                    ]),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/gp.png',
                              fit: BoxFit.none,
                            ),
                            const SizedBox(width: 20),
                            // Spacing between images
                            Image.asset(
                              'assets/images/facebook.png',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20),
                            // Spacing between images
                            Image.asset(
                              'assets/images/apple.png',
                              fit: BoxFit.cover,
                            ),
                          ]),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text.rich(TextSpan(
                        text: 'Dont have an account?',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: ' Register',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xffFE8C00),
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Register(),
                                  ),
                                );
                              },
                          )
                        ])),
                  ),
                  // The rest of your UI (social media buttons, register text, etc.) goes here...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Example of incorrect casting

  Future<void> _login() async {
    if (_formkeys.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        var userData = userCredential.user;

        if (userData != null) {
        } else {
          throw Exception("User data is null");
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${e.toString()}")),
        );
      }
    }
  }
}

class PigeonUserDetails {}

class ForgotPasswordPage {
  const ForgotPasswordPage();
}
