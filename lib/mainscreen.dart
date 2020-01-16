import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color filterColor = Colors.transparent;
  Color bgColor = Colors.grey;

  GestureDetector myTags(String tag) {
    return GestureDetector(
      onTap: (){
        setState(() {
          bgColor = Colors.grey[900];
          filterColor = Colors.grey;
        });
      },

      child: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: filterColor,
          ),
          child: Text(
            tag,
            style: TextStyle(
              color: bgColor,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                'Survey App',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                icon: Icon(Icons.account_circle),
                color: Colors.grey[400],
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                icon: Icon(Icons.assessment),
                color: Colors.grey[400],
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                myTags('Food'),
                myTags('School'),
                myTags('Sports'),
                myTags('Facebook'),
                myTags('Google'),
                myTags('Netflix'),
                myTags('Amazon'),
              ],
            ),
          ),
          Divider(
            height: 15.0,
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
            padding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(7.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'QUESTION',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Text(
                  'How did you like the food at the cafeteria today?',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 60.0, horizontal: 10.0),
                      width: 100.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.redAccent,
                      ),
                      child: Center(
                        child: Text(
                          'Very Good',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 60.0, horizontal: 10.0),
                      width: 100.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.amberAccent[700],
                      ),
                      child: Center(
                        child: Text(
                          'Not Good or Bad',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 60.0, horizontal: 10.0),
                      width: 100.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blueAccent,
                      ),
                      child: Center(
                        child: Text(
                          'Very Bad',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
