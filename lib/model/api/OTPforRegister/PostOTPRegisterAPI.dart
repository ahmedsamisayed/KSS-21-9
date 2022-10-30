import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../../../core/widgets/snackbar_messenger.dart';
import '../appConstants.dart';


Future PostOTPForRegister(String OTP, BuildContext context) async {

  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/register/validation'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': AppConstants.currentRegisterNumberForOTP,
      'registerUserToken': OTP
    }),
  );
  if (response.statusCode == 200) {
    showScaffoldSnackBar('تم التسجيل بنجاح . قم بتسجيل الدخول .', context);
    Navigator.of(context).pushNamed('Login Screen');
  }
  else {
    showScaffoldSnackBar('الاربع ارقام غير صحيحة', context);
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}