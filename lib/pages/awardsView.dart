import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: AwardsView(),
));

class AwardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Images/bg1.jpg"), fit: BoxFit.scaleDown)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.green[700],
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
                    icon: Icon(Icons.account_circle),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: IconButton(
                    icon: Icon(Icons.assessment),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Text(
                    "Your Plant!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      letterSpacing: 2.0,
                      color: Colors.brown,

                    ),
                  ),
                ),
              ),
            ],
          )

      ),
    );

  }
}
