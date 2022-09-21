



class Register {
  final bool success;
  final String errMessage;
  final String phone;
  final String password;
  final String confPassword;

  const Register(
      {required this.success,
        required this.phone,
        required this.password,
        required this.confPassword,
        required this.errMessage
      });

  }

  class RegisterResponse {
    final success;
    final errMessage;

    const RegisterResponse({required this.success, required this.errMessage});

    factory RegisterResponse.fromJson(Map<dynamic, dynamic> json) {
      return RegisterResponse(
          success: json['success'],
          errMessage: json['errMessage']
      );
    }
  }

