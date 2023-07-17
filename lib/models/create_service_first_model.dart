class CreateServiceFirstModel {
  int? _status;
  String? _message;
  Data? _data;

  CreateServiceFirstModel({int? status, String? message, Data? data}) {
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

  CreateServiceFirstModel.fromJson(Map<String, dynamic> json) {
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
  String? _subCategoriesId;
  String? _currency;
  String? _chargePerService;
  String? _areaRange;
  String? _description;
  String? _totalExperience;
  String? _userType;
  String? _status;
  String? _sId;

  Data(
      {String? userId,
        String? subCategoriesId,
        String? currency,
        String? chargePerService,
        String? areaRange,
        String? description,
        String? totalExperience,
        String? userType,
        String? status,
        String? sId}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (subCategoriesId != null) {
      this._subCategoriesId = subCategoriesId;
    }
    if (currency != null) {
      this._currency = currency;
    }
    if (chargePerService != null) {
      this._chargePerService = chargePerService;
    }
    if (areaRange != null) {
      this._areaRange = areaRange;
    }
    if (description != null) {
      this._description = description;
    }
    if (totalExperience != null) {
      this._totalExperience = totalExperience;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (status != null) {
      this._status = status;
    }
    if (sId != null) {
      this._sId = sId;
    }
  }

  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get subCategoriesId => _subCategoriesId;
  set subCategoriesId(String? subCategoriesId) =>
      _subCategoriesId = subCategoriesId;
  String? get currency => _currency;
  set currency(String? currency) => _currency = currency;
  String? get chargePerService => _chargePerService;
  set chargePerService(String? chargePerService) =>
      _chargePerService = chargePerService;
  String? get areaRange => _areaRange;
  set areaRange(String? areaRange) => _areaRange = areaRange;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get totalExperience => _totalExperience;
  set totalExperience(String? totalExperience) =>
      _totalExperience = totalExperience;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;

  Data.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _subCategoriesId = json['subCategoriesId'];
    _currency = json['currency'];
    _chargePerService = json['chargePerService'];
    _areaRange = json['areaRange'];
    _description = json['description'];
    _totalExperience = json['totalExperience'];
    _userType = json['userType'];
    _status = json['status'];
    _sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['subCategoriesId'] = this._subCategoriesId;
    data['currency'] = this._currency;
    data['chargePerService'] = this._chargePerService;
    data['areaRange'] = this._areaRange;
    data['description'] = this._description;
    data['totalExperience'] = this._totalExperience;
    data['userType'] = this._userType;
    data['status'] = this._status;
    data['_id'] = this._sId;
    return data;
  }
}
