class UpcomingBookingModel {
  String imageUrl;
  String name;
  String specialty;
  String distance;
  String time;
  String date;
  String address;
  int money;
  int buttonShowStatus;

  UpcomingBookingModel({required String this.imageUrl,
    required  this.name,
    required  this.specialty,
    required  this.distance,
    required  this.time,
    required  this.date,
    required   this.address,
    required    this.money,
  this.buttonShowStatus=2});
}
// class UpcomingBookingModel {
//   String? _imageUrl;
//   String? _name;
//   String? _specialty;
//   String? _distance;
//   String? _time;
//   String? _date;
//   String? _address;
//   int? _money;
//
//   UpcomingBookingModel(
//       {String? imageUrl,
//         String? name,
//         String? specialty,
//         String? distance,
//         String? time,
//         String? date,
//         String? address,
//         int? money}) {
//     if (imageUrl != null) {
//       this._imageUrl = imageUrl;
//     }
//     if (name != null) {
//       this._name = name;
//     }
//     if (specialty != null) {
//       this._specialty = specialty;
//     }
//     if (distance != null) {
//       this._distance = distance;
//     }
//     if (time != null) {
//       this._time = time;
//     }
//     if (date != null) {
//       this._date = date;
//     }
//     if (address != null) {
//       this._address = address;
//     }
//     if (money != null) {
//       this._money = money;
//     }
//   }
//
//   String? get imageUrl => _imageUrl;
//   set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
//   String? get name => _name;
//   set name(String? name) => _name = name;
//   String? get specialty => _specialty;
//   set specialty(String? specialty) => _specialty = specialty;
//   String? get distance => _distance;
//   set distance(String? distance) => _distance = distance;
//   String? get time => _time;
//   set time(String? time) => _time = time;
//   String? get date => _date;
//   set date(String? date) => _date = date;
//   String? get address => _address;
//   set address(String? address) => _address = address;
//   int? get money => _money;
//   set money(int? money) => _money = money;
//
//   UpcomingBookingModel.fromJson(Map<String, dynamic> json) {
//     _imageUrl = json['image_url'];
//     _name = json['name'];
//     _specialty = json['specialty'];
//     _distance = json['distance'];
//     _time = json['time'];
//     _date = json['date'];
//     _address = json['address'];
//     _money = json['money'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['image_url'] = this._imageUrl;
//     data['name'] = this._name;
//     data['specialty'] = this._specialty;
//     data['distance'] = this._distance;
//     data['time'] = this._time;
//     data['date'] = this._date;
//     data['address'] = this._address;
//     data['money'] = this._money;
//     return data;
//   }
// }
