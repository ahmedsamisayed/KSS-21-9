import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:kss/model/api/login/loginResponseModule.dart';

import '../appConstants.dart';



Future<LoginResponse> loginUser(String phone,String password) async {
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
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
  else if(response.statusCode == 400) {
    //registerResult.result = 'Registration Done successfully';
    //return RegisterResponse.fromJson(jsonDecode(response.body));
    throw Exception('أدخل رقم المستخدم او الرقم السري');
  }
  else if (response.statusCode == 401) {
    //registerResult.result = 'Registration Done successfully';
    // return RegisterResponse.fromJson(jsonDecode(response.body));
    throw Exception('رقم المستخدم او الرقم السري غير صحيح');
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}