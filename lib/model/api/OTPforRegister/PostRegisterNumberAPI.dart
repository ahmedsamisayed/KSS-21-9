import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../appConstants.dart';


Future PostPhoneForRegisterOTP(BuildContext context) async {

  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/register/otp'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': AppConstants.currentRegisterNumberForOTP
    }),
  );
  if (response.statusCode == 200) {
    //AppConstants.OTP = OTP;
    Navigator.of(context).pushNamed('OTP Screen Register');
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}