import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:kss/model/api/login/loginResponseModule.dart';

import '../../../core/widgets/snackbar_messenger.dart';
import '../appConstants.dart';



Future<LoginResponse> loginUser(String phone,String password, BuildContext context) async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': phone,
      'password': password
    }),
  );
  LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
     AppConstants.userAccessToken = loginResponse.token;
     AppConstants.userId = loginResponse.user!.sId;
     AppConstants.userPhone = loginResponse.user!.phone;
     AppConstants.userName = loginResponse.user!.name;
     AppConstants.userEmail = loginResponse.user!.email;

     if (loginResponse.user!.role == 'driver') {
       showScaffoldSnackBar('لا يمكنك الدخول بحساب سائق وانت مستخدم عادي ', context);
     }

     else {
       showScaffoldSnackBar('تم تسجيل الدخول بنجاح', context);
       Navigator.of(context).pushNamed('Home Navigation User Screen');
     }

    return loginResponse;
  }
  else if(response.statusCode == 400) {
    showScaffoldSnackBar('أدخل رقم المستخدم او الرقم السري', context);
    return loginResponse;
  }
  else if (response.statusCode == 401) {
    showScaffoldSnackBar('رقم المستخدم او الرقم السري غير صحيح', context);
    return loginResponse;
  }
  else {
    showScaffoldSnackBar('حدثت مشكلة الرجاء المحاولة مرة اخرى', context);
    return loginResponse;
  }
}