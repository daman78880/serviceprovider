class CreateBankDetailModel {
  int? _status;
  String? _message;
  Data? _data;

  CreateBankDetailModel({int? status, String? message, Data? data}) {
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

  CreateBankDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? _userId;
  String? _bankName;
  String? _accountNo;
  String? _ifscCode;
  String? _userType;
  String? _sId;
  int? _iV;

  Data(
      {String? userId,
        String? bankName,
        String? accountNo,
        String? ifscCode,
        String? userType,
        String? sId,
        int? iV}) {
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
    if (sId != null) {
      this._sId = sId;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

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
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _bankName = json['bankName'];
    _accountNo = json['accountNo'];
    _ifscCode = json['ifscCode'];
    _userType = json['userType'];
    _sId = json['_id'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['bankName'] = this._bankName;
    data['accountNo'] = this._accountNo;
    data['ifscCode'] = this._ifscCode;
    data['userType'] = this._userType;
    data['_id'] = this._sId;
    data['__v'] = this._iV;
    return data;
  }
}
