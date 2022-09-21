import 'package:http/http.dart'as http;
import 'package:kss/model/api/appConstants.dart';
import 'dart:convert';
import 'package:kss/model/api/infos/infoResponseModule.dart';



Future<OfferResponse> getInfos() async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.get(
    Uri.parse('${AppConstants.generalUrl}/infos'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
    },
  // ),
  );
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';
    return OfferResponse.fromJson(jsonDecode(response.body));
  }
  // else if(response.statusCode == 400) {
  //   //registerResult.result = 'Registration Done successfully';
  //   //return RegisterResponse.fromJson(jsonDecode(response.body));
  //   throw Exception('أدخل رقم المستخدم او الرقم السري');
  // }
  // else if (response.statusCode == 401) {
  //   //registerResult.result = 'Registration Done successfully';
  //   // return RegisterResponse.fromJson(jsonDecode(response.body));
  //   throw Exception('رقم المستخدم او الرقم السري غير صحيح');
  // }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}