import 'package:http/http.dart'as http;
import 'package:kss/model/api/fullCowDetails.dart';
import 'dart:convert';
import 'package:kss/model/api/products/productResponse.dart';

import '../appConstants.dart';
import 'logOutModule.dart';



Future<LogOutResponse> logOut() async {
  final response = await http.get(
    Uri.parse('${AppConstants.generalUrl}/logout'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
    },
  );
  if (response.statusCode == 200) {
    return LogOutResponse.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}