import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss/core/widgets/snackbar_messenger.dart';
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
    AppConstants.userPhoneForForgetPassword = phone;

    Navigator.of(context).pushNamed('OTP Screen');
    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
  }
  else {
    showScaffoldSnackBar('هذا الرقم غير مسجل', context);
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}
