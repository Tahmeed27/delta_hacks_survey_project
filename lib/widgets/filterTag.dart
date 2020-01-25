import 'package:flutter/material.dart';

class filterTemplate extends StatefulWidget {
  @override
  _filterTemplateState createState() => _filterTemplateState();
}

class _filterTemplateState extends State<filterTemplate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          filterTap = !filterTap;
        });
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: filterTap
                ? Colors.grey
                : Colors.transparent,
          ),
          child: Text(
            tag,
            style: TextStyle(
              color: filterTap
                  ? Colors.grey[900]
                  : Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}

