class VisitorDetailsModel {
  VisitorDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  VisitorDetailsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    num? status,
    String? message,
    VisitorDetails? visitorDetails,
  }) {
    _status = status;
    _message = message;
    _visitorDetails = visitorDetails;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _visitorDetails = json['visitor'] != null
        ? VisitorDetails.fromJson(json['visitor'])
        : null;
  }
  num? _status;
  String? _message;
  VisitorDetails? _visitorDetails;

  num? get status => _status;
  String? get message => _message;
  VisitorDetails? get visitorDetails => _visitorDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_visitorDetails != null) {
      map['visitor'] = _visitorDetails?.toJson();
    }
    return map;
  }
}

class VisitorDetails {
  VisitorDetails({
    String? name,
    String? email,
    String? regNo,
    String? phone,
    String? image,
    String? gender,
    String? genderName,
    String? companyName,
    String? nationalIdentificationNo,
    String? address,
    String? employee,
    String? purpose,
    String? date,
    String? checkinAt,
    String? checkoutAt,
    String? status,
    String? statusName,
  }) {
    _name = name;
    _email = email;
    _regNo = regNo;
    _phone = phone;
    _image = image;
    _gender = gender;
    _genderName = genderName;
    _companyName = companyName;
    _nationalIdentificationNo = nationalIdentificationNo;
    _address = address;
    _employee = employee;
    _purpose = purpose;
    _date = date;
    _checkinAt = checkinAt;
    _checkoutAt = checkoutAt;
    _status = status;
    _statusName = statusName;
  }

  VisitorDetails.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _regNo = json['reg_no'];
    _phone = json['phone'];
    _image = json['image'];
    _gender = json['gender'];
    _genderName = json['gender_name'];
    _companyName = json['company_name'];
    _nationalIdentificationNo = json['national_identification_no'];
    _address = json['address'];
    _employee = json['employee'];
    _purpose = json['purpose'];
    _date = json['date'];
    _checkinAt = json['checkin_at'];
    _checkoutAt = json['checkout_at'];
    _status = json['status'];
    _statusName = json['status_name'];
  }
  String? _name;
  String? _email;
  String? _regNo;
  String? _phone;
  String? _image;
  String? _gender;
  String? _genderName;
  String? _companyName;
  String? _nationalIdentificationNo;
  String? _address;
  String? _employee;
  String? _purpose;
  String? _date;
  String? _checkinAt;
  String? _checkoutAt;
  String? _status;
  String? _statusName;

  String? get name => _name;
  String? get email => _email;
  String? get regNo => _regNo;
  String? get phone => _phone;
  String? get image => _image;
  String? get gender => _gender;
  String? get genderName => _genderName;
  String? get companyName => _companyName;
  String? get nationalIdentificationNo => _nationalIdentificationNo;
  String? get address => _address;
  String? get employee => _employee;
  String? get purpose => _purpose;
  String? get date => _date;
  String? get checkinAt => _checkinAt;
  String? get checkoutAt => _checkoutAt;
  String? get status => _status;
  String? get statusName => _statusName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['reg_no'] = _regNo;
    map['phone'] = _phone;
    map['image'] = _image;
    map['gender'] = _gender;
    map['gender_name'] = _genderName;
    map['company_name'] = _companyName;
    map['national_identification_no'] = _nationalIdentificationNo;
    map['address'] = _address;
    map['employee'] = _employee;
    map['purpose'] = _purpose;
    map['date'] = _date;
    map['checkin_at'] = _checkinAt;
    map['checkout_at'] = _checkoutAt;
    map['status'] = _status;
    map['status_name'] = _statusName;
    return map;
  }
}
