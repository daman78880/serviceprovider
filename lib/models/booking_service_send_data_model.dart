import 'dart:typed_data';

class BookingServiceSendDataModel {
  String serviceProviderServiceId;
  String livingRoom;
  String bedRoom;
  String bathRoom;

  String kitchen;

  String startTime;

  String date;

  String pinCodeForService;

  String landmark;

  String addressForService;

  List<String> coordinates;

  List<String> imagesList;

  List<Uint8List> imagesBitesList;

  List<String> imagesNameList;

  BookingServiceSendDataModel(
      {
        required this.serviceProviderServiceId,
      required this.livingRoom,
      required this.bedRoom,
      required this.bathRoom,
      required this.kitchen,
      required this.startTime,
      required this.date,
      required this.pinCodeForService,
      required this.landmark,
      required this.addressForService,
      required this.coordinates,
      required this.imagesList,
      required this.imagesBitesList,
      required this.imagesNameList});
}
