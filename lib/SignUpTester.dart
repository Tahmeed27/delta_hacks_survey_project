import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/UserManagement.dart';

class SignUpTester extends StatefulWidget{
  @override
  _SignUpTesterState createState() => _SignUpTesterState();
}

class _SignUpTesterState extends State<SignUpTester>{

  String _email = "hello@yahoo.com";
  String _password = "password";


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: RaisedButton(
          onPressed: (){
            FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)
                .then((signedInUser) {

              UserManagement().storeNewUser(signedInUser, context);

            }).catchError((e){
              print(e);
            });
          },
          child: Text('Sign Up'),
        ),
      ),

    );
  }

}