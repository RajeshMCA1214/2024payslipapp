class ProfileModel {
  ProfileModel({
    Data? data,
  }) {
    _data = data;
  }

  ProfileModel.fromJson(dynamic json) {
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
    int? status,
    String? message,
    Profile? profile,
  }) {
    _status = status;
    _message = message;
    _profile = profile;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  int? _status;
  String? _message;
  Profile? _profile;

  int? get status => _status;
  String? get message => _message;
  Profile? get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    return map;
  }
}

class Profile {
  Profile({
    int? id,
    String? first_name,
    String? last_name,
    String? name,
    String? email,
    String? username,
    String? phone,
    String? address,
    String? department,
    String? image,
  }) {
    _id = id;
    _first_name = first_name;
    _last_name = last_name;
    _name = name;
    _email = email;
    _username = username;
    _phone = phone;
    _address = address;
    _department = department;
    _image = image;
  }

  Profile.fromJson(dynamic json) {
    _id = json['id'];
    _first_name = json['first_name'];
    _last_name = json['last_name'];
    _name = json['name'];
    _email = json['email'];
    _username = json['username'];
    _phone = json['phone'];
    _address = json['address'];
    _department = json['department'];
    _image = json['image'];
  }
  int? _id;
  String? _first_name;
  String? _last_name;
  String? _name;
  String? _email;
  String? _username;
  String? _phone;
  String? _address;
  String? _department;
  String? _image;

  int? get id => _id;
  String? get first_name => _first_name;
  String? get last_name => _last_name;
  String? get name => _name;
  String? get email => _email;
  String? get username => _username;
  String? get phone => _phone;
  String? get address => _address;
  String? get department => _department;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _first_name;
    map['last_name'] = _last_name;
    map['name'] = _name;
    map['email'] = _email;
    map['username'] = _username;
    map['phone'] = _phone;
    map['address'] = _address;
    map['department'] = _department;
    map['image'] = _image;
    return map;
  }
}
