class GetServiceDetailModel {
  int? _status;
  String? _message;
  List<Data>? _data;

  GetServiceDetailModel({int? status, String? message, List<Data>? data}) {
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

  GetServiceDetailModel.fromJson(Map<String, dynamic> json) {
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
  List<Availability>? _availability;
  String? _totalExperience;
  String? _startTime;
  String? _endTime;
  List<Images>? _images;
  String? _userType;
  String? _status;
  int? _iV;
  List<SubCategoriesDetails>? _subCategoriesDetails;
  List<CategoriesDetails>? _categoriesDetails;

  Data(
      {String? sId,
        String? userId,
        String? subCategoriesId,
        String? currency,
        String? chargePerService,
        String? areaRange,
        String? description,
        List<Availability>? availability,
        String? totalExperience,
        String? startTime,
        String? endTime,
        List<Images>? images,
        String? userType,
        String? status,
        int? iV,
        List<SubCategoriesDetails>? subCategoriesDetails,
        List<CategoriesDetails>? categoriesDetails}) {
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
    if (subCategoriesDetails != null) {
      this._subCategoriesDetails = subCategoriesDetails;
    }
    if (categoriesDetails != null) {
      this._categoriesDetails = categoriesDetails;
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
  List<Availability>? get availability => _availability;
  set availability(List<Availability>? availability) =>
      _availability = availability;
  String? get totalExperience => _totalExperience;
  set totalExperience(String? totalExperience) =>
      _totalExperience = totalExperience;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  String? get endTime => _endTime;
  set endTime(String? endTime) => _endTime = endTime;
  List<Images>? get images => _images;
  set images(List<Images>? images) => _images = images;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get status => _status;
  set status(String? status) => _status = status;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  List<SubCategoriesDetails>? get subCategoriesDetails => _subCategoriesDetails;
  set subCategoriesDetails(List<SubCategoriesDetails>? subCategoriesDetails) =>
      _subCategoriesDetails = subCategoriesDetails;
  List<CategoriesDetails>? get categoriesDetails => _categoriesDetails;
  set categoriesDetails(List<CategoriesDetails>? categoriesDetails) =>
      _categoriesDetails = categoriesDetails;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _userId = json['userId'];
    _subCategoriesId = json['subCategoriesId'];
    _currency = json['currency'];
    _chargePerService = json['chargePerService'];
    _areaRange = json['areaRange'];
    _description = json['description'];
    if (json['availability'] != null) {
      _availability = <Availability>[];
      json['availability'].forEach((v) {
        _availability!.add(new Availability.fromJson(v));
      });
    }
    _totalExperience = json['totalExperience'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    if (json['images'] != null) {
      _images = <Images>[];
      json['images'].forEach((v) {
        _images!.add(new Images.fromJson(v));
      });
    }
    _userType = json['userType'];
    _status = json['status'];
    _iV = json['__v'];
    if (json['subCategoriesDetails'] != null) {
      _subCategoriesDetails = <SubCategoriesDetails>[];
      json['subCategoriesDetails'].forEach((v) {
        _subCategoriesDetails!.add(new SubCategoriesDetails.fromJson(v));
      });
    }
    if (json['categoriesDetails'] != null) {
      _categoriesDetails = <CategoriesDetails>[];
      json['categoriesDetails'].forEach((v) {
        _categoriesDetails!.add(new CategoriesDetails.fromJson(v));
      });
    }
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
    if (this._availability != null) {
      data['availability'] =
          this._availability!.map((v) => v.toJson()).toList();
    }
    data['totalExperience'] = this._totalExperience;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    if (this._images != null) {
      data['images'] = this._images!.map((v) => v.toJson()).toList();
    }
    data['userType'] = this._userType;
    data['status'] = this._status;
    data['__v'] = this._iV;
    if (this._subCategoriesDetails != null) {
      data['subCategoriesDetails'] =
          this._subCategoriesDetails!.map((v) => v.toJson()).toList();
    }
    if (this._categoriesDetails != null) {
      data['categoriesDetails'] =
          this._categoriesDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Availability {
  String? _sId;
  String? _serviceId;
  String? _availability;
  String? _startTime;
  String? _endTime;
  String? _userType;
  int? _iV;

  Availability(
      {String? sId,
        String? serviceId,
        String? availability,
        String? startTime,
        String? endTime,
        String? userType,
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (serviceId != null) {
      this._serviceId = serviceId;
    }
    if (availability != null) {
      this._availability = availability;
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
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get serviceId => _serviceId;
  set serviceId(String? serviceId) => _serviceId = serviceId;
  String? get availability => _availability;
  set availability(String? availability) => _availability = availability;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  String? get endTime => _endTime;
  set endTime(String? endTime) => _endTime = endTime;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Availability.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _serviceId = json['serviceId'];
    _availability = json['availability'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _userType = json['userType'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['serviceId'] = this._serviceId;
    data['availability'] = this._availability;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    data['userType'] = this._userType;
    data['__v'] = this._iV;
    return data;
  }
}

class Images {
  String? _sId;
  String? _userId;
  String? _serviceId;
  String? _image;
  String? _userType;
  int? _iV;

  Images(
      {String? sId,
        String? userId,
        String? serviceId,
        String? image,
        String? userType,
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (serviceId != null) {
      this._serviceId = serviceId;
    }
    if (image != null) {
      this._image = image;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get serviceId => _serviceId;
  set serviceId(String? serviceId) => _serviceId = serviceId;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Images.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _userId = json['userId'];
    _serviceId = json['serviceId'];
    _image = json['image'];
    _userType = json['userType'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['userId'] = this._userId;
    data['serviceId'] = this._serviceId;
    data['image'] = this._image;
    data['userType'] = this._userType;
    data['__v'] = this._iV;
    return data;
  }
}

class SubCategoriesDetails {
  String? _sId;
  String? _categoriesId;
  String? _subCategoriesName;
  String? _userType;
  int? _iV;

  SubCategoriesDetails(
      {String? sId,
        String? categoriesId,
        String? subCategoriesName,
        String? userType,
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (categoriesId != null) {
      this._categoriesId = categoriesId;
    }
    if (subCategoriesName != null) {
      this._subCategoriesName = subCategoriesName;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get categoriesId => _categoriesId;
  set categoriesId(String? categoriesId) => _categoriesId = categoriesId;
  String? get subCategoriesName => _subCategoriesName;
  set subCategoriesName(String? subCategoriesName) =>
      _subCategoriesName = subCategoriesName;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  SubCategoriesDetails.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _categoriesId = json['categoriesId'];
    _subCategoriesName = json['subCategoriesName'];
    _userType = json['userType'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['categoriesId'] = this._categoriesId;
    data['subCategoriesName'] = this._subCategoriesName;
    data['userType'] = this._userType;
    data['__v'] = this._iV;
    return data;
  }
}

class CategoriesDetails {
  String? _sId;
  String? _categoriesName;
  String? _userType;
  int? _iV;

  CategoriesDetails(
      {String? sId, String? categoriesName, String? userType, int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (categoriesName != null) {
      this._categoriesName = categoriesName;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get categoriesName => _categoriesName;
  set categoriesName(String? categoriesName) =>
      _categoriesName = categoriesName;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  CategoriesDetails.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _categoriesName = json['categoriesName'];
    _userType = json['userType'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['categoriesName'] = this._categoriesName;
    data['userType'] = this._userType;
    data['__v'] = this._iV;
    return data;
  }
}
