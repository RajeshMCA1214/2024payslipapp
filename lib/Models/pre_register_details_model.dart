class PreRegisterDetails {
  PreRegisterDetails({
    Data? data,
  }) {
    _data = data;
  }

  PreRegisterDetails.fromJson(dynamic json) {
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
    PreVisitor? visitor,
  }) {
    _status = status;
    _message = message;
    _visitor = visitor;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _visitor =
        json['visitor'] != null ? PreVisitor.fromJson(json['visitor']) : null;
  }
  num? _status;
  String? _message;
  PreVisitor? _visitor;

  num? get status => _status;
  String? get message => _message;
  PreVisitor? get visitor => _visitor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_visitor != null) {
      map['visitor'] = _visitor?.toJson();
    }
    return map;
  }
}

class PreVisitor {
  PreVisitor({
    num? id,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? gender,
    String? genderId,
    String? nationalIdentificationNo,
    String? address,
    String? expectedDate,
    String? expectedTime,
    String? employeeName,
    dynamic employeeID,
    String? image,
    String? comment,
    String? status,
    String? rawExpectedDate,
    String? rawExpectedTime,
  }) {
    _id = id;
    _name = name;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _gender = gender;
    _genderId = genderId;
    _nationalIdentificationNo = nationalIdentificationNo;
    _address = address;
    _expectedDate = expectedDate;
    _expectedTime = expectedTime;
    _employeeName = employeeName;
    _employeeID = employeeID;
    _image = image;
    _comment = comment;
    _status = status;
  }

  PreVisitor.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _gender = json['gender'];
    _genderId = json['gender_id'];
    _nationalIdentificationNo = json['national_identification_no'];
    _address = json['address'];
    _expectedDate = json['expected_date'];
    _expectedTime = json['expected_time'];
    _employeeName = json['employee_name'];
    _employeeID = json['employeeID'];
    _image = json['image'];
    _comment = json['comment'];
    _status = json['status'];
    _rawExpectedDate = json['raw_expected_date'];
    _rawExpectedTime = json['raw_expected_time'];
  }
  num? _id;
  String? _name;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _gender;
  String? _genderId;
  String? _nationalIdentificationNo;
  String? _address;
  String? _expectedDate;
  String? _expectedTime;
  String? _rawExpectedDate;
  String? _rawExpectedTime;
  String? _employeeName;
  dynamic _employeeID;
  String? _image;
  String? _comment;
  String? _status;

  num? get id => _id;
  String? get name => _name;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get gender => _gender;
  String? get genderId => _genderId;
  String? get nationalIdentificationNo => _nationalIdentificationNo;
  String? get address => _address;
  String? get expectedDate => _expectedDate;
  String? get expectedTime => _expectedTime;
  String? get employeeName => _employeeName;
  dynamic get employeeID => _employeeID;
  String? get image => _image;
  String? get comment => _comment;
  String? get status => _status;
  String? get rawExpectedDate => _rawExpectedDate;
  String? get rawExpectedTime => _rawExpectedTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['gender_id'] = _genderId;
    map['national_identification_no'] = _nationalIdentificationNo;
    map['address'] = _address;
    map['expected_date'] = _expectedDate;
    map['expected_time'] = _expectedTime;
    map['employee_name'] = _employeeName;
    map['employeeID'] = _employeeID;
    map['image'] = _image;
    map['comment'] = _comment;
    map['status'] = _status;
    map['raw_expected_date'] = _rawExpectedDate;
    map['raw_expected_time'] = _rawExpectedTime;
    return map;
  }
}
