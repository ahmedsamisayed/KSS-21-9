// // import 'package:kss/model/api/getOrders/shippingInfoModule.dart';
// // import 'package:kss/model/api/offers/infosModule.dart';
// // import 'package:kss/model/api/getOrders/orderItemsModule.dart';
// //
// // class Orders {
// //   ShippingInfo shippingInfo;
// //    var userId;
// //   List<OrderItems> orderItems;
// //    var orderStatus;
// //    var createdAt;
// //
// //    Orders({required this.shippingInfo, required this.userId, required this.orderItems,
// //    required this.orderStatus, required this.createdAt});
// //
// //   factory Orders.fromJson(Map<dynamic, dynamic> json) {
// //
// //     // ShippingInfo shippingInfot = ShippingInfo(address: 'address');
// //     Orders orders = Orders(shippingInfo: ShippingInfo(address: "address"), userId: '', orderItems: [],
// //       orderStatus: '',
// //     createdAt: '',
// // );
// //     for(var c in json['orderItems']){
// //       OrderItems temp = OrderItems.fromJson(c);
// //       orders.orderItems.add(temp);
// //     };
// //     orders.shippingInfo = ShippingInfo.fromJson(json['shippingInfo']);
// //     orders.userId = json['user'];
// //     orders.orderStatus = json['orderStatus'];
// //     orders.createdAt = json['createdAt'];
// //
// //     return orders;
// //     // return OfferResponse(
// //     //   success: json['success'],
// //     //   infos: Infos.fromJson(json['infos']),
// //     // );
// //   }
// // }
//
// import 'package:kss/model/api/getOrders/shippingInfoModule.dart';
//
// import '../postOrder/orderItemsModule.dart';
//
// class Orders {
//   String? sId;
//   List<ShippingInfo>? shippingInfo;
//   String? user;
//   List<OrderItems>? orderItems;
//   String? orderStatus;
//   String? createdAt;
//   int? iV;
//
//   Orders(
//       {this.sId,
//         this.shippingInfo,
//         this.user,
//         this.orderItems,
//         this.orderStatus,
//         this.createdAt,
//         this.iV});
//
//   Orders.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     if (json['shippingInfo'] != null) {
//       shippingInfo = <ShippingInfo>[];
//       json['shippingInfo'].forEach((v) {
//         shippingInfo!.add(new ShippingInfo.fromJson(v));
//       });
//     }
//     user = json['user'];
//     if (json['orderItems'] != null) {
//       orderItems = <OrderItems>[];
//       json['orderItems'].forEach((v) {
//         orderItems!.add(new OrderItems.fromJson(v));
//       });
//     }
//     orderStatus = json['orderStatus'];
//     createdAt = json['createdAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     if (this.shippingInfo != null) {
//       data['shippingInfo'] = this.shippingInfo!.map((v) => v.toJson()).toList();
//     }
//     data['user'] = this.user;
//     if (this.orderItems != null) {
//       data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
//     }
//     data['orderStatus'] = this.orderStatus;
//     data['createdAt'] = this.createdAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
