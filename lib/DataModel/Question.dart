class Question{

  String _title;
  String _userName;
  List _option1 = new List(2);
  List _option2 = new List(2);
  List _option3 = new List(2);

  //A dynamic list that will contain all the relevant tags for the question
  List _tags;


  //TODO: Add constructor

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  List get option1 => _option1;

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  List get option3 => _option3;

  set option3(List value) {
    _option3 = value;
  }

  List get option2 => _option2;

  set option2(List value) {
    _option2 = value;
  }

  set option1(List value) {
    _option1 = value;
  }

  List get tags => _tags;

  set tags(List value) {
    _tags = value;
  }


}