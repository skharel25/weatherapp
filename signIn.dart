import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:messageboard/ExServices/auth.dart';
import 'package:messageboard/Pages/authentication/signup.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);

  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticationService auth = AuthenticationService();
  final formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0.0,
            title: Text('Weather App Sign In',
                style: TextStyle(color: Colors.black))),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                        decoration:
                            new InputDecoration(hintText: "Enter Email"),
                        validator: (val) =>
                            val!.isEmpty ? 'This field is blank' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          new InputDecoration(hintText: "Enter password"),
                      obscureText: true,
                      validator: (val) =>
                          val!.isEmpty ? 'This field is blank' : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () async {
                          if (formKey.currentState!.validate())
                            print("Email: " + email);
                          print("Password: " + password);
                          dynamic result =
                              await auth.signInWithEmail(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Oops that didn' 't work';
                            });
                          }
                        },
                        child: Text('Sign In')),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text('Click here to go to the Sign Up page')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          auth.anonymousSignIn();
                        },
                        child: Text('Click here to sign in Anonomously'))
                  ],
                ))));
  }
}
