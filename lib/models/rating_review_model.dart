class RatingReviewModel {
  String profileUrl;
  String name;
  int rating;
  String time;
  String content;

  RatingReviewModel(
      {required this.profileUrl,
        required this.name,
        required this.rating,
        required this.time,
        required this.content});
}
/*
class RatingReviewModel {
  String? _profileUrl;
  String? _name;
  int? _rating;
  String? _time;
  String? _content;

  RatingReviewModel(
      {String? profileUrl,
        String? name,
        int? rating,
        String? time,
        String? content}) {
    if (profileUrl != null) {
      this._profileUrl = profileUrl;
    }
    if (name != null) {
      this._name = name;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (time != null) {
      this._time = time;
    }
    if (content != null) {
      this._content = content;
    }
  }

  String? get profileUrl => _profileUrl;
  set profileUrl(String? profileUrl) => _profileUrl = profileUrl;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get rating => _rating;
  set rating(int? rating) => _rating = rating;
  String? get time => _time;
  set time(String? time) => _time = time;
  String? get content => _content;
  set content(String? content) => _content = content;

  RatingReviewModel.fromJson(Map<String, dynamic> json) {
    _profileUrl = json['profileUrl'];
    _name = json['name'];
    _rating = json['rating'];
    _time = json['time'];
    _content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileUrl'] = this._profileUrl;
    data['name'] = this._name;
    data['rating'] = this._rating;
    data['time'] = this._time;
    data['content'] = this._content;
    return data;
  }
}
*/
