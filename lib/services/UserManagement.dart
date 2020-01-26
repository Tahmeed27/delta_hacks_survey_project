import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement {
  storeNewUser(user, context, userName){
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
      'userName': userName
    }).then((value) {
      //Navigator.of(context).pop();
      //Navigator.of(context).pushReplacementNamed('/homepage');
      print("Data Added");
    }).catchError((e) {
      print(e);
    });
  }
}