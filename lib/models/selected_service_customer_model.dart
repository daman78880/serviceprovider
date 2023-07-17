import 'package:get/get.dart';

class SelectedServiceCustomerModel {
  String title;
  RxInt selected;
  SelectedServiceCustomerModel({required this.title,  required this.selected});
}
/*class SelectedServiceCustomerModel {
  String? _title;
  RxInt? _selected;

  SelectedServiceCustomerModel({String? title, RxInt? selected}) {
    if (title != null) {
      this._title = title;
    }
    if (selected != null) {
      this._selected = selected;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;

  RxInt? get selected => _selected;
  set selected(RxInt? selected) => _selected = selected;

  SelectedServiceCustomerModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['selected'] = this._selected;
    return data;
  }
}*/
