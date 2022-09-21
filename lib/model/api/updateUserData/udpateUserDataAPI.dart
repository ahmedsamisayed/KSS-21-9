import 'package:http/http.dart' as http;
import 'package:kss/model/api/appConstants.dart';

import 'dart:convert';
import 'package:kss/model/api/infos/infoResponseModule.dart';

Future updateUserData(String name, String email) async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.put(
    Uri.parse('${AppConstants.generalUrl}/me/update'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{'name': name, 'email': email}),
  );
  if (response.statusCode == 200) {
    return 'تم التعديل بنجاح';
  }
  // }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}
// Future<http.Response> updateUserData(String name, String email) {
//   return http.put(
//     Uri.parse('${AppConstants.generalUrl}/me/update'),
//     headers: <String, String>{
//       'Cookie': 'token=${AppConstants.userAccessToken}',
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'name': name, 'email': email
//     }),
//   );
// }