class CreateCategoryModel {
  int? _status;
  String? _message;
  Data? _data;

  CreateCategoryModel({int? status, String? message, Data? data}) {
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
  Data? get data => _data;
  set data(Data? data) => _data = data;

  CreateCategoryModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _categoriesName;
  String? _userType;
  String? _sId;
  int? _iV;

  Data({String? categoriesName, String? userType, String? sId, int? iV}) {
    if (categoriesName != null) {
      this._categoriesName = categoriesName;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get categoriesName => _categoriesName;
  set categoriesName(String? categoriesName) =>
      _categoriesName = categoriesName;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _categoriesName = json['categoriesName'];
    _userType = json['userType'];
    _sId = json['_id'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriesName'] = this._categoriesName;
    data['userType'] = this._userType;
    data['_id'] = this._sId;
    data['__v'] = this._iV;
    return data;
  }
}
