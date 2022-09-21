
import 'package:kss/model/api/products/productModule.dart';

// class ProductResponse {
//   final success;
//   Product product;
//
//   ProductResponse({required this.success,
//     required this.product
//   });
//
//   factory ProductResponse.fromJson(Map<dynamic, dynamic> json) {
//     return ProductResponse(
//       success: json['success'],
//       product: Product.fromJson(json['product']),
//     );
//   }
// }

class ProductResponse {
  bool? success;
  int? productCount;
  List<Products>? products;

  ProductResponse({this.success, this.productCount, this.products});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    productCount = json['productCount'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['productCount'] = this.productCount;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  dynamic productImage;
  String? sId;
  String? name;
  int? headPrice;
  int? bowelsPrice;
  int? smallPrice;
  int? smallWeight;
  int? mediumPrice;
  int? mediumWeight;
  int? largPrice;
  int? largWeight;
  String? mainCategory;
  int? iV;

  Products(
      {this.productImage,
        this.sId,
        this.name,
        this.headPrice,
        this.bowelsPrice,
        this.smallPrice,
        this.smallWeight,
        this.mediumPrice,
        this.mediumWeight,
        this.largPrice,
        this.largWeight,
        this.mainCategory,
        this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'] != null
        ? new ProductImage.fromJson(json['productImage'])
        : null;
    sId = json['_id'];
    name = json['name'];
    headPrice = json['headPrice'];
    bowelsPrice = json['bowelsPrice'];
    smallPrice = json['smallPrice'];
    smallWeight = json['smallWeight'];
    mediumPrice = json['mediumPrice'];
    mediumWeight = json['mediumWeight'];
    largPrice = json['largPrice'];
    largWeight = json['largWeight'];
    mainCategory = json['mainCategory'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productImage != null) {
      data['productImage'] = this.productImage!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['headPrice'] = this.headPrice;
    data['bowelsPrice'] = this.bowelsPrice;
    data['smallPrice'] = this.smallPrice;
    data['smallWeight'] = this.smallWeight;
    data['mediumPrice'] = this.mediumPrice;
    data['mediumWeight'] = this.mediumWeight;
    data['largPrice'] = this.largPrice;
    data['largWeight'] = this.largWeight;
    data['mainCategory'] = this.mainCategory;
    data['__v'] = this.iV;
    return data;
  }
}

class ProductImage {
  dynamic data;

  ProductImage({this.data});

  ProductImage.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
}


