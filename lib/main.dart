import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
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
                onPressed: (){},
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                icon: Icon(Icons.assessment),
                color: Colors.grey[400],
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Text(
                    'FOOD',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Text(
                    'SOCIAL',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Text(
                    'SCHOOL',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Text(
                    'SPORTS',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 50.0,
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(7.0))
              ),
              child: Column(
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
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.redAccent,
                        ),
                        child: Text(
                          'Very Good',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.amberAccent[700],
                        ),
                        child: Text(
                          'Not Good or Bad',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          'Very Bad',
                          style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 1.0,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
    );

  }
}

