class CreateServiceOneTimeModel {
  int? _status;
  String? _message;
  Data? _data;

  CreateServiceOneTimeModel({int? status, String? message, Data? data}) {
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

  CreateServiceOneTimeModel.fromJson(Map<String, dynamic> json) {
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
  String? _categoriesName;
  String? _subCategoriesName;
  String? _currency;
  String? _chargePerService;
  String? _areaRange;
  String? _description;
  List<String>? _availability;
  String? _totalExperience;
  List<String>? _images;
  String? _status;
  List<String>? _startTime;
  List<String>? _endTime;
  String? _userType;
  Location? _location;
  String? _sId;
  int? _iV;

  Data(
      {String? userId,
        String? categoriesName,
        String? subCategoriesName,
        String? currency,
        String? chargePerService,
        String? areaRange,
        String? description,
        List<String>? availability,
        String? totalExperience,
        List<String>? images,
        String? status,
        List<String>? startTime,
        List<String>? endTime,
        String? userType,
        Location? location,
        String? sId,
        int? iV}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (categoriesName != null) {
      this._categoriesName = categoriesName;
    }
    if (subCategoriesName != null) {
      this._subCategoriesName = subCategoriesName;
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
    if (images != null) {
      this._images = images;
    }
    if (status != null) {
      this._status = status;
    }
    if (startTime != null) {
      this._startTime = startTime;
    }
    if (endTime != null) {
      this._endTime = endTime;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (location != null) {
      this._location = location;
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
  String? get categoriesName => _categoriesName;
  set categoriesName(String? categoriesName) =>
      _categoriesName = categoriesName;
  String? get subCategoriesName => _subCategoriesName;
  set subCategoriesName(String? subCategoriesName) =>
      _subCategoriesName = subCategoriesName;
  String? get currency => _currency;
  set currency(String? currency) => _currency = currency;
  String? get chargePerService => _chargePerService;
  set chargePerService(String? chargePerService) =>
      _chargePerService = chargePerService;
  String? get areaRange => _areaRange;
  set areaRange(String? areaRange) => _areaRange = areaRange;
  String? get description => _description;
  set description(String? description) => _description = description;
  List<String>? get availability => _availability;
  set availability(List<String>? availability) => _availability = availability;
  String? get totalExperience => _totalExperience;
  set totalExperience(String? totalExperience) =>
      _totalExperience = totalExperience;
  List<String>? get images => _images;
  set images(List<String>? images) => _images = images;
  String? get status => _status;
  set status(String? status) => _status = status;
  List<String>? get startTime => _startTime;
  set startTime(List<String>? startTime) => _startTime = startTime;
  List<String>? get endTime => _endTime;
  set endTime(List<String>? endTime) => _endTime = endTime;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  Location? get location => _location;
  set location(Location? location) => _location = location;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _categoriesName = json['categoriesName'];
    _subCategoriesName = json['subCategoriesName'];
    _currency = json['currency'];
    _chargePerService = json['chargePerService'];
    _areaRange = json['areaRange'];
    _description = json['description'];
    _availability = json['availability'].cast<String>();
    _totalExperience = json['totalExperience'];
    _images = json['images'].cast<String>();
    _status = json['status'];
    _startTime = json['startTime'].cast<String>();
    _endTime = json['endTime'].cast<String>();
    _userType = json['userType'];
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _sId = json['_id'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['categoriesName'] = this._categoriesName;
    data['subCategoriesName'] = this._subCategoriesName;
    data['currency'] = this._currency;
    data['chargePerService'] = this._chargePerService;
    data['areaRange'] = this._areaRange;
    data['description'] = this._description;
    data['availability'] = this._availability;
    data['totalExperience'] = this._totalExperience;
    data['images'] = this._images;
    data['status'] = this._status;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    data['userType'] = this._userType;
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    data['_id'] = this._sId;
    data['__v'] = this._iV;
    return data;
  }
}

class Location {
  String? _type;
  List<int>? _coordinates;

  Location({String? type, List<int>? coordinates}) {
    if (type != null) {
      this._type = type;
    }
    if (coordinates != null) {
      this._coordinates = coordinates;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  List<int>? get coordinates => _coordinates;
  set coordinates(List<int>? coordinates) => _coordinates = coordinates;

  Location.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['coordinates'] = this._coordinates;
    return data;
  }
}
