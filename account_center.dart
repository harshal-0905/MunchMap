import 'package:flutter/material.dart';

class AccountCenter extends StatefulWidget {
  const AccountCenter({super.key});

  @override
  State<AccountCenter> createState() => _AccountCenterState();
}

class _AccountCenterState extends State<AccountCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Account center'),
      ),
    );
  }
}
