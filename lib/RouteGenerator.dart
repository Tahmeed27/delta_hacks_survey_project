import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/homeView.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      /*case'/second':
        if(args is String ){
          return MaterialPageRoute(
            builder: (_) => Secondage(
              data: args,

            )
          )


        return _errorRoute();*/
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("ERROR, PAGE ROUTING NOT FOUND"),
        ),
      );
    });
  }

}