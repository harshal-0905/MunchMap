import 'package:flutter/material.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/pages/signup_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login page

  bool showLoginPage = true;

  //toggle between login page and register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    }
    else{
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}