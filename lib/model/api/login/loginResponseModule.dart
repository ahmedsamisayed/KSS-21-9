




import 'UserModule.dart';
//
// class LoginResponse {
//   final token;
//   User user;
//
//   LoginResponse({required this.token,
//     required this.user
//   });
//
//   factory LoginResponse.fromJson(Map<String, dynamic> json) {
//     return LoginResponse(
//         token: json['token'],
//         user: User.fromJson(json['user']),
//     );
//   }
// }
class LoginResponse {
  bool? success;
  String? token;
  User? user;

  LoginResponse({this.success, this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? phone;
  String? password;
  String? role;
  String? createdAt;
  int? iV;
  String? email;
  String? name;

  User(
      {this.sId,
        this.phone,
        this.password,
        this.role,
        this.createdAt,
        this.iV,
        this.email,
        this.name});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}
