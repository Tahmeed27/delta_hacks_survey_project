import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class StructFilter {
  final String tag;
  bool filterTap = false;
  StructFilter(this.tag);
}

StructFilter sports = StructFilter("Sports");
StructFilter school = StructFilter("School");
StructFilter food = StructFilter("Food");
StructFilter facebook = StructFilter("Facebook");
StructFilter google = StructFilter("Google");

List<StructFilter> filterList = [sports, school, food, facebook, google];

class StructQuestion {
  final String title;
  final String choiceA;
  final String choiceB;
  final String choiceC;

  StructQuestion(
      this.title,
      this.choiceA,
      this.choiceB,
      this.choiceC,
      );
}

StructQuestion q1 = StructQuestion("How did you like the food at the cafeteria", "Very good", "Okay", "Very Bad");
StructQuestion q2 = StructQuestion("How is this app?", "Amazing", "Nice", "Great");
StructQuestion q3 = StructQuestion("What are you doing tonight?", "Coding", "Sleeping", "Partying");

List<StructQuestion> qList = [q1, q2, q3];



class _HomeState extends State<Home> {
  GestureDetector filterTemplate(StructFilter structFilter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          structFilter.filterTap = !structFilter.filterTap;
        });
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: structFilter.filterTap ? Colors.grey : Colors.transparent,
          ),
          child: Text(
            structFilter.tag,
            style: TextStyle(
              color: structFilter.filterTap ? Colors.grey[900] : Colors.grey,
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
                children: filterList.map((item) {
                  return filterTemplate(item);
                }).toList()),
          ),
          Divider(
            height: 15.0,
            color: Colors.grey,
          ),

          Expanded(
            child: ListView.builder(
                itemCount: qList.length,
                itemBuilder: (BuildContext context, int index) => buildCard(context, index)

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

  Widget buildCard(BuildContext context, int index){
    final question = qList[index];
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 8.0),
      padding: const EdgeInsets.symmetric(
          vertical: 5.0, horizontal: 10.0),
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
            question.title,
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
                margin: const EdgeInsets.fromLTRB(
                    8.0, 15.0, 3.0, 0.0),
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
                    question.choiceA,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    8.0, 15.0, 3.0, 0.0),
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
                    question.choiceB,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(
                    8.0, 15.0, 3.0, 0.0),
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
                    question.choiceC,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
