import 'package:flutter/material.dart';
import 'package:proto/screen/Settings_page.dart';
//import 'package:proto/screen/drawer.dart';
import 'package:proto/tabs/feed_view.dart';
import 'package:proto/tabs/reel_view.dart';
import 'package:proto/tabs/tagged_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

                  //profile pic
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                    ),
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
                        child: const Center(
                          child: Text("Edit Profile"),
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
