// class ServiceProviderDetailModel {
//   int? _status;
//   String? _message;
//   List<Data>? _data;
//
//   ServiceProviderDetailModel({int? status, String? message, List<Data>? data}) {
//     if (status != null) {
//       this._status = status;
//     }
//     if (message != null) {
//       this._message = message;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//   }
//
//   int? get status => _status;
//   set status(int? status) => _status = status;
//   String? get message => _message;
//   set message(String? message) => _message = message;
//   List<Data>? get data => _data;
//   set data(List<Data>? data) => _data = data;
//
//   ServiceProviderDetailModel.fromJson(Map<String, dynamic> json) {
//     _status = json['status'];
//     _message = json['message'];
//     if (json['data'] != null) {
//       _data = <Data>[];
//       json['data'].forEach((v) {
//         _data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this._status;
//     data['message'] = this._message;
//     if (this._data != null) {
//       data['data'] = this._data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? _sId;
//   String? _firstName;
//   String? _lastName;
//   String? _profilePicture;
//   double? _distance;
//   ServiceDetails? _serviceDetails;
//   SubCategoriesDetails? _subCategoriesDetails;
//   List<double>? _rating;
//   List<double>? _discountCoupon;
//   List<ImagesServiceWise>? _imagesServiceWise;
//
//   Data(
//       {String? sId,
//         String? firstName,
//         String? lastName,
//         String? profilePicture,
//         double? distance,
//         ServiceDetails? serviceDetails,
//         SubCategoriesDetails? subCategoriesDetails,
//         List<double>? rating,
//         List<double>? discountCoupon,
//         List<ImagesServiceWise>? imagesServiceWise}) {
//     if (sId != null) {
//       this._sId = sId;
//     }
//     if (firstName != null) {
//       this._firstName = firstName;
//     }
//     if (lastName != null) {
//       this._lastName = lastName;
//     }
//     if (profilePicture != null) {
//       this._profilePicture = profilePicture;
//     }
//     if (distance != null) {
//       this._distance = distance;
//     }
//     if (serviceDetails != null) {
//       this._serviceDetails = serviceDetails;
//     }
//     if (subCategoriesDetails != null) {
//       this._subCategoriesDetails = subCategoriesDetails;
//     }
//     if (rating != null) {
//       this._rating = rating;
//     }
//     if (discountCoupon != null) {
//       this._discountCoupon = discountCoupon;
//     }
//     if (imagesServiceWise != null) {
//       this._imagesServiceWise = imagesServiceWise;
//     }
//   }
//
//   String? get sId => _sId;
//   set sId(String? sId) => _sId = sId;
//   String? get firstName => _firstName;
//   set firstName(String? firstName) => _firstName = firstName;
//   String? get lastName => _lastName;
//   set lastName(String? lastName) => _lastName = lastName;
//   String? get profilePicture => _profilePicture;
//   set profilePicture(String? profilePicture) =>
//       _profilePicture = profilePicture;
//   double? get distance => _distance;
//   set distance(double? distance) => _distance = distance;
//   ServiceDetails? get serviceDetails => _serviceDetails;
//   set serviceDetails(ServiceDetails? serviceDetails) =>
//       _serviceDetails = serviceDetails;
//   SubCategoriesDetails? get subCategoriesDetails => _subCategoriesDetails;
//   set subCategoriesDetails(SubCategoriesDetails? subCategoriesDetails) =>
//       _subCategoriesDetails = subCategoriesDetails;
//   List<double>? get rating => _rating;
//   set rating(List<double>? rating) => _rating = rating;
//   List<double>? get discountCoupon => _discountCoupon;
//   set discountCoupon(List<double>? discountCoupon) =>
//       _discountCoupon = discountCoupon;
//   List<ImagesServiceWise>? get imagesServiceWise => _imagesServiceWise;
//   set imagesServiceWise(List<ImagesServiceWise>? imagesServiceWise) =>
//       _imagesServiceWise = imagesServiceWise;
//
//   Data.fromJson(Map<String, dynamic> json) {
//     _sId = json['_id'];
//     _firstName = json['firstName'];
//     _lastName = json['lastName'];
//     _profilePicture = json['profilePicture'];
//     _distance = json['distance'];
//     _serviceDetails = json['serviceDetails'] != null
//         ? new ServiceDetails.fromJson(json['serviceDetails'])
//         : null;
//     _subCategoriesDetails = json['subCategoriesDetails'] != null
//         ? new SubCategoriesDetails.fromJson(json['subCategoriesDetails'])
//         : null;
//     _rating = json['Rating'].cast<double>();
//     _discountCoupon = json['discountCoupon'].cast<double>();
//     if (json['imagesServiceWise'] != null) {
//       _imagesServiceWise = <ImagesServiceWise>[];
//       json['imagesServiceWise'].forEach((v) {
//         _imagesServiceWise!.add(new ImagesServiceWise.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this._sId;
//     data['firstName'] = this._firstName;
//     data['lastName'] = this._lastName;
//     data['profilePicture'] = this._profilePicture;
//     data['distance'] = this._distance;
//     if (this._serviceDetails != null) {
//       data['serviceDetails'] = this._serviceDetails!.toJson();
//     }
//     if (this._subCategoriesDetails != null) {
//       data['subCategoriesDetails'] = this._subCategoriesDetails!.toJson();
//     }
//     data['Rating'] = this._rating;
//     data['discountCoupon'] = this._discountCoupon;
//     if (this._imagesServiceWise != null) {
//       data['imagesServiceWise'] =
//           this._imagesServiceWise!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ServiceDetails {
//   String? _sId;
//   String? _currency;
//   String? _chargePerService;
//   String? _description;
//
//   ServiceDetails(
//       {String? sId,
//         String? currency,
//         String? chargePerService,
//         String? description}) {
//     if (sId != null) {
//       this._sId = sId;
//     }
//     if (currency != null) {
//       this._currency = currency;
//     }
//     if (chargePerService != null) {
//       this._chargePerService = chargePerService;
//     }
//     if (description != null) {
//       this._description = description;
//     }
//   }
//
//   String? get sId => _sId;
//   set sId(String? sId) => _sId = sId;
//   String? get currency => _currency;
//   set currency(String? currency) => _currency = currency;
//   String? get chargePerService => _chargePerService;
//   set chargePerService(String? chargePerService) =>
//       _chargePerService = chargePerService;
//   String? get description => _description;
//   set description(String? description) => _description = description;
//
//   ServiceDetails.fromJson(Map<String, dynamic> json) {
//     _sId = json['_id'];
//     _currency = json['currency'];
//     _chargePerService = json['chargePerService'];
//     _description = json['description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this._sId;
//     data['currency'] = this._currency;
//     data['chargePerService'] = this._chargePerService;
//     data['description'] = this._description;
//     return data;
//   }
// }
//
// class SubCategoriesDetails {
//   String? _subCategoriesName;
//
//   SubCategoriesDetails({String? subCategoriesName}) {
//     if (subCategoriesName != null) {
//       this._subCategoriesName = subCategoriesName;
//     }
//   }
//
//   String? get subCategoriesName => _subCategoriesName;
//   set subCategoriesName(String? subCategoriesName) =>
//       _subCategoriesName = subCategoriesName;
//
//   SubCategoriesDetails.fromJson(Map<String, dynamic> json) {
//     _subCategoriesName = json['subCategoriesName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['subCategoriesName'] = this._subCategoriesName;
//     return data;
//   }
// }
//
// class ImagesServiceWise {
//   String? _sId;
//   String? _userId;
//   String? _serviceId;
//   String? _image;
//   String? _userType;
//   int? _iV;
//
//   ImagesServiceWise(
//       {String? sId,
//         String? userId,
//         String? serviceId,
//         String? image,
//         String? userType,
//         int? iV}) {
//     if (sId != null) {
//       this._sId = sId;
//     }
//     if (userId != null) {
//       this._userId = userId;
//     }
//     if (serviceId != null) {
//       this._serviceId = serviceId;
//     }
//     if (image != null) {
//       this._image = image;
//     }
//     if (userType != null) {
//       this._userType = userType;
//     }
//     if (iV != null) {
//       this._iV = iV;
//     }
//   }
//
//   String? get sId => _sId;
//   set sId(String? sId) => _sId = sId;
//   String? get userId => _userId;
//   set userId(String? userId) => _userId = userId;
//   String? get serviceId => _serviceId;
//   set serviceId(String? serviceId) => _serviceId = serviceId;
//   String? get image => _image;
//   set image(String? image) => _image = image;
//   String? get userType => _userType;
//   set userType(String? userType) => _userType = userType;
//   int? get iV => _iV;
//   set iV(int? iV) => _iV = iV;
//
//   ImagesServiceWise.fromJson(Map<String, dynamic> json) {
//     _sId = json['_id'];
//     _userId = json['userId'];
//     _serviceId = json['serviceId'];
//     _image = json['image'];
//     _userType = json['userType'];
//     _iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this._sId;
//     data['userId'] = this._userId;
//     data['serviceId'] = this._serviceId;
//     data['image'] = this._image;
//     data['userType'] = this._userType;
//     data['__v'] = this._iV;
//     return data;
//   }
// }
