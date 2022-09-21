class PostOrderResponse {
  final success;
  final order;

  const PostOrderResponse({required this.success, required this.order});

  factory PostOrderResponse.fromJson(Map<dynamic, dynamic> json) {
    return PostOrderResponse(
        success: json['success'],
        order: json['order']
    );
  }
}