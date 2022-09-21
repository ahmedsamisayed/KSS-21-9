class Product {
  final id;
  final name;
  final  headPrice;
  final  bowelPrice;
  final  smallPrice;
  final  smallWeight;
  final  mediumPrice;
  final  mediumWeight;
  final  largePrice;
  final  largeWeight;

  const Product({required this.id, required this.name, required this.headPrice, required  this.bowelPrice,
    required this.smallPrice, required this.smallWeight, required this.mediumPrice,
    required this.mediumWeight, required this.largePrice, required this.largeWeight
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      headPrice: json['headPrice'],
      bowelPrice: json['bowelsPrice'],
      smallPrice: json['smallPrice'],
      smallWeight: json['smallWeight'],
      mediumPrice: json['mediumPrice'],
      mediumWeight: json['mediumWeight'],
      largePrice: json['largPrice'],
      largeWeight: json['largWeight'],
    );
  }
}