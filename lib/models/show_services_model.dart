class ShowServicesModel {
  int? _status;
  String? _message;
  List<Data>? _data;

  ShowServicesModel({int? status, String? message, List<Data>? data}) {
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

  ShowServicesModel.fromJson(Map<String, dynamic> json) {
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
  String? _userId;
  String? _subCategoriesId;
  String? _currency;
  String? _chargePerService;
  String? _areaRange;
  String? _description;
  List<Null>? _availability;
  String? _totalExperience;
  String? _startTime;
  String? _endTime;
  List<Null>? _images;
  String? _userType;
  String? _status;
  int? _iV;

  Data(
      {String? sId,
        String? userId,
        String? subCategoriesId,
        String? currency,
        String? chargePerService,
        String? areaRange,
        String? description,
        String? totalExperience,
        String? startTime,
        String? endTime,
        String? userType,
        String? status,
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
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
    if (availability != null) {
      this._availability = availability;
    }
    if (totalExperience != null) {
      this._totalExperience = totalExperience;
    }
    if (startTime != null) {
      this._startTime = startTime;
    }
    if (endTime != null) {
      this._endTime = endTime;
    }
    if (images != null) {
      this._images = images;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (status != null) {
      this._status = status;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
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
  List<Null>? get availability => _availability;
  set availability(List<Null>? availability) => _availability = availability;
  String? get totalExperience => _totalExperience;
  set totalExperience(String? totalExperience) =>
      _totalExperience = totalExperience;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  String? get endTime => _endTime;
  set endTime(String? endTime) => _endTime = endTime;
  List<Null>? get images => _images;
  set images(List<Null>? images) => _images = images;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get status => _status;
  set status(String? status) => _status = status;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _userId = json['userId'];
    _subCategoriesId = json['subCategoriesId'];
    _currency = json['currency'];
    _chargePerService = json['chargePerService'];
    _areaRange = json['areaRange'];
    _description = json['description'];

    _totalExperience = json['totalExperience'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];

    _userType = json['userType'];
    _status = json['status'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['userId'] = this._userId;
    data['subCategoriesId'] = this._subCategoriesId;
    data['currency'] = this._currency;
    data['chargePerService'] = this._chargePerService;
    data['areaRange'] = this._areaRange;
    data['description'] = this._description;

    data['totalExperience'] = this._totalExperience;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    data['userType'] = this._userType;
    data['status'] = this._status;
    data['__v'] = this._iV;
    return data;
  }
}
