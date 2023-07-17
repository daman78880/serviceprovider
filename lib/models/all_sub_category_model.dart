class AllSubCategoryModel {
  int? _status;
  String? _message;
  List<Data>? _data;

  AllSubCategoryModel({int? status, String? message, List<Data>? data}) {
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

  AllSubCategoryModel.fromJson(Map<String, dynamic> json) {
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
  Id? _iId;
  int? _noOfUserAvailableForThisService;

  Data({Id? iId, int? noOfUserAvailableForThisService}) {
    if (iId != null) {
      this._iId = iId;
    }
    if (noOfUserAvailableForThisService != null) {
      this._noOfUserAvailableForThisService = noOfUserAvailableForThisService;
    }
  }

  Id? get iId => _iId;
  set iId(Id? iId) => _iId = iId;
  int? get noOfUserAvailableForThisService => _noOfUserAvailableForThisService;
  set noOfUserAvailableForThisService(int? noOfUserAvailableForThisService) =>
      _noOfUserAvailableForThisService = noOfUserAvailableForThisService;

  Data.fromJson(Map<String, dynamic> json) {
    _iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    _noOfUserAvailableForThisService = json['noOfUserAvailableForThisService'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._iId != null) {
      data['_id'] = this._iId!.toJson();
    }
    data['noOfUserAvailableForThisService'] =
        this._noOfUserAvailableForThisService;
    return data;
  }
}

class Id {
  String? _subCategoriesName;
  String? _imageUrl;

  Id({String? subCategoriesName, String? imageUrl}) {
    if (subCategoriesName != null) {
      this._subCategoriesName = subCategoriesName;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
  }

  String? get subCategoriesName => _subCategoriesName;
  set subCategoriesName(String? subCategoriesName) =>
      _subCategoriesName = subCategoriesName;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  Id.fromJson(Map<String, dynamic> json) {
    _subCategoriesName = json['subCategoriesName'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategoriesName'] = this._subCategoriesName;
    data['imageUrl'] = this._imageUrl;
    return data;
  }
}
