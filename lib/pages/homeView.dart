import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/DataModel/Question.dart';
import 'package:flutter_app/DataModel/Tags.dart';
import 'package:flutter_app/DataModel/User.dart';
import 'package:flutter_app/services/CRUDMethods.dart';


// Global Variables:
Future<List> taggedQuestions;


Tag sports = Tag("sports");
//Tag school = Tag("School");
Tag food = Tag("food");
//Tag facebook = Tag("Facebook");
//Tag google = Tag("Google");

List selectedTags = [sports, food];
List<Question> qList = [];


void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}




QuerySnapshot userDoc;
QuerySnapshot questionDoc;

class _HomeState extends State<Home> {

  //Class variables:
  CrudMethods crudObj = new CrudMethods();
  String userDocID;
  String questionDocID;

  GestureDetector filterTemplate(Tag tag) {

    return GestureDetector(
      onTap: () {
        setState(() {
          Tag myTag = new Tag(tag.tag);
          selectedTags.add(myTag);
          //taggedQuestions = getTaggedQuestions(selectedTags);
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
  Widget buildCard(BuildContext context, int index) {
    final question = qList[index];
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 8.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.brown),
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          color: Color.fromRGBO(234, 240, 230, 0.7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
            child: Text(
              question.title,
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.brown,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 12.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      question.choiceTap = true;

                    });
                    incrementQuestionsAnswered();
                    incrementOption1Counter(question.title);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 60.0, horizontal: 10.0),
                    width: 100.0,
                    height: question.choiceTap ? 100.0 : 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
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

                      question.choiceTap = true;

                    });
                    incrementQuestionsAnswered();
                    incrementOption2Counter(question.title);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 60.0, horizontal: 10.0),
                    width: 100.0,
                    height: question.choiceTap ? 120.0 : 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                      question.choiceTap = true;

                    });
                    incrementQuestionsAnswered();
                    incrementOption3Counter(question.title);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    margin: const EdgeInsets.fromLTRB(8.0, 15.0, 3.0, 0.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 60.0, horizontal: 10.0),
                    width: 100.0,
                    height: question.choiceTap ? 30 : 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 224, 162, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Row(
          children: <Widget>[
            MyStreamWidget(),
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
                onPressed: () {

                },
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                icon: Icon(Icons.assessment),
                color: Colors.grey[400],
                onPressed: () {
                  Navigator.of(context).pushNamed('/awardsViewPage');
                },
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
                children: selectedTags.map((item) {
                  return filterTemplate(item);
                }).toList()),
          ),
          Divider(
            height: 15.0,
            color: Colors.brown,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: qList.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildCard(context, index)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/newQuestionPage');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
    );
  }


  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        userDoc = results;
      });
    });

    crudObj.getQuestions().then((results) {
      setState(() {
        questionDoc = results;
      });
    });
    super.initState();
  }

  void incrementQuestionsAnswered() {

    crudObj.getData().then((results) {
      setState(() {
        userDoc = results;
      });
    });

    for(int i =0; i < userDoc.documents.length; i++){
      if(userDoc.documents[i]['email'] == User.emailId){
        print(userDoc.documents[i]['email']);
        userDocID = userDoc.documents[i].documentID;
        //print(docID);
        //print(doc.documents[i]['questionsAnswered']+1);
        crudObj.updateQuestionsAnswered(userDocID, {'questionsAnswered': userDoc.documents[i]['questionsAnswered']+1 });
        break;
      }
    }
  }


  void incrementOption1Counter(String questionTitle) {

    crudObj.getQuestions().then((results) {
      setState(() {
        questionDoc = results;
      });
    });

    for (DocumentSnapshot doc in questionDoc.documents) {
      if(doc['title'] == questionTitle){
        questionDocID = doc.documentID;
        crudObj.updateOption3Counter(questionDocID, {'option1Counter': doc['option1Counter'] +1});
        break;
      }

    }
  }

  void incrementOption2Counter(String questionTitle) {

    crudObj.getQuestions().then((results) {
      setState(() {
        questionDoc = results;
      });
    });

    for (DocumentSnapshot doc in questionDoc.documents) {
      if(doc['title'] == questionTitle){
        questionDocID = doc.documentID;
        crudObj.updateOption3Counter(questionDocID, {'option2Counter': doc['option2Counter'] +1});
        break;
      }

    }
  }

  void incrementOption3Counter(String questionTitle) {

    crudObj.getQuestions().then((results) {
      setState(() {
        questionDoc = results;
      });
    });

    for (DocumentSnapshot doc in questionDoc.documents) {
      if(doc['title'] == questionTitle){
        questionDocID = doc.documentID;
        crudObj.updateOption3Counter(questionDocID, {'option3Counter': doc['option3Counter'] +1});
        break;
      }

    }
  }
}

class MyStreamWidget extends StatefulWidget {
  @override
  _MyStreamWidgetState createState() => _MyStreamWidgetState();
}

class _MyStreamWidgetState extends State<MyStreamWidget> {
  StreamBuilder _widget;
  @override
  void initState() {
    super.initState();
    _widget = StreamBuilder<QuerySnapshot>(
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
              }
              return Text("");
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}