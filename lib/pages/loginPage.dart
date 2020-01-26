import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/socialSignInButton.dart';
import 'package:flutter_app/widgets/emailCard.dart';
import 'package:flutter_app/widgets/potAsset.dart';
import 'package:flutter_app/widgets/customAppBar.dart';


void main() => runApp(MaterialApp(
  home: SignInPage(),
));


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getCustomAppBar(),
        body: _buildContent(),
        backgroundColor: Colors.white//Colors.grey[200],
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
            PotAsset(),
            SizedBox(height: 10.0,),
            EmailSignInForm(),
            SizedBox(height: 0.0,),
            Text(
              'OR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20.0,),
            SocialSignInButton(
              assetName: 'Images/google-logo.png',
              text: 'Sign in with Google',
              textColor: Colors.black,
              color: Colors.grey[100],
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