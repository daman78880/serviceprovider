class GenerateOtpModel {
  int? _status;
  String? _message;
  String? _data;

  GenerateOtpModel({int? status, String? message, String? data}) {
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
  String? get data => _data;
  set data(String? data) => _data = data;

  GenerateOtpModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    data['data'] = this._data;
    return data;
  }
}
