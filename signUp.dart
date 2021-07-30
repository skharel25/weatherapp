import 'package:flutter/material.dart';
import 'package:messageboard/ExServices/auth.dart';
import 'package:messageboard/Pages/authentication/signIn.dart';

class SignUp extends StatefulWidget {
  //const SignUp({Key? key}) : super(key: key);

  final Function toggleView;
  SignUp({required this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthenticationService auth = AuthenticationService();
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0.0,
            title: Text('Sign Up for the Weather App',
                style: TextStyle(color: Colors.black))),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                        decoration: new InputDecoration(hintText: "Name"),
                        validator: (val) =>
                            val!.isEmpty ? 'This field is blank' : null,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        }),
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
                      obscureText: true,
                      decoration: new InputDecoration(
                          hintText: "Create a new password"),
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
                              await auth.registerWithEmail(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Oops that didn' 't work';
                            });
                          }
                        },
                        child: Text('Register/Sign Up')),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text('Click here to go to the Sign In page'))
                  ],
                ))));
  }
}
