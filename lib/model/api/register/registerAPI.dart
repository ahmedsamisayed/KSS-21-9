//import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../core/widgets/snackbar_messenger.dart';
import '../appConstants.dart';
import 'registerModule.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';



Future<RegisterResponse> registerUser(String phone,String password, String confPassword, BuildContext context) async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/register'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': phone,
      'password': password,
      'confPassword': confPassword
    }),
  );
  if (response.statusCode == 200) {
    showScaffoldSnackBar('تم التسجيل بنجاح . قم بتسجيل الدخول .', context);
    Navigator.of(context).pushNamed('OTP Screen Register');
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }
  else if(response.statusCode == 401) {
    showScaffoldSnackBar('لم تتوافق كلمة السر', context);
    return RegisterResponse.fromJson(jsonDecode(response.body));
    //throw Exception('لم تتوافق كلمة السر');
  } else if (response.statusCode == 500) {
    showScaffoldSnackBar('لم تقم بادخال الخانات المطلوبة او انك قد قمت بالتسجيل مسبقا', context);
    return RegisterResponse.fromJson(jsonDecode(response.body));
    //registerResult.result = 'Registration Done successfully';
    // return RegisterResponse.fromJson(jsonDecode(response.body));
    //throw Exception('لم تقم بادخال الخانات المطلوبة او انك قد قمت بالتسجيل مسبقا');
  } else {
    showScaffoldSnackBar('حدثت مشكلة الرجاء المحاولة مرة اخرى', context);
    return RegisterResponse.fromJson(jsonDecode(response.body));
    //throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}

  //} on FormatException {
  //  registerResult.result = "Problem parsing data from the server";
  //} on SocketException {

  //  registerResult.result = "Can't connect to internet";
  //} catch (ex) {
  //     registerResult.result = ex.toString();
  //}

  //return registerResult;




  // if (response.statusCode == 200) {
  //   // If the server did return a 201 CREATED response,
  //   // then parse the JSON.
  //
  //   //return RegisterResponse.fromJson(jsonDecode(response.body));
  //   return ('Registration Done successfully');
  // } else if (response.statusCode == 500) {
  //   return ('Please Enter Your number');
  //   // If the server did not return a 201 CREATED response,
  //   // then throw an exception.
  //   //throw Exception('${response.body}');
  // } else if(response.statusCode == 401) {
  //   return ('Password did not match');
  // }
  // else {
  //   throw Exception('Error happened, please try again');
  // }
