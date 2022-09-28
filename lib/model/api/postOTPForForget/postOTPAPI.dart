import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../appConstants.dart';


Future PostOTP(String OTP, BuildContext context) async {

  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/password/otp'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': AppConstants.userPhoneForForgetPassword,
      'resetPasswordToken': OTP
    }),
  );
  if (response.statusCode == 200) {
    AppConstants.OTP = OTP;
    Navigator.of(context).pushNamed('New Pass Screen');
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
            content: Text('الاربع ارقام غير صحيحة')
        ));
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}