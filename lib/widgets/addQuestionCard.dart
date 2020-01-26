import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradientButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/services/CRUDMethods.dart';

//Global Variables:
String holder;

class AddQuestionForm extends StatefulWidget {
  @override
  _EmailRegsFormState createState() => _EmailRegsFormState();
}

class _EmailRegsFormState extends State<AddQuestionForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _choiceoneController = TextEditingController();
  final TextEditingController _choicetwoController = TextEditingController();
  final TextEditingController _choicethreeController = TextEditingController();

   //TODO: Change this from hardcoded to dynamic

  CrudMethods crudObj = new CrudMethods();

  void _submit() {
    print(
        'Question: ${_questionController.text}\nChoice 1: ${_choiceoneController.text}\nChoice 2: ${_choicetwoController.text}\nChoice 3: ${_choicethreeController}');
    // accessing TextController using given format
    //enter firebase function here
    String userName = _usernameController.text;
    String questionTitle = _questionController.text;
    String choiceOne = _choiceoneController.text;
    String choiceTwo = _choicetwoController.text;
    String choiceThree = _choicethreeController.text;
    String tag = holder;

    crudObj.addData({
      'title': questionTitle,
      'option1Title': choiceOne,
      'option2Title': choiceTwo,
      'option3Title': choiceThree,
      'option1Counter': 0,
      'option2Counter': 0,
      'option3Counter': 0,
      'tags': tag,
      'userName': userName //TODO: Change this to match userName
    });

  }

  List<Widget> _buildChildren() {
    return [
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(
          labelText: 'USERNAME',
          hintText: 'Enter Your Username',
        ),
      ),
      SizedBox(height: 20.0,),
      TextField(
        controller: _questionController,
        decoration: InputDecoration(
          labelText: 'QUESTION',
          hintText: 'Enter Question',
        ),
      ),
      SizedBox(height: 50.0,),
      Dropdown(),
      SizedBox(height: 30.0,),
      TextField(
        controller: _choiceoneController,
        decoration: InputDecoration(
          labelText: 'Choice 1',
          hintText: 'Enter Option One',
        ),
      ),
      TextField(
        controller: _choicetwoController,
        decoration: InputDecoration(
          labelText: 'Choice 2',
          hintText: 'Enter Option Two',
        ),
      ),
      TextField(
        controller: _choicethreeController,
        decoration: InputDecoration(
          labelText: 'Choice 3',
          hintText: 'Enter Option Three',
        ),
      ),
      SizedBox(
        height: 100.0,
      ),
      RaisedGradientButton(
        child: Text(
          'Submit Question',
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
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  Dropdown({Key key}) : super(key: key);
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> _filters = ["Sports", "Facebook", "Google", "Food", "Education"];
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Padding(
        padding: const EdgeInsets.fromLTRB(115.0, 0.0, 20.0, 0.0),
        child: Text("Please choose category"),
      ),
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.green[700]),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),

      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          getDropdown(newValue);
        });
      },
      items: _filters.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

void getDropdown(String newVal){
  holder = newVal;
}
