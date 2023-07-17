class CardDetailModel {
  int? _status;
  String? _message;
  List<Data>? _data;

  CardDetailModel({int? status, String? message, List<Data>? data}) {
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

  CardDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? _bankName;
  String? _userId;
  String? _accountHolderName;
  String? _cardNo;
  String? _expiryDate;
  String? _cvv;
  int? _iV;

  Data(
      {String? sId,
        String? bankName,
        String? userId,
        String? accountHolderName,
        String? cardNo,
        String? expiryDate,
        String? cvv,
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (bankName != null) {
      this._bankName = bankName;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (accountHolderName != null) {
      this._accountHolderName = accountHolderName;
    }
    if (cardNo != null) {
      this._cardNo = cardNo;
    }
    if (expiryDate != null) {
      this._expiryDate = expiryDate;
    }
    if (cvv != null) {
      this._cvv = cvv;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get bankName => _bankName;
  set bankName(String? bankName) => _bankName = bankName;
  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get accountHolderName => _accountHolderName;
  set accountHolderName(String? accountHolderName) =>
      _accountHolderName = accountHolderName;
  String? get cardNo => _cardNo;
  set cardNo(String? cardNo) => _cardNo = cardNo;
  String? get expiryDate => _expiryDate;
  set expiryDate(String? expiryDate) => _expiryDate = expiryDate;
  String? get cvv => _cvv;
  set cvv(String? cvv) => _cvv = cvv;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _bankName = json['bankName'];
    _userId = json['userId'];
    _accountHolderName = json['accountHolderName'];
    _cardNo = json['cardNo'];
    _expiryDate = json['expiryDate'];
    _cvv = json['cvv'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['bankName'] = this._bankName;
    data['userId'] = this._userId;
    data['accountHolderName'] = this._accountHolderName;
    data['cardNo'] = this._cardNo;
    data['expiryDate'] = this._expiryDate;
    data['cvv'] = this._cvv;
    data['__v'] = this._iV;
    return data;
  }
}
