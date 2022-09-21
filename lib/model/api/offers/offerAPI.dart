import 'package:http/http.dart'as http;
import 'package:kss/model/api/appConstants.dart';
import 'dart:convert';
import 'package:kss/model/api/offers/offerModule.dart';



Future<OffersResponse> getOffers() async {
  final response = await http.get(
    Uri.parse('${AppConstants.generalUrl}/offers'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
    },
    // ),
  );
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';
    return OffersResponse.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}
