import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradientButton.dart';

class AddQuestionForm extends StatefulWidget {
  @override
  _EmailRegsFormState createState() => _EmailRegsFormState();
}

class _EmailRegsFormState extends State<AddQuestionForm> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _choiceoneController = TextEditingController();
  final TextEditingController _choicetwoController = TextEditingController();
  final TextEditingController _choicethreeController = TextEditingController();

  void _submit() {
    print(
        'Question: ${_questionController.text}\nChoice 1: ${_choiceoneController.text}\nChoice 2: ${_choicetwoController.text}\nChoice 3: ${_choicethreeController}');
    // accessing TextController using given format
    //enter firebase function here
  }

  List<Widget> _buildChildren() {
    return [
      TextField(
        controller: _questionController,
        decoration: InputDecoration(
          labelText: 'QUESTION',
          hintText: 'Enter QUESTION',
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Dropdown(),
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
      padding: const EdgeInsets.all(16.0),
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
      hint: Text("Please choose category"),
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.green),
      underline: Container(
        height: 2,
        color: Colors.greenAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
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
