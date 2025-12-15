class EarningData {
  final String driverName;
  final double totalEarnings;
  final String totalBags;
  final String orderTime;
  final String weights;

  EarningData({
    required this.driverName,
    required this.totalEarnings,
    required this.totalBags,
    required this.orderTime,
    required this.weights,
  });

  factory EarningData.fromJson(Map<String, dynamic> json) {
    return EarningData(
      driverName: json['driver_name'] ?? '',
      totalEarnings: (json['total_earnings'] as num).toDouble(),
      totalBags: json['total_bags'] ?? 'N/A',
      orderTime: json['order_time'] ?? '',
      weights: json['weights'] ?? '',
    );
  }
}
