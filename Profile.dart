// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_page/Components/utils.dart';
import 'package:login_page/pages/Settings_page.dart';
import 'package:login_page/pages/edit_profile.dart';
import 'package:login_page/pages/feed_view.dart';
import 'package:login_page/pages/reel_view.dart';
import 'package:login_page/pages/tagged_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void signUserOut (){
  FirebaseAuth.instance.signOut();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.settings,
              color: const Color.fromARGB(255, 32, 32, 32),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MySettings()));
            },
          ),
  
          actions: [
            GestureDetector(
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: signUserOut,
            ),  
            SizedBox(width: 15,)
          ],
        ),
        //endDrawer: MyDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              //Profile Detail
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //following
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '364',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: 20,
                  ),

                  //profile pic
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 45,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : const CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fthenounproject.com%2Fbrowse%2Ficons%2Fterm%2Fdefault-profile%2F&psig=AOvVaw3VEXz5k7ms4WRCFfQuRRxO&ust=1709171953242000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNiLoPT3zIQDFQAAAAAdAAAAABAD'),
                            ),
                      Positioned(
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo),
                        ),
                        bottom: -5,
                        left: 60,
                      )
                    ],
                  ),

                  SizedBox(
                    width: 20,
                  ),

                  //followers
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '21.5k',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Followers',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 20),

              // name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Kavya',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(' | '),
                  Text(
                    'Developer',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),

              const SizedBox(height: 10),

              //bio
              Text(
                'UI Designer > Programmer > Youtube',
                style: TextStyle(
                    color: Colors.grey[600], fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              //link

              Text(
                'youtube.com/kavya',
                style: TextStyle(
                    color: Colors.blue[500], fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // buttons

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    //edit profile
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8)),
                        child: GestureDetector(
                          child: const Center(
                            child: Text("Edit Profile"),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => editProfile()));
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    //contact
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            "Contact",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // tab bar
              TabBar(
                tabs: const [
                  //feed tab
                  Tab(
                    icon: Icon(Icons.image, color: Colors.grey),
                  ),
                  // reel tab
                  Tab(
                    icon: Icon(Icons.video_collection, color: Colors.grey),
                  ),
                  //tagged tab
                  Tab(
                    icon: Icon(Icons.bookmark, color: Colors.grey),
                  ),
                ],
              ),

              //tab bar view
              Expanded(
                  child: TabBarView(children: [
                FeedView(),
                ReelView(),
                TaggedView(),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
