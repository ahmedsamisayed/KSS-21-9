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
  factory OrderItems.fromJson(Map<String, String> json) {
    return OrderItems(
     name: json['name'],
     head: json['head'],
     bowels: json['bowels'],
     weight: json['weight'],
     headPrice: json['headPrice'],
     weightPrice: json['weightPrice'],
     bowelsPrice: json['bowelsPrice'],
     quantity: json['quantity'],
     totalPrice: json['totalPrice']
    );
  }
}