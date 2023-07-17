class BookingModel {
  int? _status;
  String? _message;
  Data? _data;

  BookingModel({int? status, String? message, Data? data}) {
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

  BookingModel.fromJson(Map<String, dynamic> json) {
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
  List<ServiceProvider>? _serviceProvider;
  List<Customer>? _customer;

  Data({List<ServiceProvider>? serviceProvider, List<Customer>? customer}) {
    if (serviceProvider != null) {
      this._serviceProvider = serviceProvider;
    }
    if (customer != null) {
      this._customer = customer;
    }
  }

  List<ServiceProvider>? get serviceProvider => _serviceProvider;
  set serviceProvider(List<ServiceProvider>? serviceProvider) =>
      _serviceProvider = serviceProvider;
  List<Customer>? get customer => _customer;
  set customer(List<Customer>? customer) => _customer = customer;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['serviceProvider'] != null) {
      _serviceProvider = <ServiceProvider>[];
      json['serviceProvider'].forEach((v) {
        _serviceProvider!.add(new ServiceProvider.fromJson(v));
      });
    }
    if (json['customer'] != null) {
      _customer = <Customer>[];
      json['customer'].forEach((v) {
        _customer!.add(new Customer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._serviceProvider != null) {
      data['serviceProvider'] =
          this._serviceProvider!.map((v) => v.toJson()).toList();
    }
    if (this._customer != null) {
      data['customer'] = this._customer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceProvider {
  String? _sId;
  String? _customerServiceId;
  String? _serviceProviderServiceId;
  String? _customerId;
  String? _serviceProviderId;
  String? _bookingStatus;
  String? _amount;
  String? _promoCode;
  double? _calculatedDistance;
  int? _iV;
  ServiceProviderDetails? _serviceProviderDetails;
  UserProfileDetails? _userProfileDetails;

  ServiceProvider(
      {String? sId,
        String? customerServiceId,
        String? serviceProviderServiceId,
        String? customerId,
        String? serviceProviderId,
        String? bookingStatus,
        String? amount,
        String? promoCode,
        double? calculatedDistance,
        int? iV,
        ServiceProviderDetails? serviceProviderDetails,
        UserProfileDetails? userProfileDetails}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (customerServiceId != null) {
      this._customerServiceId = customerServiceId;
    }
    if (serviceProviderServiceId != null) {
      this._serviceProviderServiceId = serviceProviderServiceId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (serviceProviderId != null) {
      this._serviceProviderId = serviceProviderId;
    }
    if (bookingStatus != null) {
      this._bookingStatus = bookingStatus;
    }
    if (amount != null) {
      this._amount = amount;
    }
    if (promoCode != null) {
      this._promoCode = promoCode;
    }
    if (calculatedDistance != null) {
      this._calculatedDistance = calculatedDistance;
    }
    if (iV != null) {
      this._iV = iV;
    }
    if (serviceProviderDetails != null) {
      this._serviceProviderDetails = serviceProviderDetails;
    }
    if (userProfileDetails != null) {
      this._userProfileDetails = userProfileDetails;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get customerServiceId => _customerServiceId;
  set customerServiceId(String? customerServiceId) =>
      _customerServiceId = customerServiceId;
  String? get serviceProviderServiceId => _serviceProviderServiceId;
  set serviceProviderServiceId(String? serviceProviderServiceId) =>
      _serviceProviderServiceId = serviceProviderServiceId;
  String? get customerId => _customerId;
  set customerId(String? customerId) => _customerId = customerId;
  String? get serviceProviderId => _serviceProviderId;
  set serviceProviderId(String? serviceProviderId) =>
      _serviceProviderId = serviceProviderId;
  String? get bookingStatus => _bookingStatus;
  set bookingStatus(String? bookingStatus) => _bookingStatus = bookingStatus;
  String? get amount => _amount;
  set amount(String? amount) => _amount = amount;
  String? get promoCode => _promoCode;
  set promoCode(String? promoCode) => _promoCode = promoCode;
  double? get calculatedDistance => _calculatedDistance;
  set calculatedDistance(double? calculatedDistance) =>
      _calculatedDistance = calculatedDistance;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  ServiceProviderDetails? get serviceProviderDetails => _serviceProviderDetails;
  set serviceProviderDetails(ServiceProviderDetails? serviceProviderDetails) =>
      _serviceProviderDetails = serviceProviderDetails;
  UserProfileDetails? get userProfileDetails => _userProfileDetails;
  set userProfileDetails(UserProfileDetails? userProfileDetails) =>
      _userProfileDetails = userProfileDetails;

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _customerServiceId = json['customerServiceId'];
    _serviceProviderServiceId = json['serviceProviderServiceId'];
    _customerId = json['customerId'];
    _serviceProviderId = json['serviceProviderId'];
    _bookingStatus = json['bookingStatus'];
    _amount = json['amount'];
    _promoCode = json['promoCode'];
    _calculatedDistance = json['calculatedDistance'];
    _iV = json['__v'];
    _serviceProviderDetails = json['ServiceProviderDetails'] != null
        ? new ServiceProviderDetails.fromJson(json['ServiceProviderDetails'])
        : null;
    _userProfileDetails = json['userProfileDetails'] != null
        ? new UserProfileDetails.fromJson(json['userProfileDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['customerServiceId'] = this._customerServiceId;
    data['serviceProviderServiceId'] = this._serviceProviderServiceId;
    data['customerId'] = this._customerId;
    data['serviceProviderId'] = this._serviceProviderId;
    data['bookingStatus'] = this._bookingStatus;
    data['amount'] = this._amount;
    data['promoCode'] = this._promoCode;
    data['calculatedDistance'] = this._calculatedDistance;
    data['__v'] = this._iV;
    if (this._serviceProviderDetails != null) {
      data['ServiceProviderDetails'] = this._serviceProviderDetails!.toJson();
    }
    if (this._userProfileDetails != null) {
      data['userProfileDetails'] = this._userProfileDetails!.toJson();
    }
    return data;
  }
}

class ServiceProviderDetails {
  String? _sId;
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
  int? _iV;

  ServiceProviderDetails(
      {String? sId,
        String? userId,
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
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
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
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
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
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  ServiceProviderDetails.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
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
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
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
    data['__v'] = this._iV;
    return data;
  }
}

class Location {
  String? _type;
  List<double>? _coordinates;

  Location({String? type, List<double>? coordinates}) {
    if (type != null) {
      this._type = type;
    }
    if (coordinates != null) {
      this._coordinates = coordinates;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  List<double>? get coordinates => _coordinates;
  set coordinates(List<double>? coordinates) => _coordinates = coordinates;

  Location.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['coordinates'] = this._coordinates;
    return data;
  }
}

class UserProfileDetails {
  String? _sId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _address;
  String? _state;
  String? _city;
  String? _pinCode;
  String? _landMark;
  String? _gender;
  String? _countryCode;
  String? _phoneNo;
  String? _userType;
  Location? _location;
  bool? _isProfileStatus;
  String? _profilePicture;
  int? _iV;
  String? _otp;

  UserProfileDetails(
      {String? sId,
        String? firstName,
        String? lastName,
        String? email,
        String? address,
        String? state,
        String? city,
        String? pinCode,
        String? landMark,
        String? gender,
        String? countryCode,
        String? phoneNo,
        String? userType,
        Location? location,
        bool? isProfileStatus,
        String? profilePicture,
        int? iV,
        String? otp}) {
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
    if (gender != null) {
      this._gender = gender;
    }
    if (countryCode != null) {
      this._countryCode = countryCode;
    }
    if (phoneNo != null) {
      this._phoneNo = phoneNo;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (location != null) {
      this._location = location;
    }
    if (isProfileStatus != null) {
      this._isProfileStatus = isProfileStatus;
    }
    if (profilePicture != null) {
      this._profilePicture = profilePicture;
    }
    if (iV != null) {
      this._iV = iV;
    }
    if (otp != null) {
      this._otp = otp;
    }
  }

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
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  String? get phoneNo => _phoneNo;
  set phoneNo(String? phoneNo) => _phoneNo = phoneNo;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  Location? get location => _location;
  set location(Location? location) => _location = location;
  bool? get isProfileStatus => _isProfileStatus;
  set isProfileStatus(bool? isProfileStatus) =>
      _isProfileStatus = isProfileStatus;
  String? get profilePicture => _profilePicture;
  set profilePicture(String? profilePicture) =>
      _profilePicture = profilePicture;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  String? get otp => _otp;
  set otp(String? otp) => _otp = otp;

  UserProfileDetails.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _address = json['address'];
    _state = json['state'];
    _city = json['city'];
    _pinCode = json['pinCode'];
    _landMark = json['landMark'];
    _gender = json['gender'];
    _countryCode = json['countryCode'];
    _phoneNo = json['phoneNo'];
    _userType = json['userType'];
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _isProfileStatus = json['isProfileStatus'];
    _profilePicture = json['profilePicture'];
    _iV = json['__v'];
    _otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['address'] = this._address;
    data['state'] = this._state;
    data['city'] = this._city;
    data['pinCode'] = this._pinCode;
    data['landMark'] = this._landMark;
    data['gender'] = this._gender;
    data['countryCode'] = this._countryCode;
    data['phoneNo'] = this._phoneNo;
    data['userType'] = this._userType;
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    data['isProfileStatus'] = this._isProfileStatus;
    data['profilePicture'] = this._profilePicture;
    data['__v'] = this._iV;
    data['otp'] = this._otp;
    return data;
  }
}

class Customer {
  String? _sId;
  String? _customerServiceId;
  String? _serviceProviderServiceId;
  String? _customerId;
  String? _serviceProviderId;
  String? _bookingStatus;
  String? _amount;
  String? _promoCode;
  double? _calculatedDistance;
  int? _iV;
  CustomerServiceDetails? _customerServiceDetails;
  UserProfileDetails? _customerProfileDetails;

  Customer(
      {String? sId,
        String? customerServiceId,
        String? serviceProviderServiceId,
        String? customerId,
        String? serviceProviderId,
        String? bookingStatus,
        String? amount,
        String? promoCode,
        double? calculatedDistance,
        int? iV,
        CustomerServiceDetails? customerServiceDetails,
        UserProfileDetails? customerProfileDetails}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (customerServiceId != null) {
      this._customerServiceId = customerServiceId;
    }
    if (serviceProviderServiceId != null) {
      this._serviceProviderServiceId = serviceProviderServiceId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (serviceProviderId != null) {
      this._serviceProviderId = serviceProviderId;
    }
    if (bookingStatus != null) {
      this._bookingStatus = bookingStatus;
    }
    if (amount != null) {
      this._amount = amount;
    }
    if (promoCode != null) {
      this._promoCode = promoCode;
    }
    if (calculatedDistance != null) {
      this._calculatedDistance = calculatedDistance;
    }
    if (iV != null) {
      this._iV = iV;
    }
    if (customerServiceDetails != null) {
      this._customerServiceDetails = customerServiceDetails;
    }
    if (customerProfileDetails != null) {
      this._customerProfileDetails = customerProfileDetails;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get customerServiceId => _customerServiceId;
  set customerServiceId(String? customerServiceId) =>
      _customerServiceId = customerServiceId;
  String? get serviceProviderServiceId => _serviceProviderServiceId;
  set serviceProviderServiceId(String? serviceProviderServiceId) =>
      _serviceProviderServiceId = serviceProviderServiceId;
  String? get customerId => _customerId;
  set customerId(String? customerId) => _customerId = customerId;
  String? get serviceProviderId => _serviceProviderId;
  set serviceProviderId(String? serviceProviderId) =>
      _serviceProviderId = serviceProviderId;
  String? get bookingStatus => _bookingStatus;
  set bookingStatus(String? bookingStatus) => _bookingStatus = bookingStatus;
  String? get amount => _amount;
  set amount(String? amount) => _amount = amount;
  String? get promoCode => _promoCode;
  set promoCode(String? promoCode) => _promoCode = promoCode;
  double? get calculatedDistance => _calculatedDistance;
  set calculatedDistance(double? calculatedDistance) =>
      _calculatedDistance = calculatedDistance;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  CustomerServiceDetails? get customerServiceDetails => _customerServiceDetails;
  set customerServiceDetails(CustomerServiceDetails? customerServiceDetails) =>
      _customerServiceDetails = customerServiceDetails;
  UserProfileDetails? get customerProfileDetails => _customerProfileDetails;
  set customerProfileDetails(UserProfileDetails? customerProfileDetails) =>
      _customerProfileDetails = customerProfileDetails;

  Customer.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _customerServiceId = json['customerServiceId'];
    _serviceProviderServiceId = json['serviceProviderServiceId'];
    _customerId = json['customerId'];
    _serviceProviderId = json['serviceProviderId'];
    _bookingStatus = json['bookingStatus'];
    _amount = json['amount'];
    _promoCode = json['promoCode'];
    _calculatedDistance = json['calculatedDistance'];
    _iV = json['__v'];
    _customerServiceDetails = json['customerServiceDetails'] != null
        ? new CustomerServiceDetails.fromJson(json['customerServiceDetails'])
        : null;
    _customerProfileDetails = json['customerProfileDetails'] != null
        ? new UserProfileDetails.fromJson(json['customerProfileDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['customerServiceId'] = this._customerServiceId;
    data['serviceProviderServiceId'] = this._serviceProviderServiceId;
    data['customerId'] = this._customerId;
    data['serviceProviderId'] = this._serviceProviderId;
    data['bookingStatus'] = this._bookingStatus;
    data['amount'] = this._amount;
    data['promoCode'] = this._promoCode;
    data['calculatedDistance'] = this._calculatedDistance;
    data['__v'] = this._iV;
    if (this._customerServiceDetails != null) {
      data['customerServiceDetails'] = this._customerServiceDetails!.toJson();
    }
    if (this._customerProfileDetails != null) {
      data['customerProfileDetails'] = this._customerProfileDetails!.toJson();
    }
    return data;
  }
}

class CustomerServiceDetails {
  String? _sId;
  String? _userId;
  String? _categoriesName;
  String? _subCategoriesName;
  String? _chargePerService;
  String? _areaRange;
  String? _description;
  List<String>? _availability;
  String? _totalExperience;
  List<String>? _images;
  int? _livingRoom;
  int? _bedRoom;
  int? _bathRoom;
  int? _kitchen;
  String? _status;
  List<String>? _startTime;
  List<String>? _endTime;
  String? _userType;
  String? _date;
  int? _pincodeForService;
  String? _landmark;
  String? _addressForService;
  Location? _location;
  int? _iV;

  CustomerServiceDetails(
      {String? sId,
        String? userId,
        String? categoriesName,
        String? subCategoriesName,
        String? chargePerService,
        String? areaRange,
        String? description,
        List<String>? availability,
        String? totalExperience,
        List<String>? images,
        int? livingRoom,
        int? bedRoom,
        int? bathRoom,
        int? kitchen,
        String? status,
        List<String>? startTime,
        List<String>? endTime,
        String? userType,
        String? date,
        int? pincodeForService,
        String? landmark,
        String? addressForService,
        Location? location,
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (categoriesName != null) {
      this._categoriesName = categoriesName;
    }
    if (subCategoriesName != null) {
      this._subCategoriesName = subCategoriesName;
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
    if (livingRoom != null) {
      this._livingRoom = livingRoom;
    }
    if (bedRoom != null) {
      this._bedRoom = bedRoom;
    }
    if (bathRoom != null) {
      this._bathRoom = bathRoom;
    }
    if (kitchen != null) {
      this._kitchen = kitchen;
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
    if (date != null) {
      this._date = date;
    }
    if (pincodeForService != null) {
      this._pincodeForService = pincodeForService;
    }
    if (landmark != null) {
      this._landmark = landmark;
    }
    if (addressForService != null) {
      this._addressForService = addressForService;
    }
    if (location != null) {
      this._location = location;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get categoriesName => _categoriesName;
  set categoriesName(String? categoriesName) =>
      _categoriesName = categoriesName;
  String? get subCategoriesName => _subCategoriesName;
  set subCategoriesName(String? subCategoriesName) =>
      _subCategoriesName = subCategoriesName;
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
  int? get livingRoom => _livingRoom;
  set livingRoom(int? livingRoom) => _livingRoom = livingRoom;
  int? get bedRoom => _bedRoom;
  set bedRoom(int? bedRoom) => _bedRoom = bedRoom;
  int? get bathRoom => _bathRoom;
  set bathRoom(int? bathRoom) => _bathRoom = bathRoom;
  int? get kitchen => _kitchen;
  set kitchen(int? kitchen) => _kitchen = kitchen;
  String? get status => _status;
  set status(String? status) => _status = status;
  List<String>? get startTime => _startTime;
  set startTime(List<String>? startTime) => _startTime = startTime;
  List<String>? get endTime => _endTime;
  set endTime(List<String>? endTime) => _endTime = endTime;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get date => _date;
  set date(String? date) => _date = date;
  int? get pincodeForService => _pincodeForService;
  set pincodeForService(int? pincodeForService) =>
      _pincodeForService = pincodeForService;
  String? get landmark => _landmark;
  set landmark(String? landmark) => _landmark = landmark;
  String? get addressForService => _addressForService;
  set addressForService(String? addressForService) =>
      _addressForService = addressForService;
  Location? get location => _location;
  set location(Location? location) => _location = location;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  CustomerServiceDetails.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _userId = json['userId'];
    _categoriesName = json['categoriesName'];
    _subCategoriesName = json['subCategoriesName'];
    _chargePerService = json['chargePerService'];
    _areaRange = json['areaRange'];
    _description = json['description'];
    _availability = json['availability'].cast<String>();
    _totalExperience = json['totalExperience'];
    _images = json['images'].cast<String>();
    _livingRoom = json['livingRoom'];
    _bedRoom = json['bedRoom'];
    _bathRoom = json['bathRoom'];
    _kitchen = json['kitchen'];
    _status = json['status'];
    _startTime = json['startTime'].cast<String>();
    _endTime = json['endTime'].cast<String>();
    _userType = json['userType'];
    _date = json['date'];
    _pincodeForService = json['pincodeForService'];
    _landmark = json['landmark'];
    _addressForService = json['addressForService'];
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['userId'] = this._userId;
    data['categoriesName'] = this._categoriesName;
    data['subCategoriesName'] = this._subCategoriesName;
    data['chargePerService'] = this._chargePerService;
    data['areaRange'] = this._areaRange;
    data['description'] = this._description;
    data['availability'] = this._availability;
    data['totalExperience'] = this._totalExperience;
    data['images'] = this._images;
    data['livingRoom'] = this._livingRoom;
    data['bedRoom'] = this._bedRoom;
    data['bathRoom'] = this._bathRoom;
    data['kitchen'] = this._kitchen;
    data['status'] = this._status;
    data['startTime'] = this._startTime;
    data['endTime'] = this._endTime;
    data['userType'] = this._userType;
    data['date'] = this._date;
    data['pincodeForService'] = this._pincodeForService;
    data['landmark'] = this._landmark;
    data['addressForService'] = this._addressForService;
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    data['__v'] = this._iV;
    return data;
  }
}
