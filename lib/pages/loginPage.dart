import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/socialSignInButton.dart';
import 'package:flutter_app/widgets/emailCard.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SURVEY TREE'),
          elevation: 4.0,
        ),
        body: _buildContent(),
        backgroundColor: Colors.green[50]//Colors.grey[200],
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
            SizedBox(height: 10.0,),
            Text(
              'Sign-In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ), //replace with image
            SizedBox(height: 100.0,),
            EmailSignInForm(),
            SizedBox(height: 20.0,),
            Text(
              'OR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.0,),
            SocialSignInButton(
              assetName: 'Images/google-logo.png',
              text: 'Sign in with Google',
              textColor: Colors.black,
              color: Colors.white,
              onPressed: () {},
            ),
            SizedBox(height: 15.0,),
            SocialSignInButton(
              assetName: 'Images/facebook-logo.png',
              text: 'Sign in with Facebook',
              textColor: Colors.white,
              color: Color(0xFF334D92),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}