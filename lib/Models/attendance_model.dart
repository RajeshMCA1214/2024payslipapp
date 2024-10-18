class AttendanceModel {
  AttendanceModel({
      AttendanceData? data,}){
    _data = data;
}

  AttendanceModel.fromJson(dynamic json) {
    _data = json['data'] != null ? AttendanceData.fromJson(json['data']) : null;
  }
  AttendanceData? _data;

  AttendanceData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class AttendanceData {
  AttendanceData({
      int? status, 
      String? currentTime, 
      String? currentDate,
    Attendance? attendance,
      Employee? employee, 
      bool? showClockin,}){
    _status = status;
    _currentTime = currentTime;
    _currentDate = currentDate;
    _attendance = attendance;
    _employee = employee;
    _showClockin = showClockin;
}

  AttendanceData.fromJson(dynamic json) {
    _status = json['status'];
    _currentTime = json['current_time'];
    _currentDate = json['current_date'];
    _attendance = json['attendance'] != null ? Attendance.fromJson(json['attendance']) : null;
    _employee = json['employee'] != null ? Employee.fromJson(json['employee']) : null;
    _showClockin = json['show_clockin'];
  }
  int? _status;
  String? _currentTime;
  String? _currentDate;
  Attendance? _attendance;
  Employee? _employee;
  bool? _showClockin;

  int? get status => _status;
  String? get currentTime => _currentTime;
  String? get currentDate => _currentDate;
  Attendance? get attendance => _attendance;
  Employee? get employee => _employee;
  bool? get showClockin => _showClockin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['current_time'] = _currentTime;
    map['current_date'] = _currentDate;
    map['attendance'] = _attendance;
    if (_attendance != null) {
      map['attendance'] = _attendance?.toJson();
    }
    if (_employee != null) {
      map['employee'] = _employee?.toJson();
    }
    map['show_clockin'] = _showClockin;
    return map;
  }

}
class Attendance {
  Attendance({
    int? id,
    String? title,
    String? date,
    String? checkinTime,
    dynamic checkoutTime,
    String? userId,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _title = title;
    _date = date;
    _checkinTime = checkinTime;
    _checkoutTime = checkoutTime;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Attendance.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _date = json['date'];
    _checkinTime = json['checkin_time'];
    _checkoutTime = json['checkout_time'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _title;
  String? _date;
  String? _checkinTime;
  dynamic _checkoutTime;
  String? _userId;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get title => _title;
  String? get date => _date;
  String? get checkinTime => _checkinTime;
  dynamic get checkoutTime => _checkoutTime;
  String? get userId => _userId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['date'] = _date;
    map['checkin_time'] = _checkinTime;
    map['checkout_time'] = _checkoutTime;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Employee {
  Employee({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? name, 
      String? email, 
      String? phone, 
      dynamic nationalIdentificationNo, 
      String? gender, 
      dynamic address, 
      String? image, 
      String? status,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _name = name;
    _email = email;
    _phone = phone;
    _nationalIdentificationNo = nationalIdentificationNo;
    _gender = gender;
    _address = address;
    _image = image;
    _status = status;
}

  Employee.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _nationalIdentificationNo = json['national_identification_no'];
    _gender = json['gender'];
    _address = json['address'];
    _image = json['image'];
    _status = json['status'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _name;
  String? _email;
  String? _phone;
  dynamic _nationalIdentificationNo;
  String? _gender;
  dynamic _address;
  String? _image;
  String? _status;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get nationalIdentificationNo => _nationalIdentificationNo;
  String? get gender => _gender;
  dynamic get address => _address;
  String? get image => _image;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['national_identification_no'] = _nationalIdentificationNo;
    map['gender'] = _gender;
    map['address'] = _address;
    map['image'] = _image;
    map['status'] = _status;
    return map;
  }

}