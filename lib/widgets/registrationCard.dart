import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradientButton.dart';

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
