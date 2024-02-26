import 'package:flutter/material.dart';
import 'package:proto/screen/account_center.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Container(
          color: Colors.white,
          child: ListView(children: [
            //Account Center
            ListTile(
              leading: Icon(
                Icons.person_2_rounded,
                color: Colors.black,
              ),
              title: Text(
                'Account Center ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AccountCenter()));
              },
            ),

            //Saved Post
            ListTile(
              leading: Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
              title: Text(
                'Saved Post ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MySettings()));
              },
            ),

            //Blocked
            ListTile(
              leading: Icon(
                Icons.block,
                color: Colors.black,
              ),
              title: Text(
                'Blocked ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MySettings()));
              },
            ),

            //Help
            ListTile(
              leading: Icon(
                Icons.help_rounded,
                color: Colors.black,
              ),
              title: Text(
                'Help ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MySettings()));
              },
            ),

            //About
            ListTile(
              leading: Icon(
                Icons.info_rounded,
                color: Colors.black,
              ),
              title: Text(
                'About ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MySettings()));
              },
            ),
          ]),
        )));
  }
}
