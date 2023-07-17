class BankDetailModel {
  String bankId;
  String bankName;
  int bankNumber;
  String ifceCode;
  bool lastViewLine;
  bool activeBankStatus;

  BankDetailModel({required this.bankId,required this.bankName,
    required this. bankNumber,
    required this. ifceCode,
    required this. lastViewLine,
    required this. activeBankStatus});
}


/*
class BankDetailModel {
  String? _bankName;
  int? _bankNumber;
  int? _ifceCode;
  bool? _lastViewLine;
  bool? _activeBankStatus;

  BankDetailModel(
      {String? bankName,
        int? bankNumber,
        int? ifceCode,
        bool? lastViewLine,
        bool? activeBankStatus}) {
    if (bankName != null) {
      this._bankName = bankName;
    }
    if (bankNumber != null) {
      this._bankNumber = bankNumber;
    }
    if (ifceCode != null) {
      this._ifceCode = ifceCode;
    }
    if (lastViewLine != null) {
      this._lastViewLine = lastViewLine;
    }
    if (activeBankStatus != null) {
      this._activeBankStatus = activeBankStatus;
    }
  }

  String? get bankName => _bankName;
  set bankName(String? bankName) => _bankName = bankName;
  int? get bankNumber => _bankNumber;
  set bankNumber(int? bankNumber) => _bankNumber = bankNumber;
  int? get ifceCode => _ifceCode;
  set ifceCode(int? ifceCode) => _ifceCode = ifceCode;
  bool? get lastViewLine => _lastViewLine;
  set lastViewLine(bool? lastViewLine) => _lastViewLine = lastViewLine;
  bool? get activeBankStatus => _activeBankStatus;
  set activeBankStatus(bool? activeBankStatus) =>
      _activeBankStatus = activeBankStatus;

  BankDetailModel.fromJson(Map<String, dynamic> json) {
    _bankName = json['bankName'];
    _bankNumber = json['bankNumber'];
    _ifceCode = json['ifceCode'];
    _lastViewLine = json['lastViewLine'];
    _activeBankStatus = json['activeBankStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankName'] = this._bankName;
    data['bankNumber'] = this._bankNumber;
    data['ifceCode'] = this._ifceCode;
    data['lastViewLine'] = this._lastViewLine;
    data['activeBankStatus'] = this._activeBankStatus;
    return data;
  }
}
*/
