class PreRegisterModel {
  PreRegisterModel({
    Data? data,
  }) {
    _data = data;
  }

  PreRegisterModel.fromJson(dynamic json) {
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
    List<Preregisters>? preregisters,
  }) {
    _status = status;
    _message = message;
    _preregisters = preregisters;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['preregisters'] != null) {
      _preregisters = [];
      json['preregisters'].forEach((v) {
        _preregisters?.add(Preregisters.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<Preregisters>? _preregisters;

  num? get status => _status;
  List<Preregisters>? get preregisters => _preregisters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_preregisters != null) {
      map['preregisters'] = _preregisters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Preregisters {
  Preregisters({
    num? id,
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? nationalIdentificationNo,
    String? address,
    String? expectedDate,
    String? expectedTime,
    String? employeeName,
    dynamic employeeID,
    String? image,
    String? comment,
    String? status,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _gender = gender;
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

  Preregisters.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _gender = json['gender'];
    _nationalIdentificationNo = json['national_identification_no'];
    _address = json['address'];
    _expectedDate = json['expected_date'];
    _expectedTime = json['expected_time'];
    _employeeName = json['employee_name'];
    _employeeID = json['employeeID'];
    _image = json['image'];
    _comment = json['comment'];
    _status = json['status'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _gender;
  String? _nationalIdentificationNo;
  String? _address;
  String? _expectedDate;
  String? _expectedTime;
  String? _employeeName;
  dynamic _employeeID;
  String? _image;
  String? _comment;
  String? _status;

  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get gender => _gender;
  String? get nationalIdentificationNo => _nationalIdentificationNo;
  String? get address => _address;
  String? get expectedDate => _expectedDate;
  String? get expectedTime => _expectedTime;
  String? get employeeName => _employeeName;
  dynamic get employeeID => _employeeID;
  String? get image => _image;
  String? get comment => _comment;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['national_identification_no'] = _nationalIdentificationNo;
    map['address'] = _address;
    map['expected_date'] = _expectedDate;
    map['expected_time'] = _expectedTime;
    map['employee_name'] = _employeeName;
    map['employeeID'] = _employeeID;
    map['image'] = _image;
    map['comment'] = _comment;
    map['status'] = _status;
    return map;
  }
}
