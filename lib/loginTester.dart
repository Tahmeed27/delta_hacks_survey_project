import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/UserManagement.dart';

class LogInTester extends StatefulWidget{
  @override
  _LogInTesterState createState() => _LogInTesterState();
}

class _LogInTesterState extends State<LogInTester>{

  String _email;
  String _password;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: RaisedButton(
          onPressed: (){
            FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
                .then((user) {
                  Navigator.of(context).pushReplacementNamed('/homePage');
            }).catchError((e) {
                  print(e);
            });
          },
          child: Text('Log In'),
        ),
      ),

    );
  }

}