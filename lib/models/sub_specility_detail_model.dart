class SubSpecilityDetailModel {
  SubSpecilityDetailModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<Data> data;

  SubSpecilityDetailModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.userType,
    required this.id,
    required this.categoriesId,
    required this.subCategoriesName,
    required this.V,
  });
  late final String userType;
  late final String id;
  late final String categoriesId;
  late final String subCategoriesName;
  late final int V;

  Data.fromJson(Map<String, dynamic> json){
    userType = json['userType'];
    id = json['_id'];
    categoriesId = json['categoriesId'];
    subCategoriesName = json['subCategoriesName'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userType'] = userType;
    _data['_id'] = id;
    _data['categoriesId'] = categoriesId;
    _data['subCategoriesName'] = subCategoriesName;
    _data['__v'] = V;
    return _data;
  }
}