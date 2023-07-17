import 'package:get/get.dart';

class PaymentListDetailModel {
  String title;
  RxBool selected;
  bool cardStatus;
  String icon;

  PaymentListDetailModel(
      {required this.title, required this.selected, required this.cardStatus,required this.icon});
}
/*class PaymentListDetailModel {
  String? _title;
  RxBool? _selected;
  bool? _cardStatus;
  String? _icon;

  PaymentListDetailModel(
      {String? title, RxBool? selected, bool? cardStatus, String? icon}) {
    if (title != null) {
      this._title = title;
    }
    if (selected != null) {
      this._selected = selected;
    }
    if (cardStatus != null) {
      this._cardStatus = cardStatus;
    }
    if (icon != null) {
      this._icon = icon;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  RxBool? get selected => _selected;
  set selected(RxBool? selected) => _selected = selected;
  bool? get cardStatus => _cardStatus;
  set cardStatus(bool? cardStatus) => _cardStatus = cardStatus;
  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;

  PaymentListDetailModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _selected = json['selected'];
    _cardStatus = json['cardStatus'];
    _icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['selected'] = this._selected;
    data['cardStatus'] = this._cardStatus;
    data['icon'] = this._icon;
    return data;
  }
}*/
