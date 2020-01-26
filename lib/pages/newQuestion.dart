
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/addQuestionCard.dart';
import 'package:flutter_app/widgets/socialSignInButton.dart';
import 'package:flutter_app/widgets/emailCard.dart';
import 'package:flutter_app/widgets/potAsset.dart';
import 'package:flutter_app/widgets/customAppBar.dart';

void main() => runApp(MaterialApp(
  home: AddQuestion(),
));

class AddQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getCustomAppBarOther(),
        body: _buildContent(),
        backgroundColor: Colors.white,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 100.0,),
            AddQuestionForm(), // imp
            SizedBox(height: 0.0,),
          ],
        ),
      ),
    );
  }
}

getCustomAppBarOther(){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue[700],
            Colors.green[600],
            Colors.green[700],
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: (){}),
          Text('ADD QUESTIONS', style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.w600),),
          IconButton(icon: Icon(Icons.favorite), onPressed: (){}),
        ],),
    ),
  );
}