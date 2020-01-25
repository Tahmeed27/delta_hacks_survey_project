import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradientButton.dart';

class EmailRegsForm extends StatelessWidget {
  List<Widget> _buildChildren(){
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'E-mail',
          hintText: 'Enter your Email',
        ),
      ),
      TextField(
        decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Enter desired Username',
        ),
      ),
      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter desired Password',
        ),
        obscureText: true,
      ),
      SizedBox(height: 20.0,),
      RaisedGradientButton(
          child: Text(
            'Complete Registration',
            style: TextStyle(color: Colors.white),
          ),
          gradient: LinearGradient(
            colors: <Color>[Colors.green[800], Colors.green[400]],
          ),
          onPressed: (){}
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
