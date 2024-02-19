import 'package:flutter/material.dart';

class PostFeed extends StatelessWidget {
  const PostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 75,
          color: Colors.white,
          child: Center(
            child: ListTile(
              leading: ClipOval(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              title: Text(
                'username',
                style: TextStyle(fontSize: 13),
              ),
              subtitle: Text(
                'location',
                style: TextStyle(fontSize: 10),
              ),
              trailing: const Icon(Icons.more_horiz),
            ),
          ),
        ),
        Container(
          height: 375,
          width: 375,
          child: Text(
            'post',
            //fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 375,
          color: Colors.white,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.favorite_outlined,
                    size: 25,
                  ),
                  SizedBox(width: 25),
                  Icon(
                    Icons.comment,
                    size: 25,
                  ),
                  SizedBox(width: 25),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.share,
                      size: 25,
                      //   SizedBox(width: 25),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 19,
                  top: 13.5,
                  bottom: 5,
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'usern ' + '',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'caption',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 8),
                child: Text(
                  'dateformat',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
