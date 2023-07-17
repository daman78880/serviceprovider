class BankDetailApiModel {
  int? _status;
  String? _message;
  List<Data>? _data;

  BankDetailApiModel({int? status, String? message, List<Data>? data}) {
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

  BankDetailApiModel.fromJson(Map<String, dynamic> json) {
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
  String? _status;
  String? _sId;
  String? _userId;
  String? _bankName;
  String? _accountNo;
  String? _ifscCode;
  String? _userType;
  int? _iV;

  Data(
      {String? status,
        String? sId,
        String? userId,
        String? bankName,
        String? accountNo,
        String? ifscCode,
        String? userType,
        int? iV}) {
    if (status != null) {
      this._status = status;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (bankName != null) {
      this._bankName = bankName;
    }
    if (accountNo != null) {
      this._accountNo = accountNo;
    }
    if (ifscCode != null) {
      this._ifscCode = ifscCode;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get bankName => _bankName;
  set bankName(String? bankName) => _bankName = bankName;
  String? get accountNo => _accountNo;
  set accountNo(String? accountNo) => _accountNo = accountNo;
  String? get ifscCode => _ifscCode;
  set ifscCode(String? ifscCode) => _ifscCode = ifscCode;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _sId = json['_id'];
    _userId = json['userId'];
    _bankName = json['bankName'];
    _accountNo = json['accountNo'];
    _ifscCode = json['ifscCode'];
    _userType = json['userType'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['_id'] = this._sId;
    data['userId'] = this._userId;
    data['bankName'] = this._bankName;
    data['accountNo'] = this._accountNo;
    data['ifscCode'] = this._ifscCode;
    data['userType'] = this._userType;
    data['__v'] = this._iV;
    return data;
  }
}
