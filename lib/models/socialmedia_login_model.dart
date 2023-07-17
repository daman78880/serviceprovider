class SocialMediaLoginModel {
  int? _status;
  String? _message;
  Data? _data;

  SocialMediaLoginModel({int? status, String? message, Data? data}) {
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

  SocialMediaLoginModel.fromJson(Map<String, dynamic> json) {
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
  Location? _location;
  String? _sId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _address;
  String? _state;
  String? _city;
  String? _pinCode;
  String? _landMark;
  String? _googleId;
  String? _userType;
  String? _stages;
  int? _iV;
  String? _token;

  Data(
      {Location? location,
        String? sId,
        String? firstName,
        String? lastName,
        String? email,
        String? address,
        String? state,
        String? city,
        String? pinCode,
        String? landMark,
        String? googleId,
        String? userType,
        String? stages,
        int? iV,
        String? token}) {
    if (location != null) {
      this._location = location;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (address != null) {
      this._address = address;
    }
    if (state != null) {
      this._state = state;
    }
    if (city != null) {
      this._city = city;
    }
    if (pinCode != null) {
      this._pinCode = pinCode;
    }
    if (landMark != null) {
      this._landMark = landMark;
    }
    if (googleId != null) {
      this._googleId = googleId;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (stages != null) {
      this._stages = stages;
    }
    if (iV != null) {
      this._iV = iV;
    }
    if (token != null) {
      this._token = token;
    }
  }

  Location? get location => _location;
  set location(Location? location) => _location = location;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get pinCode => _pinCode;
  set pinCode(String? pinCode) => _pinCode = pinCode;
  String? get landMark => _landMark;
  set landMark(String? landMark) => _landMark = landMark;
  String? get googleId => _googleId;
  set googleId(String? googleId) => _googleId = googleId;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get stages => _stages;
  set stages(String? stages) => _stages = stages;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  String? get token => _token;
  set token(String? token) => _token = token;

  Data.fromJson(Map<String, dynamic> json) {
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _sId = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _address = json['address'];
    _state = json['state'];
    _city = json['city'];
    _pinCode = json['pinCode'];
    _landMark = json['landMark'];
    _googleId = json['googleId'];
    _userType = json['userType'];
    _stages = json['stages'];
    _iV = json['__v'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    data['_id'] = this._sId;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['address'] = this._address;
    data['state'] = this._state;
    data['city'] = this._city;
    data['pinCode'] = this._pinCode;
    data['landMark'] = this._landMark;
    data['googleId'] = this._googleId;
    data['userType'] = this._userType;
    data['stages'] = this._stages;
    data['__v'] = this._iV;
    data['token'] = this._token;
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
