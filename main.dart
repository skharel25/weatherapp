// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messageboard/ExServices/auth.dart';
import 'package:provider/provider.dart';
import 'Pages/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/EndUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<EndUser>.value(
        value: AuthenticationService().user,
        initialData: null,
        child: MaterialApp(home: Wrapper()));
  }
}
