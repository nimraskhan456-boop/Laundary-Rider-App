
// // // // // import 'package:deliveryboy/Api/api_service.dart';

// // // // // import 'package:get/get.dart';


// // // // // class OrderDetailsController extends GetxController {
// // // // //   final ApiService _apiService = ApiService();
// // // // //   var isLoading = false.obs;
// // // // //   var orderDetails;

// // // // //   Future<void> getOrderDetails({required String orderID, required String token}) async {
// // // // //     try {
// // // // //       isLoading.value = true;
// // // // //       var response = await _apiService.getOrderDetails(orderID: orderID, token: token);

// // // // //       if (response.statusCode == 200 && response.data["Data"] is List && response.data["Data"].isNotEmpty) {
// // // // //         orderDetails = response.data["Data"][0];
// // // // //         print("✅ Order Details Loaded!");
// // // // //       } else {
// // // // //         orderDetails = null;
// // // // //         print("⚠ No Order Data Found!");
// // // // //       }
// // // // //       update();
// // // // //     } catch (e) {
// // // // //       print("❌ Fetch Order Details Error: $e");
// // // // //     } finally {
// // // // //       isLoading.value = false;
// // // // //     }
// // // // //   }
// // // // // }
// // // // import 'package:get/get.dart';
// // // // import 'package:deliveryboy/api/api_service.dart';
// // // // import 'package:deliveryboy/model/update_order_model.dart';
// // // // import 'package:deliveryboy/model/orders_model.dart';
// // // // import 'package:get_storage/get_storage.dart';

// // // // class OrderDetailsController extends GetxController {
// // // //   final ApiService _apiService = ApiService();
// // // //   final GetStorage _storage = GetStorage();

// // // //   var isLoading = false.obs;
// // // //   var isEditable = false.obs;
// // // //   var orderStatus = "".obs;
// // // //   var updateMessage = "".obs;
// // // //   var orderDetails = Rxn<Orders>(); // ✅ Store order details

// // // //   /// ✅ **Fetch Order Details**
// // // //   Future<void> fetchOrderDetails(int orderId) async {
// // // //     try {
// // // //       isLoading.value = true;
// // // //       updateMessage.value = "";

// // // //       // ✅ Get security token from local storage
// // // //       String? securityToken = _storage.read("StoreLogin")?["security_token"];
// // // //       if (securityToken == null || securityToken.isEmpty) {
// // // //         updateMessage.value = "Authentication error: Missing security token.";
// // // //         return;
// // // //       }

// // // //       // ✅ Fetch order details from API
// // // //      final response = await _apiService.getOrderDetails(orderID: orderId.toString(), token: securityToken);


// // // //       if (response.statusCode == 200 && response.data != null) {
// // // //         orderDetails.value = Orders.fromJson(response.data);
// // // //         orderStatus.value = orderDetails.value?.orderStatus ?? "N/A";
// // // //       } else {
// // // //         updateMessage.value = "Failed to fetch order details.";
// // // //       }
// // // //     } catch (e) {
// // // //       updateMessage.value = "Error fetching order details: ${e.toString()}";
// // // //     } finally {
// // // //       isLoading.value = false;
// // // //     }
// // // //   }

// // // //   Future<void> updateOrder(int orderId, Map<String, dynamic> updatedData) async {
// // // //   try {
// // // //     isLoading.value = true;
// // // //     updateMessage.value = "";

// // // //     // ✅ Retrieve Security Token from Storage
// // // //     String? securityToken = _storage.read("StoreLogin")?["security_token"];
// // // //     if (securityToken == null || securityToken.isEmpty) {
// // // //       updateMessage.value = "Authentication error: Missing security token.";
// // // //       return;
// // // //     }

// // // //     // ✅ Call API to update order
// // // //     final response = await _apiService.updateOrder(orderId, updatedData, securityToken);

// // // //     if (response.responseCode == "200" && response.result == "true") {
// // // //       orderStatus.value = response.orderStatus ?? "N/A";
// // // //       updateMessage.value = response.title ?? "Order updated successfully!";
// // // //       isEditable.value = false;

// // // //       // ✅ Refresh Order Details After Update
// // // //       fetchOrderDetails(orderId);
// // // //     } else {
// // // //       updateMessage.value = "Failed to update order.";
// // // //     }
// // // //   } catch (e) {
// // // //     updateMessage.value = "Error updating order: ${e.toString()}";
// // // //   } finally {
// // // //     isLoading.value = false;
// // // //   }
// // // // }

// // // //   /// ✅ **Toggle Editable Mode**
// // // //   void toggleEditable() {
// // // //     isEditable.value = !isEditable.value;
// // // //   }
// // // // }

// // // // import 'package:get/get.dart';  
// // // // import 'package:deliveryboy/api/api_service.dart';
// // // // import 'package:deliveryboy/model/update_order_model.dart';
// // // // import 'package:deliveryboy/model/orders_model.dart';
// // // // import 'package:get_storage/get_storage.dart';

// // // // class OrderDetailsController extends GetxController {
// // // //   final ApiService _apiService = ApiService();
// // // //   final GetStorage _storage = GetStorage();

// // // //   var isLoading = false.obs;
// // // //   var isEditable = false.obs;
// // // //   var orderStatus = "".obs;
// // // //   var updateMessage = "".obs;
// // // //   var orderDetails = Rxn<Orders>(); // ✅ Store order details

// // // //   /// ✅ **Fetch Order Details**
// // // //   Future<void> fetchOrderDetails(int orderId) async {
// // // //     try {
// // // //       isLoading.value = true;
// // // //       updateMessage.value = "";

// // // //       // ✅ Get security token from local storage
// // // //       String? securityToken = _storage.read("StoreLogin")?["security_token"];
// // // //       if (securityToken == null || securityToken.isEmpty) {
// // // //         updateMessage.value = "Authentication error: Missing security token.";
// // // //         return;
// // // //       }

// // // //       // ✅ Fetch order details from API
// // // //       final response = await _apiService.getOrderDetails(orderID: orderId.toString(), token: securityToken);

// // // //       if (response.statusCode == 200 && response.data != null) {
// // // //         orderDetails.value = Orders.fromJson(response.data);
// // // //         orderStatus.value = orderDetails.value?.orderStatus ?? "N/A";
// // // //       } else {
// // // //         updateMessage.value = "Failed to fetch order details.";
// // // //       }
// // // //     } catch (e) {
// // // //       updateMessage.value = "Error fetching order details: \${e.toString()}";
// // // //     } finally {
// // // //       isLoading.value = false;
// // // //     }
// // // //   }

// // // //   Future<void> updateOrder(int orderId, Map<String, dynamic> updatedData) async {
// // // //     try {
// // // //       isLoading.value = true;
// // // //       updateMessage.value = "";

// // // //       // ✅ Retrieve Security Token from Storage
// // // //       String? securityToken = _storage.read("StoreLogin")?["security_token"];
// // // //       if (securityToken == null || securityToken.isEmpty) {
// // // //         updateMessage.value = "Authentication error: Missing security token.";
// // // //         return;
// // // //       }

// // // //       // ✅ Call API to update order
// // // //       final response = await _apiService.updateOrder(orderId, updatedData, securityToken);

// // // //       if (response.responseCode == "200" && response.result == "true") {
// // // //         orderStatus.value = response.orderStatus ?? "N/A";
// // // //         updateMessage.value = response.title ?? "Order updated successfully!";
// // // //         isEditable.value = false;

// // // //         // ✅ Refresh Order Details After Update
// // // //         fetchOrderDetails(orderId);
// // // //       } else {
// // // //         updateMessage.value = "Failed to update order.";
// // // //       }
// // // //     } catch (e) {
// // // //       updateMessage.value = "Error updating order: \${e.toString()}";
// // // //     } finally {
// // // //       isLoading.value = false;
// // // //     }
// // // //   }

// // // //   /// ✅ **Toggle Editable Mode**
// // // //   void toggleEditable() {
// // // //     isEditable.value = !isEditable.value;
// // // //   }
// // // // // }
// // // // import 'package:get/get.dart';   
// // // // import 'package:deliveryboy/api/api_service.dart';
// // // // import 'package:deliveryboy/model/update_order_model.dart';
// // // // import 'package:deliveryboy/model/orders_model.dart';
// // // // import 'package:get_storage/get_storage.dart';

// // // // class OrderDetailsController extends GetxController {
// // // //   final ApiService _apiService = ApiService();
// // // //   final GetStorage _storage = GetStorage();

// // // //   var isLoading = false.obs;
// // // //   var isEditable = false.obs;
// // // //   var orderStatus = "".obs;
// // // //   var updateMessage = "".obs;
// // // //   var orderDetails = Rxn<Orders>(); // ✅ Store order details

// // // //   /// ✅ **Fetch Order Details**
// // // //   Future<void> fetchOrderDetails(int orderId) async {
// // // //     try {
// // // //       isLoading.value = true;
// // // //       updateMessage.value = "";

// // // //       // ✅ Get security token from local storage
// // // //       String? securityToken = _storage.read("StoreLogin")?["security_token"];
// // // //       if (securityToken == null || securityToken.isEmpty) {
// // // //         updateMessage.value = "Authentication error: Missing security token.";
// // // //         return;
// // // //       }

// // // //       // ✅ Fetch order details from API
// // // //       final response = await _apiService.getOrderDetails(orderID: orderId.toString(), token: securityToken);

// // // //       if (response.statusCode == 200 && response.data != null) {
// // // //         orderDetails.value = Orders.fromJson(response.data);
// // // //         orderStatus.value = orderDetails.value?.orderStatus ?? "N/A";
// // // //       } else {
// // // //         updateMessage.value = "Failed to fetch order details.";
// // // //       }
// // // //     } catch (e) {
// // // //       updateMessage.value = "Error fetching order details: ${e.toString()}";
// // // //     } finally {
// // // //       isLoading.value = false;
// // // //     }
// // // //   }

// // // //   Future<void> updateOrder(int orderId, Map<String, dynamic> updatedData) async {
// // // //     try {
// // // //       isLoading.value = true;
// // // //       updateMessage.value = "";

// // // //       // ✅ Retrieve Security Token from Storage
// // // //       String? securityToken = _storage.read("StoreLogin")?["security_token"];
// // // //       if (securityToken == null || securityToken.isEmpty) {
// // // //         updateMessage.value = "Authentication error: Missing security token.";
// // // //         return;
// // // //       }

// // // //       // ✅ Include all required fields for API
// // // //       updatedData.addAll({
// // // //         "id": orderId,
// // // //         "driver_assigned_id": updatedData["driver_assigned_id"] ?? 0,
// // // //         "order_type": updatedData["order_type"] ?? "pickup & delivery",
// // // //         "pickuptime": updatedData["pickuptime"] ?? ["18:30", "19:00"],
// // // //         "product_type": updatedData["product_type"] ?? [4, 5],
// // // //         "quantity": updatedData["quantity"] ?? [2, 180],
// // // //         "price": updatedData["price"] ?? [55, 33],
// // // //         "payment": updatedData["payment"] ?? "cash",
// // // //         "delivery_method": updatedData["delivery_method"] ?? "doorstep",
// // // //         "delivery_type": updatedData["delivery_type"] ?? "same day",
// // // //         "order_instructions": updatedData["order_instructions"] ?? "Handle with care",
// // // //         "order_temp": updatedData["order_temp"] ?? ["Hot", "Cold"],
// // // //         "house_status": updatedData["house_status"] ?? "building",
// // // //         "apt_no": updatedData["apt_no"] ?? "Apartment 402",
// // // //         "elevator_status": updatedData["elevator_status"] ?? 1,
// // // //         "floor": updatedData["floor"] ?? 4,
// // // //         "delivery_status": updatedData["delivery_status"] ?? "hand to hand"
// // // //       });

// // // //       // ✅ Call API to update order
// // // //       final response = await _apiService.updateOrder(orderId, updatedData, securityToken);

// // // //       if (response.responseCode == "200" && response.result == "true") {
// // // //         orderStatus.value = response.orderStatus ?? "N/A";
// // // //         updateMessage.value = response.title ?? "Order updated successfully!";
// // // //         isEditable.value = false;

// // // //         // ✅ Refresh Order Details After Update
// // // //         fetchOrderDetails(orderId);
// // // //       } else {
// // // //         updateMessage.value = "Failed to update order.";
// // // //       }
// // // //     } catch (e) {
// // // //       updateMessage.value = "Error updating order: ${e.toString()}";
// // // //     } finally {
// // // //       isLoading.value = false;
// // // //     }
// // // //   }

// // // //   /// ✅ **Toggle Editable Mode**
// // // //   void toggleEditable() {
// // // //     isEditable.value = !isEditable.value;
// // // //   }
// // // // }
// // // 
// // import 'package:get/get.dart';
// // import 'package:deliveryboy/api/api_service.dart';
// // import 'package:deliveryboy/model/orders_model.dart';
// // import 'package:get_storage/get_storage.dart';

// // class OrderDetailsController extends GetxController {
// //   final ApiService _apiService = ApiService();
// //   final GetStorage _storage = GetStorage();

// //   var isLoading = false.obs;
// //   var orderDetails = Rxn<Orders>(); // Store order details
// //   var updateMessage = "".obs;

// //   /// ✅ **Fetch Order Details**
// //   Future<void> fetchOrderDetails(int orderId) async {
// //     try {
// //       isLoading.value = true;
// //       updateMessage.value = "";

// //       // ✅ Get security token from local storage
// //       String? securityToken = _storage.read("StoreLogin")?["security_token"];
// //       if (securityToken == null || securityToken.isEmpty) {
// //         updateMessage.value = "Authentication error: Missing security token.";
// //         return;
// //       }

// //       // ✅ Fetch order details from API
// //       final response = await _apiService.getOrderDetails(
// //         orderID: orderId.toString(), 
// //         token: securityToken
// //       );

// //       // ✅ Handle the response
// //       if (response.statusCode == 200 && response.data != null) {
// //         // ✅ If response is successful, convert to Order model
// //         var order = Orders.fromJson(response.data);
// //         orderDetails.value = order;
// //       } else {
// //         updateMessage.value = "Failed to fetch order details.";
// //       }
// //     } catch (e) {
// //       updateMessage.value = "Error fetching order details: ${e.toString()}";
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
// import 'package:deliveryboy/controller/order_controller.dart';
// import 'package:get/get.dart';
// import 'package:deliveryboy/api/api_service.dart';
// import 'package:deliveryboy/model/orders_model.dart';
// import 'package:get_storage/get_storage.dart';

// class OrderDetailsController extends GetxController {
//   final ApiService _apiService = ApiService();
//   final GetStorage _storage = GetStorage();

//   var isLoading = false.obs;
//   var isEditable = false.obs;
//   var orderStatus = "".obs;
//   var updateMessage = "".obs;
//   var orderDetails = Rxn<Orders>(); // ✅ Store order details

//   /// ✅ *Fetch Order Details*
//   Future<void> fetchOrderDetails(int orderId) async {
//     try {
//       isLoading.value = true;
//       updateMessage.value = "";

//       // ✅ Get security token from local storage
//       String? securityToken = _storage.read("StoreLogin")?["security_token"];
//       if (securityToken == null || securityToken.isEmpty) {
//         updateMessage.value = "Authentication error: Missing security token.";
//         return;
//       }

//       // ✅ Fetch order details from API
//       final response = await _apiService.fetchOrders(
//           orderID: orderId.toString(), token: securityToken);

//       if (response.statusCode == 200 && response.data != null) {
//         orderDetails.value = Orders.fromJson(response.data);
//         orderStatus.value = orderDetails.value?.orderStatus ?? "N/A";
//       } else {
//         updateMessage.value = "Failed to fetch order details.";
//       }
//     } catch (e) {
//       updateMessage.value = "Error fetching order details: ${e.toString()}";
//     } finally {
//       isLoading.value = false;
//     }
//   }
//   /// ✅ *Toggle Editable Mode*
//   void toggleEditable() {
//     isEditable.value = !isEditable.value;
// }
// }


// class OrderDetailsController extends GetxController {
//   final ApiService _apiService = ApiService();
//   var isLoading = false.obs;
//   var orderDetails = Rxn<Orders>(); // To store the fetched order details

//   /// ✅ Fetch details of a specific order
//   Future<void> fetchOrderDetails({required String driverId, required String orderId, required String token, required String status}) async {
//     try {
//       isLoading.value = true;

//       if (token.isEmpty) {
//         print("❌ Error: Security Token is missing!");
//         return;
//       }

//       print("📡 Fetching Order Details → Driver ID: $driverId, Order ID: $orderId, Status: $status");

//       // Call the API to get the order details based on orderId, driverId, and the dynamic status
//       var response = await _apiService.fetchOrders(
//         driverId: driverId,
//         status: status,  // Passing dynamic status (e.g., 'pending', 'confirmed')
//         token: token,
//       );

//       print("🚀 API Response Code: ${response.statusCode}");
//       print("📝 API Raw Response: ${response.data}");

//       if (response.statusCode == 200) {
//         if (response.data["Orders"] == null || response.data["Orders"].isEmpty) {
//           print("❌ API Response Missing 'Orders' Key!");
//           orderDetails.value = Orders();  // Return an empty order object
//           update();
//           return;
//         }

//         // Fetch the specific order using the orderId
//         var orderList = List<Orders>.from(response.data["Orders"].map((x) => Orders.fromJson(x)));

//         var singleOrder = orderList.firstWhere(
//           (order) => order.orderId.toString() == orderId,
//           orElse: () => Orders(),  // Return an empty Orders object if not found
//         );

//         if (singleOrder.orderId != null) {
//           // ✅ Set the orderDetails with the specific order
//           orderDetails.value = singleOrder;
//           print("📦 Processed Order Data Before UI Update: ${orderDetails.value}");
//         } else {
//           orderDetails.value = Orders();  // Return an empty order object
//           print("⚠ No matching order found for the given orderId!");
//         }
//       } else {
//         print("❌ API Error: ${response.statusCode} - ${response.data}");
//         orderDetails.value = Orders();  // Return an empty order object
//       }

//       update(); // ✅ Ensure UI refreshes properly
//     } catch (e) {
//       print("❌ Error fetching order details: $e");
//       orderDetails.value = Orders();  // Return an empty order object on error
//       update(); // ✅ UI should reflect changes even on error
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:deliveryboy/Api/api_service.dart';
import 'package:deliveryboy/model/orders_model.dart';


class OrderDetailsController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var orderDetails = Rxn<Orders>();  // Keep it null when there is no data

  /// Fetch details of a specific order
  Future<void> fetchOrderDetails({
    required String driverId,
    required String orderId,
    required String token,
    required String status,
  }) async {
    try {
      isLoading.value = true;

      if (token.isEmpty) {
        print("❌ Error: Security Token is missing!");
        return;
      }

      print("📡 Fetching Order Details → Driver ID: $driverId, Order ID: $orderId, Status: $status");

      var response = await _apiService.fetchOrders(
        driverId: driverId,
        status: status,
        token: token,
      );

      print("🚀 API Response Code: ${response.statusCode}");
      print("📝 API Raw Response: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data["Orders"] == null || response.data["Orders"].isEmpty) {
          print("❌ API Response Missing 'Orders' Key!");
          orderDetails.value = null;
          update();
          return;
        }

        // Safely parse the orders from the API response
        var orderList = (response.data["Orders"] as List?)?.map((x) => Orders.fromJson(x)).toList() ?? [];

        var singleOrder = orderList.firstWhere(
              (order) => order.orderId.toString() == orderId,
          orElse: () => Orders(
            orderId: 0, // Default values if not found
            laundryId: 0,
            orderType: '',
            orderTime: '',
            orderStatus: '',
            orderPrice: '',
            totalBags: '',
            weight: '',
            createdAt: '',
            platformPrice: '',
            receipt: null,
            totalPrice: 0,
            driverAssignedId: 0,
            deliveryInstructions: '',
            deliveryStatus: '',
            paymentStatus: '',
            paymentType: null,
            totalAmount: 0,
            products: [],
            customer: Customer(),
            laundromatDetails: LaundromatDetails(),
          ),
        );

        if (singleOrder.orderId != 0) {
          orderDetails.value = singleOrder;
        } else {
          orderDetails.value = null;
          print("⚠ No matching order found for the given orderId!");
        }
      } else {
        print("❌ API Error: ${response.statusCode} - ${response.data}");
        orderDetails.value = null;
      }

      update();
    } catch (e) {
      print("❌ Error fetching order details: $e");
      orderDetails.value = null;
      update();
    } finally {
      isLoading.value = false;
    }
  }
}