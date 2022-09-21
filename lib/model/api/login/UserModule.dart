class User {
  final id;
  final phone;

  const User({required this.id, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        phone: json['phone']
    );
  }
}