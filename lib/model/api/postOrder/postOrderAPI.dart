
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kss/model/api/postOrder/postOrderResponse.dart';
import 'package:http/http.dart'as http;
import 'package:kss/view/user/basket/widgets/basketlist.dart';
import 'package:kss/view/user/basket/widgets/suborder.dart';
import 'package:kss/view/user/order%20information/OrderData.dart';
import 'dart:convert';

import '../appConstants.dart';
import 'package:dio/dio.dart';


List<SubOrder> orderItems = MyListBasket.basketItems;
List<Map> orders = [];


// final data = {
//
//   'name': orderItems[0].bnameO,
//   'head': orderItems[0].bheadStatus,
//   'bowels': orderItems[0].bbowelStatus,
//   'weight': orderItems[0].bSelectedWeight,
//   'headPrice': orderItems[0].bheadPrice,
//   'weightPrice': orderItems[0].bpriceO,
//   'bowelsPrice': orderItems[0].bBowelsPrice,
//   'quantity': orderItems[0].bQuantity,
//   'totalPrice': orderItems[0].bpriceO,
// };



Future<PostOrderResponse> pstOrder() async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/order/new'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      "shippingInfo":
      {
        "address": OrderData.selectedItem,

        "phoneNo1": OrderData.phone,
        "phoneNo2": OrderData.alterPhone,

        "location": {
          "latitude": OrderData.positionDataLatitude,
          "longitude": OrderData.positionDataLongitude
        }
      },
      "user": AppConstants.userId,
      "orderItems": orderItems,
      //"bokImage": toJson(image)

    }
    ),
  );
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';
    return PostOrderResponse.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}
Future postMultipartData( Map<String, String> body, List<MultipartBody> multipartBody,) async {
  try {
    print('${body}');
    print('${multipartBody}');
    http.MultipartRequest _request = http.MultipartRequest('POST', Uri.parse('${AppConstants.generalUrl}/order/new'));
    _request.headers.addAll({
      'Cookie': 'token=${AppConstants.userAccessToken}',
      'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',});
    for(MultipartBody multipart in multipartBody) {
      if(multipart.file != null) {
        File _file = File(multipart.file.path);
        _request.files.add(http.MultipartFile(
          multipart.key, _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last,
        ));
      }
    }
    //_request.fields.addAll(body);
    _request.fields['shippingInfo[location][latitude]'] = OrderData.positionDataLatitude.toString() ;
    _request.fields['shippingInfo[location][longitude]'] = OrderData.positionDataLongitude.toString();
    _request.fields['shippingInfo[address]'] = OrderData.selectedItem;
    _request.fields['shippingInfo[phoneNo1]'] = OrderData.phone!;
    _request.fields['shippingInfo[phoneNo2]'] = OrderData.alterPhone!;
    _request.fields['user'] = AppConstants.userId!;
    _request.fields['orderItems'] = jsonEncode(orderItems);
    //_request.fields.addAll(obj);
    //for (SubOrder n in orderItems)  {
    //_request.files.add(http.MultipartFile.fromString('orderItems', n.bnameO
    // {
    // _request.fields['orderItems[name]'] = n.bnameO.toString(),
    // _request.fields['orderItems[head]'] = n.bheadStatus.toString(),
    // _request.fields['orderItems[bowels]'] = n.bbowelStatus.toString(),
    // _request.fields['orderItems[weight]'] = n.bSelectedWeight.toString(),
    // _request.fields['orderItems[headPrice]'] = n.bheadPrice.toString(),
    // _request.fields['orderItems[weightPrice]'] = n.bpriceO.toString(),
    // _request.fields['orderItems[bowelsPrice]'] = n.bBowelsPrice.toString(),
    // _request.fields['orderItems[quantity]'] = n.bQuantity.toString(),
    // _request.fields['orderItems[totalPrice]'] = n.bpriceO.toString(),
    // }.toString()
    //));
    //};
       //_request.fields['orderItems'] = ,

      // _request.fields['orderItems[name]'] = n.bnameO.toString(),
      // _request.fields['orderItems[head]'] = n.bheadStatus.toString(),
      // _request.fields['orderItems[bowels]'] = n.bbowelStatus.toString(),
      // _request.fields['orderItems[weight]'] = n.bSelectedWeight.toString(),
      // _request.fields['orderItems[headPrice]'] = n.bheadPrice.toString(),
      // _request.fields['orderItems[weightPrice]'] = n.bpriceO.toString(),
      // _request.fields['orderItems[bowelsPrice]'] = n.bBowelsPrice.toString(),
      // _request.fields['orderItems[quantity]'] = n.bQuantity.toString(),
      // _request.fields['orderItems[totalPrice]'] = n.bpriceO.toString(),
    // for (String item in orderItems) {
    //   _request.files.add(http.MultipartFile.fromString('manage_tag_model', item));
    // }
    http.Response _response = await http.Response.fromStream(await _request.send());
    return PostOrderResponse.fromJson(jsonDecode(_response.body));
  } catch (e) {
    print('error');
  }
}
Future postOrder(XFile data) async {
  Map<String, String> _body = Map();
  _body.addAll(<String, String>{
    // "shippingInfo":
    // {
    //   "address": OrderData.selectedItem,
    //
    //   "phoneNo1": OrderData.phone,
    //   "phoneNo2": OrderData.alterPhone,
    //
    //   "location": {
    //     "latitude": OrderData.positionDataLatitude,
    //     "longitude": OrderData.positionDataLongitude
    //   }
    // }.toString(),
    // "user": AppConstants.userId,
    //"orderItems": orderItems.toString(),

  });
  return await postMultipartData(_body, [MultipartBody('testImage', data)]);
}
class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
// jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
//   for (var key in data.keys) {
//     request.fields[key] = data[key].toString();
//   }
//   return request;
// }
Future postOrderAndImage(XFile file) async {
  var dio = Dio();
  orders.clear();
  orderItems.forEach((element) {
    orders.add(
      {

  'name': element.bnameO,
  'head': element.bheadStatus,
  'bowels': element.bbowelStatus,
  'weight': element.bSelectedWeight,
  'headPrice': element.bheadPrice,
  'weightPrice': element.bpriceO,
  'bowelsPrice': element.bBowelsPrice,
  'quantity': element.bQuantity,
  'totalPrice': element.bpriceO,
      }
    );
  });
  dio.options.headers['Cookie'] = 'token=${AppConstants.userAccessToken}';
  dio.options.headers['Content-Type'] = 'multipart/form-data; boundary=<calculated when request is sent>';
  String fileName = file.path.split('/').last;
  FormData formData = FormData.fromMap(
      {
    "shippingInfo":
    {
      "address": OrderData.selectedItem,

      "phoneNo1": OrderData.phone,
      "phoneNo2": OrderData.alterPhone,

      "location": {
        "latitude": OrderData.positionDataLatitude,
        "longitude": OrderData.positionDataLongitude
      }
    },
    "user": AppConstants.userId,
    "orderItems": orders,

    "testImage":
    await MultipartFile.fromFile(file.path, filename:fileName),
  }
  );
  var response = await dio.post("${AppConstants.generalUrl}/order/new", data: formData);
  return response.data;
  //return response.data['id'];
}

