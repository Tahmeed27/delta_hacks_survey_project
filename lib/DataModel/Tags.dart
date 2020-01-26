
class Tag{
  String _tag;
  bool filterTap = false;
  Tag(this._tag);

  String get tag => _tag;

  set tag(String value) {
    _tag = value;
  }

}