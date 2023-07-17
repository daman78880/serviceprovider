
class CreateFirstServiceModell {
  int status;
  String message;
  CreateFirstServiceData data;

  CreateFirstServiceModell({required this.status, required this.message, required this.data});

  factory CreateFirstServiceModell.fromJson(Map<String, dynamic> json) {
    return CreateFirstServiceModell(
      status: json['status'],
      message: json['message'],
      data: CreateFirstServiceData.fromJson(json['data']),
    );
  }
}

class CreateFirstServiceData {
  String userId;
  String subCategoriesId;
  String currency;
  int chargePerService;
  int areaRange;
  String description;
  List<dynamic> availability;
  int totalExperience;
  String startTime;
  String endTime;
  List<dynamic> images;
  String userType;
  String status;
  String id;
  int v;

  CreateFirstServiceData({
    required this.userId,
    required this.subCategoriesId,
    required this.currency,
    required this.chargePerService,
    required this.areaRange,
    required  this.description,
    required this.availability,
    required this.totalExperience,
    required this.startTime,
    required this.endTime,
    required  this.images,
    required  this.userType,
    required   this.status,
    required  this.id,
    required   this.v,
  });

  factory CreateFirstServiceData.fromJson(Map<String, dynamic> json) {
    return CreateFirstServiceData(
      userId: json['userId'],
      subCategoriesId: json['subCategoriesId'],
      currency: json['currency'],
      chargePerService: json['chargePerService'] is int ? json['chargePerService'] : json['chargePerService'] is Map ? json['chargePerService']['\$numberDecimal'].toInt() : null,
      areaRange: json['areaRange'] is int ? json['areaRange'] : json['areaRange'] is Map ? json['areaRange']['\$numberDecimal'].toInt() : null,
      description: json['description'],
      availability: json['availability'],
      totalExperience: json['totalExperience'] is int ? json['totalExperience'] : json['totalExperience'] is Map ? json['totalExperience']['\$numberDecimal'].toInt() : null,
      startTime: json['startTime'],
      endTime: json['endTime'],
      images: json['images'],
      userType: json['userType'],
      status: json['status'],
      id: json['_id'],
      v: json['__v'],
    );
  }
}

