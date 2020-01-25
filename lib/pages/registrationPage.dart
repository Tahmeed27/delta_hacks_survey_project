import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/socialSignInButton.dart';
import 'package:flutter_app/widgets/registrationCard.dart';
import 'package:flutter_app/widgets/potAsset.dart';

class RegsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SURVEY TREE'),
          centerTitle: true,
          backgroundColor: Colors.green[700],
          elevation: 10.0,
        ),
        body: _buildContent(),
        backgroundColor: Colors.white//Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PotAsset(),
            EmailRegsForm(),


          ],
        ),
      ),
    );
  }
}