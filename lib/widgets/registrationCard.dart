import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/widgets/gradientButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/UserManagement.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/DataModel/User.dart';


String userName;

class EmailRegsForm extends StatefulWidget {
  @override
  _EmailRegsFormState createState() => _EmailRegsFormState();
}

class _EmailRegsFormState extends State<EmailRegsForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submit(){
    print('email: ${_emailController.text}\nusername: ${_usernameController.text}\npassword: ${_passwordController.text}');
    // accessing TextController using given format
    //enter firebase function here
    print('email: ${_emailController.text}\nusername: ${_usernameController.text}\npassword: ${_passwordController.text}');
    // accessing TextController using given format
    //enter firebase function here

    String email = _emailController.text;
    String userName = _usernameController.text;
    String password = _passwordController.text;
    int questionsAnswered = 0;
    //String email = "hello@gmail.com";
    //String userName = "dhruvMittal";
    //String password = "123456779";

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((signedInUser) {
      UserManagement().storeNewUser(signedInUser.user, context, userName, questionsAnswered);

      //TODO: TOAST data has been added

      Navigator.of(context).pushReplacementNamed('/homePage');
      User.emailId  = email;
    }).catchError((e){
      //showDialog(context: context);
      //TODO: Make a pop up which tells the user what is wrong
     /* Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0
      );*/
      print(e);
    });
  }

  List<Widget> _buildChildren(){
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'E-mail',
          hintText: 'Enter your Email',
        ),
      ),
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Enter desired Username',
        ),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter desired Password',
        ),
        obscureText: true,
      ),
      SizedBox(height: 20.0,),
      RaisedGradientButton(
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        gradient: LinearGradient(
          colors: <Color>[Colors.green[800], Colors.blue[400]],
        ),
        onPressed: _submit,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
