class ReviewModel {
  int? _status;
  String? _message;
  List<Data>? _data;

  ReviewModel({int? status, String? message, List<Data>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  ReviewModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _sId;
  String? _senderName;
  int? _rating;
  String? _comments;
  String? _createdAt;
  String? _updatedAt;
  int? _averageRating;

  Data(
      {String? sId,
        String? senderName,
        int? rating,
        String? comments,
        String? createdAt,
        String? updatedAt,
        int? averageRating}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (senderName != null) {
      this._senderName = senderName;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (comments != null) {
      this._comments = comments;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (averageRating != null) {
      this._averageRating = averageRating;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get senderName => _senderName;
  set senderName(String? senderName) => _senderName = senderName;
  int? get rating => _rating;
  set rating(int? rating) => _rating = rating;
  String? get comments => _comments;
  set comments(String? comments) => _comments = comments;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get averageRating => _averageRating;
  set averageRating(int? averageRating) => _averageRating = averageRating;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _senderName = json['senderName'];
    _rating = json['rating'];
    _comments = json['comments'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['senderName'] = this._senderName;
    data['rating'] = this._rating;
    data['comments'] = this._comments;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['averageRating'] = this._averageRating;
    return data;
  }
}
