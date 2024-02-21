import 'package:flutter/material.dart';

class PostFeed extends StatelessWidget {
  const PostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User info section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                // Replace 'Profile' text with user profile image
                child: Icon(Icons.person, size: 30),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'username',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'location',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert_rounded),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Post image section
        Container(
          height: 375,
          width: double.infinity,
          color: Color.fromARGB(
              255, 140, 210, 221), // Placeholder color for post image
          // Replace 'post' text with actual post image
          child: Center(child: Text('Post Image')),
        ),
        // Like, Comment, Share
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.mode_comment_outlined),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Likes count section
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            '0 likes',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Post caption section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(11, 11, 11, 0.921),
                  ),
                  children: [
                    TextSpan(
                      text: 'user   ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'caption',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Date posted section
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 4, bottom: 8),
          child: Text(
            'dateformat',
            style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(8, 0, 0, 1),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          height: 0,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
