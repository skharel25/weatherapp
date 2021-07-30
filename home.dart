import 'package:flutter/material.dart';
import 'package:messageboard/ExServices/auth.dart';
import 'package:messageboard/Pages/home/weather.dart';
import 'package:messageboard/data/EndUser.dart';

import 'ChatPage.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);
  final AuthenticationService auth = AuthenticationService();

// This is the main accounts and profile page.
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[500],
      appBar: AppBar(title: Text('Welcome to the Chat App')),
      //floatingActionButton:
      //   FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      body: SafeArea(
          child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This is the your profile page',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.right),
            Text(''),
            TextButton.icon(
                label: Text('Weather'),
                icon: Icon(Icons.wb_sunny),
                onPressed: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => Weather()));
                }),
            TextButton.icon(
              label: Text('Sign Out'),
              icon: Icon(Icons.person),
              style: TextButton.styleFrom(),
              onPressed: () async {
                await auth.signOut();
              },
            ),
          ],
        )
      ])),
    );
  }
}
