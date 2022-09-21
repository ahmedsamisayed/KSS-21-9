
class OffersResponse {
  bool? success;
  List<Offers>? offers;

  OffersResponse({this.success, this.offers});

  OffersResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  String? sId;
  String? off;
  int? iV;

  Offers({this.sId, this.off, this.iV});

  Offers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    off = json['off'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['off'] = this.off;
    data['__v'] = this.iV;
    return data;
  }
}