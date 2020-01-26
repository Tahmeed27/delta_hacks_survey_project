import 'package:flutter/material.dart';

getCustomAppBar(){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue[700],
            Colors.green[600],
            Colors.green[700],
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: (){}),
          Text('SURVEYTREE', style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.w600),),
          IconButton(icon: Icon(Icons.favorite), onPressed: (){}),
        ],),
    ),
  );
}