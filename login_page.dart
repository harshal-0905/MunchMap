import 'package:flutter/material.dart';
import 'package:login_page/Components/mytextfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        body: const SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),

                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),

                SizedBox(height: 50),

                //welcome back
                Text(
                  'Welcome back You\'ve been missed!',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  ),
                ),

                SizedBox(height: 25,),

                //username textfield
                MyTextField(
                  //controller: usernameController,
                  hintText: 'UserName',
                  obscureText: false,
                ),

                SizedBox(height: 10,),

                //password textfield
                MyTextField(
                  //controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                //forgot password

                //signin button

                //if not a member - sign up
              ],
            ),
          ),
        ));
  }
}
