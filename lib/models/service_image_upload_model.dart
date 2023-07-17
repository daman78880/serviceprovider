class ServiceImageUploadModel {
  int? _status;
  String? _message;
  Data? _data;

  ServiceImageUploadModel({int? status, String? message, Data? data}) {
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

  ServiceImageUploadModel.fromJson(Map<String, dynamic> json) {
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
  String? _serviceId;
  String? _image;
  String? _userType;
  String? _sId;
  int? _iV;

  Data(
      {String? serviceId,
        String? image,
        String? userType,
        String? sId,
        int? iV}) {
    if (serviceId != null) {
      this._serviceId = serviceId;
    }
    if (image != null) {
      this._image = image;
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

  String? get serviceId => _serviceId;
  set serviceId(String? serviceId) => _serviceId = serviceId;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _serviceId = json['serviceId'];
    _image = json['image'];
    _userType = json['userType'];
    _sId = json['_id'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this._serviceId;
    data['image'] = this._image;
    data['userType'] = this._userType;
    data['_id'] = this._sId;
    data['__v'] = this._iV;
    return data;
  }
}
