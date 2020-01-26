import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/homeView.dart';
import 'package:flutter_app/pages/loginPage.dart';
import 'package:flutter_app/pages/newQuestion.dart';
import 'package:flutter_app/pages/registrationPage.dart';
import 'package:flutter_app/pages/awardsView.dart';


class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings){
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => Home());
      case '/newQuestionPage':
        return MaterialPageRoute(builder: (_) => AddQuestion());
      case '/registrationPage':
        return MaterialPageRoute(builder: (_) => RegsPage());
      case '/awardsViewPage':
        return MaterialPageRoute(builder: (_) => AwardsView());
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