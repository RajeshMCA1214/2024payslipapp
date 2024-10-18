class LoginModel {
  LoginModel({
      int? status, 
      String? message, 
      LoginData? data,
      String? token,}){
    _status = status;
    _message = message;
    _data = data;
    _token = token;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    _token = json['token'];
  }
  int? _status;
  String? _message;
  LoginData? _data;
  String? _token;

  int? get status => _status;
  String? get message => _message;
  LoginData? get data => _data;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

class LoginData {
  LoginData({
      int? id, 
      String? name, 
      String? email, 
      String? phone, 
      String? username, 
      dynamic image, 
      dynamic address, 
      int? status, 
      int? applied, 
      String? myrole, 
      String? mystatus,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _username = username;
    _image = image;
    _address = address;
    _status = status;
    _applied = applied;
    _myrole = myrole;
    _mystatus = mystatus;
}

  LoginData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _username = json['username'];
    _image = json['image'];
    _address = json['address'];
    _status = json['status'];
    _applied = json['applied'];
    _myrole = json['myrole'];
    _mystatus = json['mystatus'];
  }
  int? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _username;
  dynamic _image;
  dynamic _address;
  int? _status;
  int? _applied;
  String? _myrole;
  String? _mystatus;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get username => _username;
  dynamic get image => _image;
  dynamic get address => _address;
  int? get status => _status;
  int? get applied => _applied;
  String? get myrole => _myrole;
  String? get mystatus => _mystatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['username'] = _username;
    map['image'] = _image;
    map['address'] = _address;
    map['status'] = _status;
    map['applied'] = _applied;
    map['myrole'] = _myrole;
    map['mystatus'] = _mystatus;
    return map;
  }

}