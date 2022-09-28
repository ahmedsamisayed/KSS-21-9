import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss/model/api/postForgetPassword/postForgetPasswordResponse.dart';
import 'dart:convert';
import '../appConstants.dart';

ResetPasswordResponse resetResponse = ResetPasswordResponse();


Future PostOTP(String newPassword, String confNewPassword, BuildContext context) async {

  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/password/reset'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': AppConstants.userPhoneForForgetPassword,
      'resetPasswordToken': AppConstants.OTP,
      'password': newPassword,
      'confirmPassword': confNewPassword
    }),
  );
  resetResponse = ResetPasswordResponse.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Color(0xffd0c9c0),
            margin: const EdgeInsets.all(100.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Text('تم تعديل كلمة المرور بنجاح')
        ));

    Navigator.of(context).pushNamed('Login Screen');
  }
  else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Color(0xffd0c9c0),
            margin: const EdgeInsets.all(100.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Text('${resetResponse.message}')
        ));
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}