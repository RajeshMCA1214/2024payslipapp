class VisitorListModel {
  VisitorListModel({
    Data? data,
  }) {
    _data = data;
  }

  VisitorListModel.fromJson(dynamic json) {
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
    List<Visitor>? visitor,
  }) {
    _status = status;
    _message = message;
    _visitor = visitor;
  }

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['visitor'] != null) {
      _visitor = [];
      json['visitor'].forEach((v) {
        _visitor?.add(Visitor.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<Visitor>? _visitor;

  int? get status => _status;
  String? get message => _message;
  List<Visitor>? get visitor => _visitor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_visitor != null) {
      map['visitor'] = _visitor?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Visitor {
  Visitor({
    int? id,
    String? regNo,
    String? name,
    String? image,
    int? status,
    String? statusName,
    int? visitorId,
    String? checkInAt,
    String? checkOutAt,
  }) {
    _id = id;
    _regNo = regNo;
    _name = name;
    _image = image;
    _status = status;
    _statusName = statusName;
    _visitorId = visitorId;
    _checkInAt = checkInAt;
    _checkOutAt = checkOutAt;
  }

  Visitor.fromJson(dynamic json) {
    _id = json['id'];
    _regNo = json['reg_no'];
    _name = json['name'];
    _image = json['image'];
    _status = int.parse(json['status'].toString());
    _statusName = json['status_name'];
    _visitorId = json['visitor_id'];
    _checkInAt = json['checkin_at'];
    _checkOutAt = json['checkout_at'];
  }
  int? _id;
  String? _regNo;
  String? _name;
  String? _image;
  int? _status;
  String? _statusName;
  int? _visitorId;
  String? _checkInAt;
  String? _checkOutAt;

  int? get id => _id;
  String? get regNo => _regNo;
  String? get name => _name;
  String? get image => _image;
  int? get status => _status;
  String? get statusName => _statusName;
  int? get visitorId => _visitorId;
  String? get checkInAt => _checkInAt;
  String? get checkOutAt => _checkOutAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reg_no'] = _regNo;
    map['name'] = _name;
    map['image'] = _image;
    map['status'] = _status;
    map['status_name'] = _statusName;
    map['visitor_id'] = _visitorId;
    map['checkin_at'] = _checkInAt;
    map['checkout_at'] = _checkOutAt;
    return map;
  }
}
