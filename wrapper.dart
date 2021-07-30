import 'package:flutter/material.dart';
import 'package:messageboard/Pages/authentication/authenticate.dart';
import 'package:messageboard/Pages/authentication/signIn.dart';
import 'package:messageboard/Pages/home/ChatPage.dart';
import 'package:messageboard/Pages/home/home.dart';
import 'package:messageboard/data/EndUser.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<EndUser>(context);
    print(user);
    // return either home or authenticate depending on whether the user is signed in or not.
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
