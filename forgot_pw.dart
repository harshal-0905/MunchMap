//import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:proto/screen/forgot_pw_page.dart';

class PasswordReseet extends StatefulWidget {
  const PasswordReseet({super.key});

  @override
  State<PasswordReseet> createState() => _PasswordReseetState();
}

class _PasswordReseetState extends State<PasswordReseet> {
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Forgot Password'),
        //
        //
        //
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 250.0,
                //child: Image.asset("lib/image/forgot.jpg"),
                child: Icon(
                  Icons.lock,
                  size: 100,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: forgotPasswordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var forgotEmail = forgotPasswordController.text.trim();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                              "Password reset link sent! Check your email"),
                        );
                      },
                    );

                    try {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: forgotEmail)
                          .then((value) => {
                                print("Password Reset link sent!"),
                              });
                    } on FirebaseAuthException catch (e) {
                      print("Error $e");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(e.message.toString()),
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Forgot Password',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
