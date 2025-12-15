// import 'package:deliveryboy/model/pickup_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:deliveryboy/api/api_service.dart';
// import 'package:get_storage/get_storage.dart';

// class LaundryPickupController extends GetxController {
//   final ApiService _apiService = ApiService();
//   final GetStorage _storage = GetStorage();

//   var isLoading = false.obs;
//   var pickupOrderDetails = Rxn<PickupOrderDetails>();
//   var updateMessage = "".obs;

//   /// ✅ **Fetch Pickup Order Details**
//   Future<void> fetchPickupOrderDetails(int orderId, int driverAssignedId) async {
//     try {
//       isLoading.value = true;
//       updateMessage.value = "";

//       /// ✅ **Fetch Security Token from Storage**
//       String? securityToken = _storage.read("StoreLogin")?["security_token"];
//       if (securityToken == null || securityToken.isEmpty) {
//         updateMessage.value = "❌ Authentication error: Missing security token.";
//         return;
//       }

//       print("🛑 Fetching Order ID: $orderId, Driver Assigned ID (Request): $driverAssignedId");

//       final response = await _apiService.getOrderById(
//         orderId: orderId,
//         driverAssignedId: driverAssignedId,  // ✅ Request uses `assign_driver_id`
//       );

//       if (response.responseCode == "200" && response.pickupOrderDetails != null) {
//         /// ✅ Fixing the response mismatch
//         pickupOrderDetails.value = response.pickupOrderDetails;
//         print("✅ Order Details Fetched (Response Driver ID): ${pickupOrderDetails.value?.driverAssignedId}");
//       } else {
//         updateMessage.value = "❌ No Orders Available.";
//         print("❌ No orders found in API response.");
//       }
//     } catch (e) {
//       updateMessage.value = "❌ Error fetching pickup order: ${e.toString()}";
//       print("❌ Exception: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// ✅ **Complete Pickup Order**
// Future<void> completePickupOrder(int orderId, int driverAssignedId) async {
//   try {
//     isLoading.value = true;
//     updateMessage.value = "";

//     String? securityToken = _storage.read("StoreLogin")?["security_token"];
//     if (securityToken == null || securityToken.isEmpty) {
//       updateMessage.value = "❌ Authentication error: Missing security token.";
//       return;
//     }

//     if (orderId > 0 && driverAssignedId > 0) {
//       print("🔄 Updating Order ID: $orderId | Driver ID: $driverAssignedId | Status: in_process");

//       bool success = await _apiService.updatePickupOrderStatus(
//         orderId: orderId,
//         status: "in_process",
//         driverId: driverAssignedId,  // ✅ Sending as 'driver_id' in API request
//       );

//       if (success) {
//         updateMessage.value = "✅ Pickup Order Status Changed!";
//         print("✅ Order Status Updated Successfully");

//         Get.snackbar(
//           "Success",
//           "Order updated successfully!",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//         );

//         Get.toNamed("/ArrivedAtLaundryScreen");
//       } else {
//         updateMessage.value = "❌ Failed to complete pickup order.";
//         print("❌ Error: Order update failed.");
//       }
//     } else {
//       print("❌ Error: Invalid Order ID or Driver ID (orderId: $orderId, driverAssignedId: $driverAssignedId)");
//       updateMessage.value = "❌ Error: Order ID or Driver ID is missing or invalid.";
//     }
//   } catch (e) {
//     updateMessage.value = "❌ Error completing pickup order: ${e.toString()}";
//     print("❌ Exception: $e");
//   } finally {
//     isLoading.value = false;
//   }
// }
// }
// // import 'package:deliveryboy/model/pickup_model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:deliveryboy/api/api_service.dart';
// // import 'package:get_storage/get_storage.dart';

// // class LaundryPickupController extends GetxController {
// //   final ApiService _apiService = ApiService();
// //   final GetStorage _storage = GetStorage();

// //   var isLoading = false.obs;
// //   var pickupOrderDetails = Rxn<PickupOrderDetails>();
// //   var updateMessage = "".obs;

// //   /// ✅ **Fetch Pickup Order Details**
// //   Future<void> fetchPickupOrderDetails(int? orderId, int? driverAssignedId) async {
// //     try {
// //       isLoading.value = true;
// //       updateMessage.value = "";

// //       /// ✅ **Fetch Security Token from Storage**
// //       String? securityToken = _storage.read("StoreLogin")?["security_token"];
// //       if (securityToken == null || securityToken.isEmpty) {
// //         updateMessage.value = "❌ Authentication error: Missing security token.";
// //         return;
// //       }

// //       /// ✅ **Ensure Order ID & Driver ID are Valid**
// //       int? storedOrderId = _storage.read("order_id");
// //       int? storedDriverAssignedId = _storage.read("StoreLogin")?["driver_assigned_id"];

// //       int id= orderId ?? storedOrderId ?? 0;
// //       int apiDriverId = driverAssignedId ?? storedDriverAssignedId ?? 0;

// //       print("🚀 Fetching Order → Sending `order_id`: $id, Driver ID: $apiDriverId");

// //       if (id == 0 || apiDriverId == 0) {
// //         print("⚠️ Error: Order ID or Driver ID is missing.");
// //         updateMessage.value = "❌ Order ID or Driver ID missing!";
// //         return;
// //       }

// //       final response = await _apiService.getOrderById(
// //         orderId: id,
// //         driverAssignedId: apiDriverId,
// //       );

// //       if (response.responseCode == "200" && response.pickupOrderDetails != null) {
// //         /// ✅ Store `id` from API into GetStorage as `order_id`
// //         int id = response.pickupOrderDetails?.id ?? 0;
// //         _storage.write("order_id", id);

// //         pickupOrderDetails.value = response.pickupOrderDetails;
// //         print("✅ Mapped API `id` to `order_id`: $id");
// //       } else {
// //         updateMessage.value = "❌ No Orders Available.";
// //         print("❌ No orders found in API response.");
// //       }
// //     } catch (e) {
// //       updateMessage.value = "❌ Error fetching pickup order: ${e.toString()}";
// //       print("❌ Exception: $e");
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //   /// ✅ **Complete Pickup Order**
// // Future<void> completePickupOrder(int orderId, int driverAssignedId) async {
// //   try {
// //     isLoading.value = true;
// //     updateMessage.value = "";

// //     String? securityToken = _storage.read("StoreLogin")?["security_token"];
// //     if (securityToken == null || securityToken.isEmpty) {
// //       updateMessage.value = "❌ Authentication error: Missing security token.";
// //       return;
// //     }

// //     if (orderId > 0 && driverAssignedId > 0) {
// //       print("🔄 Updating Order ID: $orderId | Driver ID: $driverAssignedId | Status: in_process");

// //       bool success = await _apiService.updatePickupOrderStatus(
// //         orderId: orderId,
// //         status: "in_process",
// //         driverId: driverAssignedId,  // ✅ Sending as 'driver_id' in API request
// //       );

// //       if (success) {
// //         updateMessage.value = "✅ Pickup Order Status Changed!";
// //         print("✅ Order Status Updated Successfully");

// //         Get.snackbar(
// //           "Success",
// //           "Order updated successfully!",
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.green,
// //           colorText: Colors.white,
// //         );

// //         Get.toNamed("/arrivedAtLaundry");
// //       } else {
// //         updateMessage.value = "❌ Failed to complete pickup order.";
// //         print("❌ Error: Order update failed.");
// //       }
// //     } else {
// //       print("❌ Error: Invalid Order ID or Driver ID (orderId: $orderId, driverAssignedId: $driverAssignedId)");
// //       updateMessage.value = "❌ Error: Order ID or Driver ID is missing or invalid.";
// //     }
// //   } catch (e) {
// //     updateMessage.value = "❌ Error completing pickup order: ${e.toString()}";
// //     print("❌ Exception: $e");
// //   } finally {
// //     isLoading.value = false;
// //   }
// // }}
import 'package:deliveryboy/model/pickup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliveryboy/api/api_service.dart';
import 'package:get_storage/get_storage.dart';

class LaundryPickupController extends GetxController {
  final ApiService _apiService = ApiService();
  final GetStorage _storage = GetStorage();

  var isLoading = false.obs;
  var pickupOrderDetails = Rxn<PickupOrderDetails>();
  var updateMessage = "".obs;

  /// ✅ **Fetch Pickup Order Details**
  Future<void> fetchPickupOrderDetails(
      int orderId, int driverAssignedId) async {
    try {
      isLoading.value = true;
      updateMessage.value = "";

      /// ✅ **Fetch Security Token from Storage**
      String? securityToken = _storage.read("StoreLogin")?["security_token"];
      if (securityToken == null || securityToken.isEmpty) {
        updateMessage.value = "❌ Authentication error: Missing security token.";
        return;
      }

      print(
          "🛑 Fetching Order ID: $orderId, Driver Assigned ID (Request): $driverAssignedId");

      final response = await _apiService.getOrderById(
        orderId: orderId,
        driverAssignedId: driverAssignedId,
      );
      isLoading.value = false;

      if (response.responseCode == "200" &&
          response.pickupOrderDetails != null) {
        pickupOrderDetails.value = response.pickupOrderDetails;
        print(
            "✅ Order Details Fetched (Response Driver ID): ${pickupOrderDetails.value?.driverAssignedId}");
      } else {
        updateMessage.value = "❌ No Orders Available.";
        print("❌ No orders found in API response.");
      }
    } catch (e) {
      updateMessage.value = "❌ Error fetching pickup order: ${e.toString()}";
      print("❌ Exception: $e");
    } finally {
      // isLoading.value = false;
    }
  }
}
