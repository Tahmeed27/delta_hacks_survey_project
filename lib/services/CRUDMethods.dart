import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudMethods{
  Future<void> addData(questionData) async{
    Firestore.instance.collection('questions').add(questionData).catchError((e){
      print(e);
    });
  }

}