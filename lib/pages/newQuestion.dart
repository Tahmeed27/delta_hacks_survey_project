
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homeView.dart';
import 'package:flutter_app/widgets/socialSignInButton.dart';
import 'package:flutter_app/widgets/emailCard.dart';
import 'package:flutter_app/widgets/potAsset.dart';
/*
//class NewQuestionPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('ADD A QUESTION'),
//          centerTitle: true,
//          backgroundColor: Colors.green[700],
//          elevation: 10.0,
//        ),
//        body: MyInfo(),
//        backgroundColor: Colors.white//Colors.grey[200],
//    );
//  }

void main() => runApp(MaterialApp(
  home: MyInfo(),
  )
);

class MyInfo extends StatefulWidget {
  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  String title;
  String option1Title;
  String option2Title;
  String option3Title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD A QUESTION"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 10.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(hintText: "Enter the title"),
              onChanged: (value){
                this.title = value;
              },
            ),
          ),
          SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Enter option 1"),
              onChanged: (value){
                this.option1Title = value;
              },
            ),
          ),
          SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Enter option 2"),
              onChanged: (value){
                this.option2Title = value;
              },
            ),
          ),
          SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Enter option 3"),
              onChanged: (value){
                this.option3Title = value;
              },
            ),
          ),
          RaisedButton(
            child: Text("Submit"),
            onPressed: (){

            },
          )
        ],
      ),
    );
  }
}

*/