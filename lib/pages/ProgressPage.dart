import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: ProgressPage(title: 'Flutter Demo Home Page'),
    );
  }
}


class ProgressPage extends StatefulWidget {
  ProgressPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      addData();

    });
  }

  @override
  Widget build(BuildContext context) {
// This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  'SurveyTree',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.grey[400],
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 0,
                child: IconButton(
                  icon: Icon(Icons.exit_to_app),
                  color: Colors.grey[400],
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        body: new Container(
          child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                  "Progress Page",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30))
          )
        )

          //child: ListView.builder(
          //itemExtent: 80.0,
          //itemCount: _bandList.length,
          //)

        );

  }

  void addData() {

  }
}