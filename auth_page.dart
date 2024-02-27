// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/home.dart';
import 'package:login_page/pages/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //if user is already signed in
          if(snapshot.hasData){
            return HomePage();
          }
          else{
            return LoginOrRegisterPage();
          }
        }
      )
    );
  }
}