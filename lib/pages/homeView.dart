import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/DataModel/Question.dart';
import 'package:flutter_app/DataModel/Tags.dart';
import 'package:flutter_app/DataModel/User.dart';


// Global Variables:
Future<List> taggedQuestions;


Tag sports = Tag("sports");
//Tag school = Tag("School");
Tag food = Tag("food");
//Tag facebook = Tag("Facebook");
//Tag google = Tag("Google");

List selectedTags = [sports, food];


void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


List<Question> qList = [];

class _HomeState extends State<Home> {


  GestureDetector filterTemplate(Tag tag) {

    return GestureDetector(
      onTap: () {
        setState(() {
          Tag myTag = new Tag(tag.tag);
          selectedTags.add(myTag);
          taggedQuestions = getTaggedQuestions(selectedTags);
          tag.filterTap = !tag.filterTap;
        });
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: tag.filterTap ? Colors.grey : Colors.transparent,
          ),
          child: Text(
            tag.tag,
            style: TextStyle(
              color: tag.filterTap ? Colors.grey[900] : Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    //QuerySnapshot querySnapshot = Firestore.instance.collection("collection").getDocuments() as QuerySnapshot;

    /*QuerySnapshot querySnapshot = StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("questions").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

        }
    ) as QuerySnapshot;

    var list = querySnapshot.documents;

    for(int i = 0; i< list.length; i++){
      Question newQuestion = new Question(list[i]['title'], list[i]['UserID'],
          list[i]['option1'], list[i]['option2'], list[i]['option3'], list[i]['tag']);
      qList.add(newQuestion);
    }*/

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
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("questions").snapshots(),

        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text("Loading...");

          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
            //return new Text(snapshot.data.documents.length.toString());

              int numberOfDocuments = snapshot.data.documents.length;
              for(int i = 0; i < numberOfDocuments; i++){
                String userName = snapshot.data.documents[i]['userName'];
                String option1Title = snapshot.data.documents[i]['option1Title'];
                int option1Counter = snapshot.data.documents[i]['option1Counter'];
                String option2Title = snapshot.data.documents[i]['option2Title'];
                int option2Counter = snapshot.data.documents[i]['option2Counter'];
                String option3Title = snapshot.data.documents[i]['option3Title'];
                int option3Counter = snapshot.data.documents[i]['option3Counter'];
                String tags = snapshot.data.documents[i]['tags'];
                String title = snapshot.data.documents[i]['title'];

                Question tempQuestion = new Question(title, userName, option1Title,
                    option1Counter, option2Title, option2Counter, option3Title, option3Counter, tags);

                qList.add(tempQuestion);

                /*
                print(title);
                print(userName);
                print(option1Title);
                print(option1Counter);
                print(option2Title);
                print(option2Counter);
                print(option3Title);
                print(option3Counter);
                print(tags);
                */

              }
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    height: 50.0,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: selectedTags.map((item) {
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
                        itemBuilder: (BuildContext context, int index) =>
                            buildCard(context, index)),
                  ),
                ],
              );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
    );
  }

  Widget buildCard(BuildContext context, int index) {
    final question = qList[index];
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 8.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 12.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    question.choiceTap = !question.choiceTap;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  width: 100.0,
                  height: question.choiceTap ? 100.0 : 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.redAccent,
                  ),
                  child: Center(
                    child: Text(
                      question.option1Title,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    question.choiceTap = !question.choiceTap;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  width: 100.0,
                  height: question.choiceTap ? 120.0 : 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amberAccent[700],
                  ),
                  child: Center(
                    child: Text(
                      question.option2Title,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    question.choiceTap = !question.choiceTap;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 10.0),
                  width: 100.0,
                  height: question.choiceTap ? 30 : 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                    child: Text(
                      question.option3Title,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
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

  Future<List> getTaggedQuestions(List list_of_tags) async {

    QuerySnapshot querySnapshot = await Firestore.instance.collection("questions").getDocuments();
    List questions = querySnapshot.documents;

    int len_question = questions.length;
    int len_tag = list_of_tags.length;
    List output;
    for(int i = 0; i < len_question; i++){
      List tagArray = questions[i]['tag'];
      int len = tagArray.length;
      bool intersect = false;
      for(int j = 0; j < len; j++){
        for(int k = 0; k < len_tag; k++){
          if(questions[i]['tag'][j] == list_of_tags[k].tag){
            intersect = true;
            continue;
          }
        }
        if(intersect == true){
          continue;
        }
      }
      if(intersect == true){
        output.add(questions[i]);
      }
    }
    return output;
  }
}