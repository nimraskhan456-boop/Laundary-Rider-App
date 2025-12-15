class Order {
  final int orderId;
  final String status;
  final String pickupLocation;
  final String deliveryLocation;
  final String assignedDate;

  Order({
    required this.orderId,
    required this.status,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.assignedDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: int.parse(json['order_id']),
      status: json['status'],
      pickupLocation: json['pickup_location'],
      deliveryLocation: json['delivery_location'],
      assignedDate: json['assigned_date'],
    );
  }
}
