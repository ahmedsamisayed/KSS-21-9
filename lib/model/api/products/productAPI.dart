import 'package:http/http.dart'as http;
import 'package:kss/model/api/fullCowDetails.dart';
import 'dart:convert';
import 'package:kss/model/api/products/productResponse.dart';

import '../appConstants.dart';



Future<ProductResponse> getProduct() async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.get(
    Uri.parse('${AppConstants.generalUrl}/products'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
    },
  );
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';
    return ProductResponse.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}