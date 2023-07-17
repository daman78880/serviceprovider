  class LoginModel {
  int? _status;
  String? _message;


  LoginModel({int? status, String? message}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;


  LoginModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    return data;
  }
}

