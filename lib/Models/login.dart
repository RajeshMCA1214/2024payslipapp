class LoginData {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String companyId;
  final String myRole;
  final String image;
  final String address;
  final String status;
  final int applied;
  final String myStatus;

  LoginData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.companyId,
    required this.myRole,
    required this.image,
    required this.address,
    required this.status,
    required this.applied,
    required this.myStatus,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      companyId: json['companyid'],
      myRole: json['myrole'],
      image: json['image'],
      address: json['address'],
      status: json['status'],
      applied: json['applied'],
      myStatus: json['mystatus'],
    );
  }
}

class LoginModule {
  final String status;
  final bool isSuccess;
  final String message;
  final LoginData data;
  final String token;

  LoginModule({
    required this.status,
    required this.isSuccess,
    required this.message,
    required this.data,
    required this.token,
  });

  factory LoginModule.fromJson(Map<String, dynamic> json) {
    return LoginModule(
      status: json['status'],
      isSuccess: json['is_success'],
      message: json['message'],
      data: LoginData.fromJson(json['data']),
      token: json['token'],
    );
  }
}
