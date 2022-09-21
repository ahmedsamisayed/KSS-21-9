import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../appConstants.dart';
import 'foregetModel.dart';



Future<ForgetPasswordResponse> ForgetPassword(String phone, BuildContext context) async {

  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/password/forgot'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': phone
    }),
  );
  if (response.statusCode == 200) {

    Navigator.of(context).pushNamed('OTP Screen');
    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
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
            content: Text('هذا الرقم غير مسجل')
        ));
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}