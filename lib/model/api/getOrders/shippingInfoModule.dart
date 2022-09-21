// class ShippingInfo {
//   final address;
//
//   ShippingInfo({required this.address
//   });
//   factory ShippingInfo.fromJson(dynamic json) {
//     return ShippingInfo(
//         address: json['address']
//     );
//   }
// }

import 'package:kss/model/api/getOrders/locationModule.dart';

class ShippingInfo {
  Location? location;
  String? address;
  String? phoneNo1;
  String? phoneNo2;
  String? sId;

  ShippingInfo(
      {this.location, this.address, this.phoneNo1, this.phoneNo2, this.sId});

  ShippingInfo.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    address = json['address'];
    phoneNo1 = json['phoneNo1'];
    phoneNo2 = json['phoneNo2'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['address'] = this.address;
    data['phoneNo1'] = this.phoneNo1;
    data['phoneNo2'] = this.phoneNo2;
    data['_id'] = this.sId;
    return data;
  }
}

