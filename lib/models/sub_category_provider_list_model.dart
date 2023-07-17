class SubCategoryProviderListModel {
  int? _status;
  String? _message;
  List<Data>? _data;

  SubCategoryProviderListModel(
      {int? status, String? message, List<Data>? data}) {
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

  SubCategoryProviderListModel.fromJson(Map<String, dynamic> json) {
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
  String? _firstName;
  String? _lastName;
  double? _distance;
  ServiceDetails? _serviceDetails;
  List<Rating>? _rating;
  String? _profilePicture;
  int? _averageRating;

  Data(
      {String? sId,
        String? firstName,
        String? lastName,
        double? distance,
        ServiceDetails? serviceDetails,
        List<Rating>? rating,
        String? profilePicture,
        int? averageRating}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (distance != null) {
      this._distance = distance;
    }
    if (serviceDetails != null) {
      this._serviceDetails = serviceDetails;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (profilePicture != null) {
      this._profilePicture = profilePicture;
    }
    if (averageRating != null) {
      this._averageRating = averageRating;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  double? get distance => _distance;
  set distance(double? distance) => _distance = distance;
  ServiceDetails? get serviceDetails => _serviceDetails;
  set serviceDetails(ServiceDetails? serviceDetails) =>
      _serviceDetails = serviceDetails;
  List<Rating>? get rating => _rating;
  set rating(List<Rating>? rating) => _rating = rating;
  String? get profilePicture => _profilePicture;
  set profilePicture(String? profilePicture) =>
      _profilePicture = profilePicture;
  int? get averageRating => _averageRating;
  set averageRating(int? averageRating) => _averageRating = averageRating;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _distance = json['distance'];
    _serviceDetails = json['serviceDetails'] != null
        ? new ServiceDetails.fromJson(json['serviceDetails'])
        : null;
    if (json['Rating'] != null) {
      _rating = <Rating>[];
      json['Rating'].forEach((v) {
        _rating!.add(new Rating.fromJson(v));
      });
    }
    _profilePicture = json['profilePicture'];
    _averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['distance'] = this._distance;
    if (this._serviceDetails != null) {
      data['serviceDetails'] = this._serviceDetails!.toJson();
    }
    if (this._rating != null) {
      data['Rating'] = this._rating!.map((v) => v.toJson()).toList();
    }
    data['profilePicture'] = this._profilePicture;
    data['averageRating'] = this._averageRating;
    return data;
  }
}

class ServiceDetails {
  String? _sId;
  String? _subCategoriesName;
  String? _currency;
  String? _chargePerService;
  String? _description;
  List<String>? _images;

  ServiceDetails(
      {String? sId,
        String? subCategoriesName,
        String? currency,
        String? chargePerService,
        String? description,
        List<String>? images}) {
    if (sId != null) {
      this._sId = sId;
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
    if (description != null) {
      this._description = description;
    }
    if (images != null) {
      this._images = images;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get subCategoriesName => _subCategoriesName;
  set subCategoriesName(String? subCategoriesName) =>
      _subCategoriesName = subCategoriesName;
  String? get currency => _currency;
  set currency(String? currency) => _currency = currency;
  String? get chargePerService => _chargePerService;
  set chargePerService(String? chargePerService) =>
      _chargePerService = chargePerService;
  String? get description => _description;
  set description(String? description) => _description = description;
  List<String>? get images => _images;
  set images(List<String>? images) => _images = images;

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _subCategoriesName = json['subCategoriesName'];
    _currency = json['currency'];
    _chargePerService = json['chargePerService'];
    _description = json['description'];
    _images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['subCategoriesName'] = this._subCategoriesName;
    data['currency'] = this._currency;
    data['chargePerService'] = this._chargePerService;
    data['description'] = this._description;
    data['images'] = this._images;
    return data;
  }
}

class Rating {
  String? _sId;
  String? _senderName;
  String? _senderProfilePic;
  String? _senderId;
  String? _recieverId;
  String? _serviceId;
  int? _rating;
  String? _comments;
  String? _userType;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;

  Rating(
      {String? sId,
        String? senderName,
        String? senderProfilePic,
        String? senderId,
        String? recieverId,
        String? serviceId,
        int? rating,
        String? comments,
        String? userType,
        String? createdAt,
        String? updatedAt,
        int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (senderName != null) {
      this._senderName = senderName;
    }
    if (senderProfilePic != null) {
      this._senderProfilePic = senderProfilePic;
    }
    if (senderId != null) {
      this._senderId = senderId;
    }
    if (recieverId != null) {
      this._recieverId = recieverId;
    }
    if (serviceId != null) {
      this._serviceId = serviceId;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (comments != null) {
      this._comments = comments;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get senderName => _senderName;
  set senderName(String? senderName) => _senderName = senderName;
  String? get senderProfilePic => _senderProfilePic;
  set senderProfilePic(String? senderProfilePic) =>
      _senderProfilePic = senderProfilePic;
  String? get senderId => _senderId;
  set senderId(String? senderId) => _senderId = senderId;
  String? get recieverId => _recieverId;
  set recieverId(String? recieverId) => _recieverId = recieverId;
  String? get serviceId => _serviceId;
  set serviceId(String? serviceId) => _serviceId = serviceId;
  int? get rating => _rating;
  set rating(int? rating) => _rating = rating;
  String? get comments => _comments;
  set comments(String? comments) => _comments = comments;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Rating.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _senderName = json['senderName'];
    _senderProfilePic = json['senderProfilePic'];
    _senderId = json['senderId'];
    _recieverId = json['recieverId'];
    _serviceId = json['serviceId'];
    _rating = json['rating'];
    _comments = json['comments'];
    _userType = json['userType'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['senderName'] = this._senderName;
    data['senderProfilePic'] = this._senderProfilePic;
    data['senderId'] = this._senderId;
    data['recieverId'] = this._recieverId;
    data['serviceId'] = this._serviceId;
    data['rating'] = this._rating;
    data['comments'] = this._comments;
    data['userType'] = this._userType;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['__v'] = this._iV;
    return data;
  }
}
