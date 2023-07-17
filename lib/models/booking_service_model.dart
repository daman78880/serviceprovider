class BookingServiceModel {
  int? _status;
  String? _message;
  Data? _data;

  BookingServiceModel({int? status, String? message, Data? data}) {
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

  BookingServiceModel.fromJson(Map<String, dynamic> json) {
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
  String? _customerServiceId;
  String? _serviceProviderServiceId;
  String? _customerId;
  String? _serviceProviderId;
  String? _bookingStatus;
  String? _amount;
  String? _promoCode;
  String? _sId;
  int? _iV;

  Data(
      {String? customerServiceId,
        String? serviceProviderServiceId,
        String? customerId,
        String? serviceProviderId,
        String? bookingStatus,
        String? amount,
        String? promoCode,
        String? sId,
        int? iV}) {
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
    if (sId != null) {
      this._sId = sId;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

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
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _customerServiceId = json['customerServiceId'];
    _serviceProviderServiceId = json['serviceProviderServiceId'];
    _customerId = json['customerId'];
    _serviceProviderId = json['serviceProviderId'];
    _bookingStatus = json['bookingStatus'];
    _amount = json['amount'];
    _promoCode = json['promoCode'];
    _sId = json['_id'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerServiceId'] = this._customerServiceId;
    data['serviceProviderServiceId'] = this._serviceProviderServiceId;
    data['customerId'] = this._customerId;
    data['serviceProviderId'] = this._serviceProviderId;
    data['bookingStatus'] = this._bookingStatus;
    data['amount'] = this._amount;
    data['promoCode'] = this._promoCode;
    data['_id'] = this._sId;
    data['__v'] = this._iV;
    return data;
  }
}
