// import 'dart:convert';

// class PickupOrderResponse {
//   String? responseCode;
//   String? result;
//   String? responseMsg;
//   PickupOrderDetails? pickupOrderDetails;

//   PickupOrderResponse({
//     this.responseCode,
//     this.result,
//     this.responseMsg,
//     this.pickupOrderDetails,
//   });

//   /// ✅ Convert JSON to `PickupOrderResponse`
//   factory PickupOrderResponse.fromJson(Map<String, dynamic> json) {
//     print("📥 Parsing API JSON Response: $json"); // ✅ Debugging log

//     return PickupOrderResponse(
//       responseCode: json['ResponseCode'],
//       result: json['Result'],
//       responseMsg: json['ResponseMsg'],
//       pickupOrderDetails: json['OrderDetails'] != null
//           ? PickupOrderDetails.fromJson(json['OrderDetails'])
//           : null,
//     );
//   }

//   /// ✅ Convert `PickupOrderResponse` to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "ResponseCode": responseCode,
//       "Result": result,
//       "ResponseMsg": responseMsg,
//       "OrderDetails": pickupOrderDetails?.toJson(),
//     };
//   }
// }

// class PickupOrderDetails {
//   int? id;
//   String? orderQId;
//   int? customerId;
//   int? laundromatId;
//   String? orderTime;
//   String? orderDate;
//   String? orderType;
//   String? orderStatus;
//   int? driverAssignedId;
//   String? orderPrice;
//   String? weight;
//   String? deliveryMethod;
//   String? deliveryType;
//   String? orderInstructions;
//   String? orderAddress;
//   String? paymentStatus;
//   String? paymentType;
//   String? laundromatName;
//   String? customerName;
//   String? customerMobile;
//   List<ProductDetails>? productDetails;

//   PickupOrderDetails({
//     this.id,
//     this.orderQId,
//     this.customerId,
//     this.laundromatId,
//     this.orderTime,
//     this.orderDate,
//     this.orderType,
//     this.orderStatus,
//     this.driverAssignedId,
//     this.orderPrice,
//     this.weight,
//     this.deliveryMethod,
//     this.deliveryType,
//     this.orderInstructions,
//     this.orderAddress,
//     this.paymentStatus,
//     this.paymentType,
//     this.laundromatName,
//     this.customerName,
//     this.customerMobile,
//     this.productDetails,
//   });

//   /// ✅ Convert JSON to `PickupOrderDetails`
//   factory PickupOrderDetails.fromJson(Map<String, dynamic> json) {
//     return PickupOrderDetails(
//       id: json['id'],
//       orderQId: json['order_q_id'],
//       customerId: json['customer_id'],
//       laundromatId: json['laundromat_id'],
//       orderTime: json['order_time'],
//       orderDate: json['order_date'],
//       orderType: json['order_type'],
//       orderStatus: json['order_status'],
//       // driverAssignedId: json['assign_driver_id'],  // ✅ Correct field mapping
//       driverAssignedId: json['driver_assigned_id'],  // ✅ Fix: Matches API Response
//       orderPrice: json['order_price'],
//       weight: json['weight'],
//       deliveryMethod: json['delivery_method'],
//       deliveryType: json['delivery_type'],
//       orderInstructions: json['order_instructions'],
//       orderAddress: json['order_address'],
//       paymentStatus: json['payment_status'],
//       paymentType: json['payment_type'],
//       laundromatName: json['laundromat_name'],
//       customerName: json['customer_name'],
//       customerMobile: json['customer_mobile'],
//       productDetails: json['product_details'] != null
//           ? List<ProductDetails>.from(jsonDecode(json['product_details'])
//               .map((x) => ProductDetails.fromJson(x)))
//           : [],
//     );
//   }

//   /// ✅ Convert `PickupOrderDetails` to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "order_q_id": orderQId,
//       "customer_id": customerId,
//       "laundromat_id": laundromatId,
//       "order_time": orderTime,
//       "order_date": orderDate,
//       "order_type": orderType,
//       "order_status": orderStatus,
//       "driver_assigned_id": driverAssignedId,  // ✅ Fix: Consistent with API Response
//       "order_price": orderPrice,
//       "weight": weight,
//       "delivery_method": deliveryMethod,
//       "delivery_type": deliveryType,
//       "order_instructions": orderInstructions,
//       "order_address": orderAddress,
//       "payment_status": paymentStatus,
//       "payment_type": paymentType,
//       "laundromat_name": laundromatName,
//       "customer_name": customerName,
//       "customer_mobile": customerMobile,
//       "product_details": productDetails != null
//           ? jsonEncode(productDetails!.map((x) => x.toJson()).toList())
//           : null,
//     };
//   }
// }

// class ProductDetails {
//   String? productType;
//   int? variationId;
//   int? quantity;
//   int? price;

//   ProductDetails({
//     this.productType,
//     this.variationId,
//     this.quantity,
//     this.price,
//   });

//   /// ✅ Convert JSON to `ProductDetails`
//   factory ProductDetails.fromJson(Map<String, dynamic> json) {
//     return ProductDetails(
//       productType: json['product_type'],
//       variationId: json['variation_id'],
//       quantity: json['quantity'],
//       price: json['price'],
//     );
//   }

//   /// ✅ Convert `ProductDetails` to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "product_type": productType,
//       "variation_id": variationId,
//       "quantity": quantity,
//       "price": price,
//     };
//   }
// }

// class PickupCustomerDetails {
//   String? name;
//   String? mobile;

//   PickupCustomerDetails({this.name, this.mobile});

//   /// ✅ Convert JSON to `PickupCustomerDetails`
//   factory PickupCustomerDetails.fromJson(Map<String, dynamic> json) {
//     return PickupCustomerDetails(
//       name: json['name'],
//       mobile: json['mobile'],
//     );
//   }

//   /// ✅ Convert `PickupCustomerDetails` to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "mobile": mobile,
//     };
//   }
// }

// class PickupLaundromatDetails {
//   String? laundromatName;

//   PickupLaundromatDetails({this.laundromatName});

//   /// ✅ Convert JSON to `PickupLaundromatDetails`
//   factory PickupLaundromatDetails.fromJson(Map<String, dynamic> json) {
//     return PickupLaundromatDetails(
//       laundromatName: json['laundromat_name'],
//     );
//   }

//   /// ✅ Convert `PickupLaundromatDetails` to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "laundromat_name": laundromatName,
//     };
//   }
// }
//""""""""""
// import 'dart:convert';

// class PickupOrderResponse {
//   String? responseCode;
//   String? result;
//   String? responseMsg;
//   PickupOrderDetails? pickupOrderDetails;
//   PickupCustomerDetails? customerDetails;
//   PickupLaundromatDetails? laundromatDetails;

//   PickupOrderResponse({
//     this.responseCode,
//     this.result,
//     this.responseMsg,
//     this.pickupOrderDetails,
//     this.customerDetails,
//     this.laundromatDetails,
//   });

//   /// ✅ Convert JSON to `PickupOrderResponse`
//   factory PickupOrderResponse.fromJson(Map<String, dynamic> json) {
//     return PickupOrderResponse(
//       responseCode: json['ResponseCode'],
//       result: json['Result'],
//       responseMsg: json['ResponseMsg'],
//       pickupOrderDetails: json['OrderDetails'] != null
//           ? PickupOrderDetails.fromJson(json['OrderDetails'])
//           : null,
//       customerDetails: json['CustomerDetails'] != null
//           ? PickupCustomerDetails.fromJson(json['CustomerDetails'])
//           : null,
//       laundromatDetails: json['LaundromatDetails'] != null
//           ? PickupLaundromatDetails.fromJson(json['LaundromatDetails'])
//           : null,
//     );
//   }

//   /// ✅ Convert `PickupOrderResponse` to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "ResponseCode": responseCode,
//       "Result": result,
//       "ResponseMsg": responseMsg,
//       "OrderDetails": pickupOrderDetails?.toJson(),
//       "CustomerDetails": customerDetails?.toJson(),
//       "LaundromatDetails": laundromatDetails?.toJson(),
//     };
//   }
// }

// class PickupOrderDetails {
//   int? id;
//   String? orderQId;
//   int? customerId;
//   int? laundromatId;
//   String? orderTime;
//   String? orderDate;
//   String? orderType;
//   String? orderStatus;
//   int? driverAssignedId;
//   String? orderPrice;
//   String? receipt;
//   String? rating;
//   String? attachment;
//   String? deliveryCode;
//   String? productType;
//   String? createdAt;
//   String? totalBags;
//   String? weight;
//   String? pickupOrderTime;
//   String? deliveryMethod;
//   String? deliveryType;
//   String? orderInstructions;
//   String? orderAddress;
//   String? status;
//   String? payment;
//   String? orderTemp;
//   String? houseStatus;
//   String? aptNo;
//   String? elevatorStatus;
//   String? floor;
//   String? deliveryStatus;
//   String? helpStatus;
//   String? confirmOrderPic;
//   String? dueTo;
//   String? deliveryTime;
//   String? collectedAmount;
//   String? paymentStatus;
//   String? paymentType;
//   String? laundromatName;
//   String? customerName;
//   String? customerMobile;
//   List<ProductDetails>? productDetails;

//   PickupOrderDetails({
//     this.id,
//     this.orderQId,
//     this.customerId,
//     this.laundromatId,
//     this.orderTime,
//     this.orderDate,
//     this.orderType,
//     this.orderStatus,
//     this.driverAssignedId,
//     this.orderPrice,
//     this.receipt,
//     this.rating,
//     this.attachment,
//     this.deliveryCode,
//     this.productType,
//     this.createdAt,
//     this.totalBags,
//     this.weight,
//     this.pickupOrderTime,
//     this.deliveryMethod,
//     this.deliveryType,
//     this.orderInstructions,
//     this.orderAddress,
//     this.status,
//     this.payment,
//     this.orderTemp,
//     this.houseStatus,
//     this.aptNo,
//     this.elevatorStatus,
//     this.floor,
//     this.deliveryStatus,
//     this.helpStatus,
//     this.confirmOrderPic,
//     this.dueTo,
//     this.deliveryTime,
//     this.collectedAmount,
//     this.paymentStatus,
//     this.paymentType,
//     this.laundromatName,
//     this.customerName,
//     this.customerMobile,
//     this.productDetails,
//   });

//   /// ✅ Convert JSON to `PickupOrderDetails`
//   factory PickupOrderDetails.fromJson(Map<String, dynamic> json) {
//     return PickupOrderDetails(
//       id: json['id'],
//       orderQId: json['order_q_id'],
//       customerId: json['customer_id'],
//       laundromatId: json['laundromat_id'],
//       orderTime: json['order_time'],
//       orderDate: json['order_date'],
//       orderType: json['order_type'],
//       orderStatus: json['order_status'],
//       driverAssignedId: json['driver_assigned_id'],
//       orderPrice: json['order_price'],
//       receipt: json['receipt'],
//       rating: json['rating'],
//       attachment: json['attachment'],
//       deliveryCode: json['delivery_code'],
//       productType: json['product_type'],
//       createdAt: json['created_at'],
//       totalBags: json['total_bags'],
//       weight: json['weight'],
//       pickupOrderTime: json['pickup_order_time'],
//       deliveryMethod: json['delivery_method'],
//       deliveryType: json['delivery_type'],
//       orderInstructions: json['order_instructions'],
//       orderAddress: json['order_address'],
//       status: json['status'],
//       payment: json['payment'],
//       orderTemp: json['order_temp'],
//       houseStatus: json['house_status'],
//       aptNo: json['apt_no'],
//       elevatorStatus: json['elevator_status'],
//       floor: json['floor'],
//       deliveryStatus: json['delivery_status'],
//       helpStatus: json['help_status'],
//       confirmOrderPic: json['confirm_order_pic'],
//       dueTo: json['due_to'],
//       deliveryTime: json['delivery_time'],
//       collectedAmount: json['collected_amount'],
//       paymentStatus: json['payment_status'],
//       paymentType: json['payment_type'],
//       laundromatName: json['laundromat_name'],
//       customerName: json['customer_name'],
//       customerMobile: json['customer_mobile'],
//       productDetails: json['product_details'] != null
//           ? List<ProductDetails>.from(jsonDecode(json['product_details']).map((x) => ProductDetails.fromJson(x)))
//           : [],
//     );
//   }

//   /// ✅ Convert `PickupOrderDetails` to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "order_q_id": orderQId,
//       "customer_id": customerId,
//       "laundromat_id": laundromatId,
//       "order_time": orderTime,
//       "order_date": orderDate,
//       "order_type": orderType,
//       "order_status": orderStatus,
//       "driver_assigned_id": driverAssignedId,
//       "order_price": orderPrice,
//       "receipt": receipt,
//       "rating": rating,
//       "attachment": attachment,
//       "delivery_code": deliveryCode,
//       "product_type": productType,
//       "created_at": createdAt,
//       "total_bags": totalBags,
//       "weight": weight,
//       "pickup_order_time": pickupOrderTime,
//       "delivery_method": deliveryMethod,
//       "delivery_type": deliveryType,
//       "order_instructions": orderInstructions,
//       "order_address": orderAddress,
//       "status": status,
//       "payment": payment,
//       "order_temp": orderTemp,
//       "house_status": houseStatus,
//       "apt_no": aptNo,
//       "elevator_status": elevatorStatus,
//       "floor": floor,
//       "delivery_status": deliveryStatus,
//       "help_status": helpStatus,
//       "confirm_order_pic": confirmOrderPic,
//       "due_to": dueTo,
//       "delivery_time": deliveryTime,
//       "collected_amount": collectedAmount,
//       "payment_status": paymentStatus,
//       "payment_type": paymentType,
//       "laundromat_name": laundromatName,
//       "customer_name": customerName,
//       "customer_mobile": customerMobile,
//       "product_details": productDetails != null
//           ? jsonEncode(productDetails!.map((x) => x.toJson()).toList())
//           : null,
//     };
//   }
// }

// class ProductDetails {
//   String? productType;
//   int? variationId;
//   int? quantity;
//   int? price;

//   ProductDetails({this.productType, this.variationId, this.quantity, this.price});

//   factory ProductDetails.fromJson(Map<String, dynamic> json) {
//     return ProductDetails(
//       productType: json['product_type'],
//       variationId: json['variation_id'],
//       quantity: json['quantity'],
//       price: json['price'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "product_type": productType,
//       "variation_id": variationId,
//       "quantity": quantity,
//       "price": price,
//     };
//   }
// }
// class PickupCustomerDetails {
//   String? name;
//   String? mobile;

//   PickupCustomerDetails({this.name, this.mobile});

//   factory PickupCustomerDetails.fromJson(Map<String, dynamic> json) {
//     return PickupCustomerDetails(
//       name: json['name'],
//       mobile: json['mobile'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "mobile": mobile,
//     };
//   }
// }

// class PickupLaundromatDetails {
//   String? laundromatName;

//   PickupLaundromatDetails({this.laundromatName});

//   factory PickupLaundromatDetails.fromJson(Map<String, dynamic> json) {
//     return PickupLaundromatDetails(
//       laundromatName: json['laundromat_name'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "laundromat_name": laundromatName,
//     };
//   }
// }
//::::::::::::
// import 'dart:convert';

// class PickupOrderResponse {
//   String? responseCode;
//   String? result;
//   String? responseMsg;
//   PickupOrderDetails? pickupOrderDetails;
//   PickupCustomerDetails? customerDetails;
//   PickupLaundromatDetails? laundromatDetails;

//   PickupOrderResponse({
//     this.responseCode,
//     this.result,
//     this.responseMsg,
//     this.pickupOrderDetails,
//     this.customerDetails,
//     this.laundromatDetails,
//   });

//   factory PickupOrderResponse.fromJson(Map<String, dynamic> json) {
//     return PickupOrderResponse(
//       responseCode: json['ResponseCode'],
//       result: json['Result'],
//       responseMsg: json['ResponseMsg'],
//       pickupOrderDetails: json['OrderDetails'] != null
//           ? PickupOrderDetails.fromJson(json['OrderDetails'])
//           : null,
//       customerDetails: json['CustomerDetails'] != null
//           ? PickupCustomerDetails.fromJson(json['CustomerDetails'])
//           : null,
//       laundromatDetails: json['LaundromatDetails'] != null
//           ? PickupLaundromatDetails.fromJson(json['LaundromatDetails'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "ResponseCode": responseCode,
//       "Result": result,
//       "ResponseMsg": responseMsg,
//       "OrderDetails": pickupOrderDetails?.toJson(),
//       "CustomerDetails": customerDetails?.toJson(),
//       "LaundromatDetails": laundromatDetails?.toJson(),
//     };
//   }
// }

// class PickupOrderDetails {
//   int? id;
//   String? orderQId;
//   int? customerId;
//   int? laundromatId;
//   String? orderTime;
//   String? orderDate;
//   String? orderType;
//   String? orderStatus;
//   int? driverAssignedId;
//   String? orderPrice;
//   String? receipt;
//   String? rating;
//   String? attachment;
//   String? deliveryCode;
//   String? productType;
//   String? createdAt;
//   String? totalBags;
//   String? weight;
//   String? pickupOrderTime;
//   String? deliveryMethod;
//   String? deliveryType;
//   String? orderInstructions;
//   String? orderAddress;
//   String? status;
//   String? payment;
//   String? orderTemp;
//   String? houseStatus;
//   String? aptNo;
//   String? elevatorStatus;
//   String? floor;
//   String? deliveryStatus;
//   String? helpStatus;
//   String? confirmOrderPic;
//   String? dueTo;
//   String? deliveryTime;
//   String? collectedAmount;
//   String? paymentStatus;
//   String? paymentType;
//   String? laundromatName;
//   String? customerName;
//   String? customerMobile;
//   List<ProductDetails>? productDetails;

//   PickupOrderDetails({
//     this.id,
//     this.orderQId,
//     this.customerId,
//     this.laundromatId,
//     this.orderTime,
//     this.orderDate,
//     this.orderType,
//     this.orderStatus,
//     this.driverAssignedId,
//     this.orderPrice,
//     this.receipt,
//     this.rating,
//     this.attachment,
//     this.deliveryCode,
//     this.productType,
//     this.createdAt,
//     this.totalBags,
//     this.weight,
//     this.pickupOrderTime,
//     this.deliveryMethod,
//     this.deliveryType,
//     this.orderInstructions,
//     this.orderAddress,
//     this.status,
//     this.payment,
//     this.orderTemp,
//     this.houseStatus,
//     this.aptNo,
//     this.elevatorStatus,
//     this.floor,
//     this.deliveryStatus,
//     this.helpStatus,
//     this.confirmOrderPic,
//     this.dueTo,
//     this.deliveryTime,
//     this.collectedAmount,
//     this.paymentStatus,
//     this.paymentType,
//     this.laundromatName,
//     this.customerName,
//     this.customerMobile,
//     this.productDetails,
//   });

//   factory PickupOrderDetails.fromJson(Map<String, dynamic> json) {
//     final raw = json['product_details'];
//     List<ProductDetails> parsedProducts = [];

//     if (raw != null) {
//       try {
//         if (raw is String) {
//           final decoded = jsonDecode(raw);
//           if (decoded is List) {
//             parsedProducts = decoded.map<ProductDetails>((x) => ProductDetails.fromJson(x)).toList();
//           }
//         } else if (raw is List) {
//           parsedProducts = raw.map<ProductDetails>((x) => ProductDetails.fromJson(x)).toList();
//         }
//       } catch (e) {
//         print("❌ Error parsing product_details: $e");
//       }
//     }

//     return PickupOrderDetails(
//       id: json['id'],
//       orderQId: json['order_q_id'],
//       customerId: json['customer_id'],
//       laundromatId: json['laundromat_id'],
//       orderTime: json['order_time'],
//       orderDate: json['order_date'],
//       orderType: json['order_type'],
//       orderStatus: json['order_status'],
//       driverAssignedId: json['driver_assigned_id'],
//       orderPrice: json['order_price'],
//       receipt: json['receipt'],
//       rating: json['rating'],
//       attachment: json['attachment'],
//       deliveryCode: json['delivery_code'],
//       productType: json['product_type'],
//       createdAt: json['created_at'],
//       totalBags: json['total_bags'],
//       weight: json['weight'],
//       pickupOrderTime: json['pickup_order_time'],
//       deliveryMethod: json['delivery_method'],
//       deliveryType: json['delivery_type'],
//       orderInstructions: json['order_instructions'],
//       orderAddress: json['order_address'],
//       status: json['status'],
//       payment: json['payment'],
//       orderTemp: json['order_temp'],
//       houseStatus: json['house_status'],
//       aptNo: json['apt_no'],
//       elevatorStatus: json['elevator_status'],
//       floor: json['floor'],
//       deliveryStatus: json['delivery_status'],
//       helpStatus: json['help_status'],
//       confirmOrderPic: json['confirm_order_pic'],
//       dueTo: json['due_to'],
//       deliveryTime: json['delivery_time'],
//       collectedAmount: json['collected_amount'],
//       paymentStatus: json['payment_status'],
//       paymentType: json['payment_type'],
//       laundromatName: json['laundromat_name'],
//       customerName: json['customer_name'],
//       customerMobile: json['customer_mobile'],
//       productDetails: parsedProducts,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "order_q_id": orderQId,
//       "customer_id": customerId,
//       "laundromat_id": laundromatId,
//       "order_time": orderTime,
//       "order_date": orderDate,
//       "order_type": orderType,
//       "order_status": orderStatus,
//       "driver_assigned_id": driverAssignedId,
//       "order_price": orderPrice,
//       "receipt": receipt,
//       "rating": rating,
//       "attachment": attachment,
//       "delivery_code": deliveryCode,
//       "product_type": productType,
//       "created_at": createdAt,
//       "total_bags": totalBags,
//       "weight": weight,
//       "pickup_order_time": pickupOrderTime,
//       "delivery_method": deliveryMethod,
//       "delivery_type": deliveryType,
//       "order_instructions": orderInstructions,
//       "order_address": orderAddress,
//       "status": status,
//       "payment": payment,
//       "order_temp": orderTemp,
//       "house_status": houseStatus,
//       "apt_no": aptNo,
//       "elevator_status": elevatorStatus,
//       "floor": floor,
//       "delivery_status": deliveryStatus,
//       "help_status": helpStatus,
//       "confirm_order_pic": confirmOrderPic,
//       "due_to": dueTo,
//       "delivery_time": deliveryTime,
//       "collected_amount": collectedAmount,
//       "payment_status": paymentStatus,
//       "payment_type": paymentType,
//       "laundromat_name": laundromatName,
//       "customer_name": customerName,
//       "customer_mobile": customerMobile,
//       "product_details": productDetails?.map((x) => x.toJson()).toList(),
//     };
//   }
// }

// class ProductDetails {
//   String? productType;
//   int? variationId;
//   int? quantity;
//   int? price;

//   ProductDetails({this.productType, this.variationId, this.quantity, this.price});

//   factory ProductDetails.fromJson(Map<String, dynamic> json) {
//     return ProductDetails(
//       productType: json['product_type'],
//       variationId: json['variation_id'],
//       quantity: json['quantity'],
//       price: json['price'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "product_type": productType,
//       "variation_id": variationId,
//       "quantity": quantity,
//       "price": price,
//     };
//   }
// }

// class PickupCustomerDetails {
//   String? name;
//   String? mobile;

//   PickupCustomerDetails({this.name, this.mobile});

//   factory PickupCustomerDetails.fromJson(Map<String, dynamic> json) {
//     return PickupCustomerDetails(
//       name: json['name'],
//       mobile: json['mobile'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "mobile": mobile,
//     };
//   }
// }

// class PickupLaundromatDetails {
//   String? laundromatName;

//   PickupLaundromatDetails({this.laundromatName});

//   factory PickupLaundromatDetails.fromJson(Map<String, dynamic> json) {
//     return PickupLaundromatDetails(
//       laundromatName: json['laundromat_name'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "laundromat_name": laundromatName,
//     };
//   }
// }
///////////
import 'dart:convert';

class PickupOrderResponse {
  String? responseCode;
  String? result;
  String? responseMsg;
  PickupOrderDetails? pickupOrderDetails;
  PickupCustomerDetails? customerDetails;
  PickupLaundromatDetails? laundromatDetails;

  PickupOrderResponse({
    this.responseCode,
    this.result,
    this.responseMsg,
    this.pickupOrderDetails,
    this.customerDetails,
    this.laundromatDetails,
  });

  factory PickupOrderResponse.fromJson(Map<String, dynamic> json) {
    return PickupOrderResponse(
      responseCode: json['ResponseCode'],
      result: json['Result'],
      responseMsg: json['ResponseMsg'],
      pickupOrderDetails: json['OrderDetails'] != null
          ? PickupOrderDetails.fromJson(json['OrderDetails'])
          : null,
      customerDetails: json['CustomerDetails'] != null
          ? PickupCustomerDetails.fromJson(json['CustomerDetails'])
          : null,
      laundromatDetails: json['LaundromatDetails'] != null
          ? PickupLaundromatDetails.fromJson(json['LaundromatDetails'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ResponseCode": responseCode,
      "Result": result,
      "ResponseMsg": responseMsg,
      "OrderDetails": pickupOrderDetails?.toJson(),
      "CustomerDetails": customerDetails?.toJson(),
      "LaundromatDetails": laundromatDetails?.toJson(),
    };
  }
}

class PickupOrderDetails {
  int? id;
  String? orderQId;
  int? customerId;
  int? laundromatId;
  String? orderTime;
  String? orderDate;
  String? orderType;
  String? orderStatus;
  int? driverAssignedId;
  String? orderPrice;
  String? receipt;
  int? rating;
  String? attachment;
  String? deliveryCode;
  String? productType;
  String? createdAt;
  String? totalBags;
  String? weight;
  String? pickupOrderTime;
  String? deliveryMethod;
  String? deliveryType;
  String? deliveryCharges;
  String? orderInstructions;
  String? orderAddress;
  String? status;
  String? payment;
  List<String>? orderTemp;
  String? houseStatus;
  String? aptNo;
  String? elevatorStatus;
  String? floor;
  String? deliveryStatus;
  String? helpStatus;
  String? confirmOrderPic;
  String? dueTo;
  String? deliveryTime;
  String? collectedAmount;
  String? paymentStatus;
  String? paymentType;
  String? laundromatName;
  String? customerName;
  String? customerMobile;
  List<ProductDetails>? productDetails;

  PickupOrderDetails({
    this.id,
    this.orderQId,
    this.customerId,
    this.laundromatId,
    this.orderTime,
    this.orderDate,
    this.orderType,
    this.orderStatus,
    this.driverAssignedId,
    this.orderPrice,
    this.receipt,
    this.rating,
    this.attachment,
    this.deliveryCode,
    this.productType,
    this.createdAt,
    this.totalBags,
    this.weight,
    this.pickupOrderTime,
    this.deliveryMethod,
    this.deliveryType,
    this.orderInstructions,
    this.orderAddress,
    this.status,
    this.payment,
    this.orderTemp,
    this.houseStatus,
    this.aptNo,
    this.elevatorStatus,
    this.floor,
    this.deliveryStatus,
    this.deliveryCharges,
    this.helpStatus,
    this.confirmOrderPic,
    this.dueTo,
    this.deliveryTime,
    this.collectedAmount,
    this.paymentStatus,
    this.paymentType,
    this.laundromatName,
    this.customerName,
    this.customerMobile,
    this.productDetails,
  });

  factory PickupOrderDetails.fromJson(Map<String, dynamic> json) {
    // Helpers for safe parsing
    int? parseInt(dynamic val) {
      if (val == null) return null;
      if (val is int) return val;
      if (val is String) return int.tryParse(val);
      return null;
    }

    // Parse product_details field (which is a JSON-encoded string or List)
    List<ProductDetails> parseProducts(dynamic raw) {
      if (raw == null) return [];
      try {
        if (raw is String) {
          final decoded = jsonDecode(raw);
          if (decoded is List) {
            return decoded.map((x) => ProductDetails.fromJson(x)).toList();
          }
        } else if (raw is List) {
          return raw.map((x) => ProductDetails.fromJson(x)).toList();
        }
      } catch (e) {
        print('❌ Error parsing product_details: $e');
      }
      return [];
    }

    // Parse order_temp field (JSON-encoded List<String> or List<String>)
    List<String> parseOrderTemp(dynamic raw) {
      if (raw == null) return [];
      try {
        if (raw is String) {
          final decoded = jsonDecode(raw);
          if (decoded is List) {
            return List<String>.from(decoded);
          }
        } else if (raw is List) {
          return List<String>.from(raw);
        }
      } catch (e) {
        print('❌ Error parsing order_temp: $e');
      }
      return [];
    }

    return PickupOrderDetails(
      id: parseInt(json['id']),
      orderQId: json['order_q_id']?.toString(),
      customerId: parseInt(json['customer_id']),
      laundromatId: parseInt(json['laundromat_id']),
      orderTime: json['order_time'],
      orderDate: json['order_date'],
      orderType: json['order_type'],
      orderStatus: json['order_status'],
      driverAssignedId: parseInt(json['driver_assigned_id']),
      orderPrice: json['order_price']?.toString(),
      receipt: json['receipt'],
      rating: parseInt(json['rating']),
      attachment: json['attachment'],
      deliveryCode: json['delivery_code'],
      deliveryCharges: json['delivery_charges'],
      productType: json['product_type'],
      createdAt: json['created_at'],
      // totalBags: json['total_bags']?.toString(),
      totalBags: json['total_bags']?.toString() ?? '0', // always string, default '0'
      weight: json['weight']?.toString(),
      pickupOrderTime: json['pickup_order_time'],
      deliveryMethod: json['delivery_method'],
      deliveryType: json['delivery_type'],
      orderInstructions: json['order_instructions'],
      // orderAddress: json['order_address'],
      orderAddress: json['customer_address'] ?? json['order_address'] ?? 'N/A', // customer_address first
      status: json['status']?.toString(),
      payment: json['payment']?.toString(),
      orderTemp: parseOrderTemp(json['order_temp']),
      houseStatus: json['house_status'],
      aptNo: json['apt_no'],
      elevatorStatus: json['elevator_status']?.toString(),
      floor: json['floor'],
      deliveryStatus: json['delivery_status'],
      helpStatus: json['help_status'],
      confirmOrderPic: json['confirm_order_pic'],
      dueTo: json['due_to'],
      deliveryTime: json['delivery_time'],
      collectedAmount: json['amount_collected']?.toString(),
      paymentStatus: json['payment_status'],
      paymentType: json['payment_type'],
      laundromatName: json['laundromat_name'],
      customerName: json['customer_name'],
      customerMobile: json['customer_mobile'],
      productDetails: parseProducts(json['product_details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "order_q_id": orderQId,
      "customer_id": customerId,
      "laundromat_id": laundromatId,
      "order_time": orderTime,
      "order_date": orderDate,
      "order_type": orderType,
      "order_status": orderStatus,
      "driver_assigned_id": driverAssignedId,
      "order_price": orderPrice,
      "receipt": receipt,
      "rating": rating,
      "attachment": attachment,
      "delivery_code": deliveryCode,
      'delivery_charges': deliveryCharges,
      "product_type": productType,
      "created_at": createdAt,
      "total_bags": totalBags,
      "weight": weight,
      "pickup_order_time": pickupOrderTime,
      "delivery_method": deliveryMethod,
      "delivery_type": deliveryType,
      "order_instructions": orderInstructions,
      "order_address": orderAddress,
      "status": status,
      "payment": payment,
      "order_temp": jsonEncode(orderTemp ?? []),
      "house_status": houseStatus,
      "apt_no": aptNo,
      "elevator_status": elevatorStatus,
      "floor": floor,
      "delivery_status": deliveryStatus,
      "help_status": helpStatus,
      "confirm_order_pic": confirmOrderPic,
      "due_to": dueTo,
      "delivery_time": deliveryTime,
      "amount_collected": collectedAmount,
      "payment_status": paymentStatus,
      "payment_type": paymentType,
      "laundromat_name": laundromatName,
      "customer_name": customerName,
      "customer_mobile": customerMobile,
      "product_details": productDetails?.map((x) => x.toJson()).toList(),
    };
  }
}

class ProductDetails {
  String? productType;
  int? variationId;
  int? quantity;
  int? price;

  ProductDetails({this.productType, this.variationId, this.quantity, this.price});

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    int? parseInt(dynamic val) {
      if (val == null) return null;
      if (val is int) return val;
      if (val is String) return int.tryParse(val);
      return null;
    }

    return ProductDetails(
      productType: json['product_type']?.toString(),
      variationId: parseInt(json['variation_id']),
      quantity: parseInt(json['quantity']),
      price: parseInt(json['price']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_type": productType,
      "variation_id": variationId,
      "quantity": quantity,
      "price": price,
    };
  }
}

class PickupCustomerDetails {
  String? name;
  String? mobile;

  PickupCustomerDetails({this.name, this.mobile});

  factory PickupCustomerDetails.fromJson(Map<String, dynamic> json) {
    return PickupCustomerDetails(
      name: json['name'],
      mobile: json['mobile']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "mobile": mobile,
    };
  }
}

class PickupLaundromatDetails {
  String? laundromatName;

  PickupLaundromatDetails({this.laundromatName});

  factory PickupLaundromatDetails.fromJson(Map<String, dynamic> json) {
    return PickupLaundromatDetails(
      laundromatName: json['laundromat_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "laundromat_name": laundromatName,
    };
  }
}
