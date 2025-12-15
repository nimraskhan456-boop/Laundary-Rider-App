import 'dart:convert';
class Orders {
  int orderId;
  int laundryId;
  String orderType;
  String orderTime;
  String orderStatus;
  String orderPrice;
  String totalBags;
  String weight;
  String createdAt;
  String platformPrice;
  String? receipt;
  int totalPrice;
  int driverAssignedId;
  String deliveryInstructions;
  String deliveryStatus;
  String paymentStatus;
  String? paymentType;
  double amount_collected;
  int totalAmount;
  List<Products> products;
  Customer customer;
  LaundromatDetails laundromatDetails;

  Orders({
    this.orderId = 0,
    this.laundryId = 0,
    this.orderType = '',
    this.orderTime = '',
    this.orderStatus = '',
    this.orderPrice = '',
    this.totalBags = '',
    this.weight = '',
    this.createdAt = '',
    this.platformPrice = '',
    this.receipt,
    this.totalPrice = 0,
    this.amount_collected = 0.0,
    this.driverAssignedId = 0,
    this.deliveryInstructions = '',
    this.deliveryStatus = '',
    this.paymentStatus = '',
    this.paymentType,
    this.totalAmount = 0,
    this.products = const [],
    required this.customer,
    required this.laundromatDetails,
  });

  Orders.fromJson(Map<String, dynamic> json)
      : orderId = int.tryParse(json['order_id'].toString()) ?? 0,
        laundryId = int.tryParse(json['laundry_id'].toString()) ?? 0,
        orderType = json['order_type']?.toString() ?? '',
        orderTime = json['order_time']?.toString() ?? '',
        orderStatus = json['order_status']?.toString() ?? '',
        orderPrice = json['order_price']?.toString() ?? '',
        totalBags = json['total_bags']?.toString() ?? '',
        weight = json['weight']?.toString() ?? '',
        createdAt = json['created_at']?.toString() ?? '',
        platformPrice = json['platform_price']?.toString() ?? '',
        receipt = json['receipt']?.toString(),
        totalPrice = int.tryParse(json['total_price'].toString()) ?? 0,
        amount_collected = double.tryParse(json['amount_collected'].toString()) ?? 0.0,
        driverAssignedId = int.tryParse(json['driver_assigned_id'].toString()) ?? 0,
        deliveryInstructions = json['delivery_instructions']?.toString() ?? '',
        deliveryStatus = json['delivery_status']?.toString() ?? '',
        paymentStatus = json['payment_status']?.toString() ?? '',
        paymentType = json['payment_type']?.toString(),
        totalAmount = int.tryParse(json['total_amount'].toString()) ?? 0,
        products = (json['products'] as List?)?.map((v) => Products.fromJson(v)).toList() ?? [],
        customer = json['customer'] != null ? Customer.fromJson(json['customer']) : Customer(),
        laundromatDetails = json['laundromat_details'] != null ? LaundromatDetails.fromJson(json['laundromat_details']) : LaundromatDetails();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['laundry_id'] = laundryId;
    data['order_type'] = orderType;
    data['order_time'] = orderTime;
    data['order_status'] = orderStatus;
    data['order_price'] = orderPrice;
    data['total_bags'] = totalBags;
    data['weight'] = weight;
    data['created_at'] = createdAt;
    data['platform_price'] = platformPrice;
    data['receipt'] = receipt;
    data['total_price'] = totalPrice;
    data['amount_collected'] = amount_collected;
    data['driver_assigned_id'] = driverAssignedId;
    data['delivery_instructions'] = deliveryInstructions;
    data['delivery_status'] = deliveryStatus;
    data['payment_status'] = paymentStatus;
    data['payment_type'] = paymentType;
    data['total_amount'] = totalAmount;
    if (products.isNotEmpty) {
      data['products'] = products.map((v) => v.toJson()).toList();
    }
    data['customer'] = customer.toJson();
    data['laundromat_details'] = laundromatDetails.toJson();
    return data;
  }
}

class Products {
  String? productName;
  String? variationName;
  int? quantity;
  int? price;

  Products({this.productName, this.variationName, this.quantity, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    productName = json['product_name']?.toString();
    variationName = json['variation_name']?.toString();
    quantity = int.tryParse(json['quantity'].toString());
    price = int.tryParse(json['price'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['variation_name'] = variationName;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}

class Customer {
  int? userId;
  String? name;
  String? email;
  String? mobile;
  String? address;

  Customer({this.userId, this.name, this.email, this.mobile, this.address});

  Customer.fromJson(Map<String, dynamic> json) {
    userId = int.tryParse(json['user_id'].toString());
    name = json['name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    address = json['address']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    return data;
  }
}

class LaundromatDetails {
  String? name;
  String? city;
  String? state;
  String? zipCode;
  String? storePrice;
  String? deliveryCharges;

  LaundromatDetails({
    this.name,
    this.city,
    this.state,
    this.zipCode,
    this.storePrice,
    this.deliveryCharges,
  });

  LaundromatDetails.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    city = json['city']?.toString();
    state = json['state']?.toString();
    zipCode = json['zip_code']?.toString();
    storePrice = json['store_price']?.toString();
    deliveryCharges = json['delivery_charges']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['store_price'] = storePrice;
    data['delivery_charges'] = deliveryCharges;
    return data;
  }
}
