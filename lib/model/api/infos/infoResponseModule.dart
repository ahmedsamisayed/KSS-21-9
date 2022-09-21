import 'package:kss/model/api/infos/infosModule.dart';

// class OfferResponse {
//   var success;
//   List<Infos> infos;
//
//   OfferResponse({required this.success, required this.infos});
//
//   factory OfferResponse.fromJson(Map<dynamic, dynamic> json) {
//     OfferResponse offerResponse = OfferResponse(success: 'success', infos:[]);
//     for(var c in json['infos'] ){
//       Infos temp = Infos.fromJson(c);
//       offerResponse.infos.add(temp);
//     };
//     offerResponse.success = json['success'];
//     return offerResponse;
//   }
// }
class OfferResponse {
  bool? success;
  List<Infos>? infos;

  OfferResponse({this.success, this.infos});

  OfferResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['infos'] != null) {
      infos = <Infos>[];
      json['infos'].forEach((v) {
        infos!.add(new Infos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.infos != null) {
      data['infos'] = this.infos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Infos {
  String? sId;
  String? offer;
  int? kssPhone;
  String? kssEmail;
  int? bokNumber;
  int? iV;

  Infos(
      {this.sId,
        this.offer,
        this.kssPhone,
        this.kssEmail,
        this.bokNumber,
        this.iV});

  Infos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    offer = json['offer'];
    kssPhone = json['kssPhone'];
    kssEmail = json['kssEmail'];
    bokNumber = json['bokNumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['offer'] = this.offer;
    data['kssPhone'] = this.kssPhone;
    data['kssEmail'] = this.kssEmail;
    data['bokNumber'] = this.bokNumber;
    data['__v'] = this.iV;
    return data;
  }
}