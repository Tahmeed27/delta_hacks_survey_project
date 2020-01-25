
class User{
  String _userName;
  String _password;
  String _emailId;
  int _treeProgress;


  //TODO: Add constructor


  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  String get password => _password;

  String get emailId => _emailId;

  set emailId(String value) {
    _emailId = value;
  }

  set password(String value) {
    _password = value;
  }

  int get treeProgress => _treeProgress;

  set treeProgress(int progress){
    _treeProgress = progress;
  }


  //Use this function to increment a user's progress. To be edited
  incrementTreeProgress(){
    _treeProgress ++;
  }

}
