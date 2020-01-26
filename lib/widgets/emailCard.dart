import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradientButton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailSignInForm extends StatefulWidget {
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit(){
    print('email: ${ _emailController.text} password: ${_passwordController.text}'); //this gives entered values
    // code your firebase funtion here

    String email = _emailController.text;
    String password = _passwordController.text;
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      Navigator.of(context).pushReplacementNamed('/homePage');
      print("User Logged in");
    }).catchError((e) {
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
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your Password',
        ),
        obscureText: true,
      ),
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
      FlatButton(
        child: Text('Need an account? Register'),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/registrationPage');
        },
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
