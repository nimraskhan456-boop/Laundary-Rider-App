
// import 'package:deliveryboy/Api/api_service.dart';
// import 'package:get/get.dart';

// class OrderController extends GetxController {
//   final ApiService _apiService = ApiService();
//   var isLoading = false.obs;
//   var orderInfo = <Map<String, dynamic>>[].obs; // ✅ Ensure type safety with List<Map>

//   /// ✅ Fetch all assigned orders
//   Future<void> fetchOrders({required String driverId, required String status, required String token}) async {
//     try {
//       isLoading.value = true;

//       if (token.isEmpty) {
//         print("❌ Error: Security Token is missing!");
//         return;
//       }

//       print("📡 Fetching Orders → Driver ID: $driverId, Status: $status");

//       var response = await _apiService.fetchOrders(
//         driverId: driverId,
//         status: status,
//         token: token,
//       );

//       print("🚀 API Response Code: ${response.statusCode}");
//       print("📝 API Raw Response: ${response.data}");

//       if (response.statusCode == 200) {
//         if (response.data["Data"] == null) {
//           print("❌ API Response Missing 'orders' Key!");
//           orderInfo.clear();
//           update();
//           return;
//         }

//         var orders = List<Map<String, dynamic>>.from(response.data["Data"]); // ✅ Convert properly

//         if (orders.isNotEmpty) {
//           orderInfo.assignAll(orders);
//           print("📦 Processed Order Data Before UI Update: ${orderInfo}");
//         } else {
//           orderInfo.clear();
//           print("⚠ No Orders Found!");
//         }
//       } else {
//         print("❌ API Error: ${response.statusCode} - ${response.data}");
//         orderInfo.clear();
//       }

//       update(); // ✅ Ensure UI refreshes properly
//     } catch (e) {
//       print("❌ Error fetching orders: $e");
//       orderInfo.clear();
//       update(); // ✅ UI should reflect changes even on error
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
import 'package:deliveryboy/Api/api_service.dart';
import 'package:deliveryboy/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:deliveryboy/model/registeration_model.dart'; // Ensure correct import

class OrderController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var orderInfo = <Orders>[].obs; // ✅ Updated to match new model

  /// ✅ Fetch all assigned orders
  Future<void> fetchOrders({required String driverId, required String status, required String token}) async {
    try {
      isLoading.value = true;

      if (token.isEmpty) {
        print("❌ Error: Security Token is missing!");
        return;
      }

      print("📡 Fetching Orders → Driver ID: $driverId, Status: $status");

      var response = await _apiService.fetchOrders(
        driverId: driverId,
        status: status,
        token: token,
      );

      print("🚀 API Response Code: ${response.statusCode}");
      print("📝 API Raw Response: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data["Orders"] == null) {
          print("❌ API Response Missing 'Orders' Key!");
          orderInfo.clear();
          update();
          return;
        }

        var ordersList = List<Orders>.from(response.data["Orders"].map((x) => Orders.fromJson(x)));

        if (ordersList.isNotEmpty) {
          orderInfo.assignAll(ordersList);
          print("📦 Processed Order Data Before UI Update: ${orderInfo}");
        } else {
          orderInfo.clear();
          print("⚠ No Orders Found!");
        }
      } else {
        print("❌ API Error: ${response.statusCode} - ${response.data}");
        orderInfo.clear();
      }

      update(); // ✅ Ensure UI refreshes properly
    } catch (e) {
      print("❌ Error fetching orders: $e");
      orderInfo.clear();
      update(); // ✅ UI should reflect changes even on error
    } finally {
      isLoading.value = false;
    }
  }
}
