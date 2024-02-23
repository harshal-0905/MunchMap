import 'package:flutter/material.dart';

class ReelView extends StatefulWidget {
  const ReelView({super.key});

  @override
  State<ReelView> createState() => _ReelViewState();
}

class _ReelViewState extends State<ReelView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Reel View'),
    );
  }
}
