class Infos {
  final id;
  final offer;

  const Infos({required this.id, required this.offer});

  factory Infos.fromJson(Map<dynamic, dynamic> json) {
    return Infos(
        id: json['_id'],
        offer: json['offer']
    );
  }
}