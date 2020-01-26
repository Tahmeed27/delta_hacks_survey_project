class Question{

  String title;
  String userName;
  String option1Title;
  String option2Title;
  String option3Title;

  int option1Counter;
  int option2Counter;
  int option3Counter;

  //A dynamic list that will contain all the relevant tags for the question
  String tags;

  bool choiceTap = false;


  Question(this.title, this.userName, this.option1Title, this.option1Counter,
      this.option2Title, this.option2Counter, this.option3Title, this.option3Counter,
      this.tags);

 /* Question(this._title, this._userName, this._option1, this._option2,
      this._option3, this._tags);


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
  }*/


}