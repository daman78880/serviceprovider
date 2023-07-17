class CreateServiceSecondModel {
  int? _status;
  String? _message;
  Data? _data;

  CreateServiceSecondModel({int? status, String? message, Data? data}) {
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

  CreateServiceSecondModel.fromJson(Map<String, dynamic> json) {
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
  String? _availability;
  String? _startTime;
  String? _endTime;
  String? _userType;
  String? _sId;
  int? _iV;

  Data(
      {String? serviceId,
        String? availability,
        String? startTime,
        String? endTime,
        String? userType,
        String? sId,
        int? iV}) {
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
    if (sId != null) {
      this._sId = sId;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

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
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _serviceId = json['serviceId'];
    _availability = json['availability'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _userType = json['userType'];
    _sId = json['_id'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this._serviceId;
    data['availability'] = this._availability;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    data['userType'] = this._userType;
    data['_id'] = this._sId;
    data['__v'] = this._iV;
    return data;
  }
}
