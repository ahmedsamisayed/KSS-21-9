class OrderItems {
  final name;
  final head;
  final bowels;
  final weight;
  final headPrice;
  final weightPrice;
  final bowelsPrice;
  final quantity;
  final totalPrice;

  OrderItems({required this.name, required this.head, required this.bowelsPrice,
  required this.headPrice, required this.bowels, required this.quantity,
    required this.totalPrice, required this.weight, required this.weightPrice
});

  Map toJson() => {
    'name': name,
    'head': headPrice,
    'bowels': bowels,
    'weight': weight,
    'headPrice': headPrice,
    'weightPrice': weightPrice,
    'bowelsPrice': bowelsPrice,
    'quantity': quantity,
    'totalPrice': totalPrice,

  };

}
