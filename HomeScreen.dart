// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:munchmap_org/components/post_feed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: SizedBox(
          width: 105,
          height: 28,
          child: Image.asset('images/logo.jpg'),
        ),
        leading: Text('  id  '),
        actions: [
          const Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
            size: 30,
          ),
          const Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
        ],
        backgroundColor: Color.fromARGB(255, 141, 242, 225),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostFeed();
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
