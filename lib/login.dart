import 'package:flutter/material.dart';
import 'package:getxbase/authFunctions.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutterapp/services/authFunctions.dart';
// ignore: unused_import
import 'package:getxbase/services/authFunctions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key,});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Create your new \naccount.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Create an account to start looking for the food you like',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF878787),
                  ),
                ),
                const SizedBox(height: 30),

                const SizedBox(height: 10),
                // ======== Full Name ========
                login
                    ? Container()
                    : TextFormField(
                        key: const ValueKey('fullname'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Full Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Full Name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            fullname = value!;
                          });
                        },
                      ),

                // ======== Email ========
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                TextFormField(
                  key: const ValueKey('email'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                // ======== Password ========
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password',
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Please Enter Password of min length 6';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        login
                            ? AuthServices.signinUser(email, password, context)
                            : AuthServices.signupUser(
                                email, password, fullname, context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE8C00),
                      minimumSize: const Size(350, 0),
                    ),
                    child: Text(
                      login ? 'Login' : 'Register',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        login = !login;
                      });
                    },
                    child: Text(login
                        ? "Don't have an account? Register"
                        : "Already have an account? Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
