class RefreshTokenModel {
  RefreshTokenModel({
      Data? data,}){
    _data = data;
}

  RefreshTokenModel.fromJson(dynamic json) {
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
      bool? success, 
      String? token, 
      String? tokenType, 
      int? expiresIn,}){
    _success = success;
    _token = token;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
}

  Data.fromJson(dynamic json) {
    _success = json['success'];
    _token = json['token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
  }
  bool? _success;
  String? _token;
  String? _tokenType;
  int? _expiresIn;

  bool? get success => _success;
  String? get token => _token;
  String? get tokenType => _tokenType;
  int? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['token'] = _token;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    return map;
  }

}