
// import 'package:get/get.dart';
// import 'package:deliveryboy/api/api_service.dart';

// class DashboardController extends GetxController {
//   final ApiService _apiService = ApiService();

//   var normalOrdersCount = 0.obs;
//   var completedOrdersCount = 0.obs;
//   var isLoading = false.obs;
//   var errorMessage = "".obs; // Variable to store error message

//   /// ✅ Fetch Normal Orders
//   Future<void> fetchNormalOrders(String driverAssignedId) async {
//     isLoading.value = true;
//     errorMessage.value = ''; // Clear any previous error message
//     try {
//       // Fetch normal orders from the API
//       normalOrdersCount.value = await _apiService.getNormalOrders(driverAssignedId);
//     } catch (e) {
//       errorMessage.value = "Failed to fetch normal orders: $e";
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// ✅ Fetch Completed Orders
//   Future<void> fetchCompletedOrders(String driverAssignedId) async {
//     isLoading.value = true;
//     errorMessage.value = ''; // Clear any previous error message
//     try {
//       // Fetch completed orders from the API
//       completedOrdersCount.value = await _apiService.getCompletedOrders(driverAssignedId);
//     } catch (e) {
//       errorMessage.value = "Failed to fetch completed orders: $e";
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
// import 'package:get/get.dart';
// import 'package:deliveryboy/api/api_service.dart';

// class DashboardController extends GetxController {
//   final ApiService _apiService = ApiService();

//   var normalOrdersCount = 0.obs;
//   var completedOrdersCount = 0.obs;
//   var isLoading = false.obs;
//   var errorMessage = "".obs; // Variable to store error message

//   /// ✅ Generic Fetch Orders Method
//   Future<void> fetchOrders(String driverAssignedId, String orderType) async {
//     isLoading.value = true;
//     errorMessage.value = ''; // Clear any previous error message
//     try {
//       if (orderType == 'normal') {
//         // Fetch normal orders from the API
//         normalOrdersCount.value = await _apiService.getNormalOrders(driverAssignedId);
//       } else if (orderType == 'completed') {
//         // Fetch completed orders from the API
//         completedOrdersCount.value = await _apiService.getCompletedOrders(driverAssignedId);
//       }
//     } catch (e) {
//       errorMessage.value = "Failed to fetch $orderType orders: $e";
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
// import 'package:get/get.dart';
// import 'package:deliveryboy/api/api_service.dart';
//
// class DashboardController extends GetxController {
//   final ApiService _apiService = ApiService();
//
//   var normalOrdersCount = 0.obs;
//   var completedOrdersCount = 0.obs;
//   var isLoading = false.obs;
//   var errorMessage = "".obs; // Variable to store error message
//
//   /// ✅ **Fetch Normal Orders Count**
//   Future<void> fetchNormalOrders(String driverAssignedId, String securityToken) async {
//     isLoading.value = true;
//     errorMessage.value = ''; // Clear any previous error message
//     try {
//       // Fetch normal orders count from the API
//       normalOrdersCount.value = await _apiService.getNormalOrders(driverAssignedId, securityToken);
//     } catch (e) {
//       errorMessage.value = "Failed to fetch normal orders: $e";
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   /// ✅ **Fetch Completed Orders Count**
//   Future<void> fetchCompletedOrders(String driverAssignedId, String securityToken) async {
//     isLoading.value = true;
//     errorMessage.value = ''; // Clear any previous error message
//     try {
//       // Fetch completed orders count from the API
//       completedOrdersCount.value = await _apiService.getCompletedOrders(driverAssignedId, securityToken);
//     } catch (e) {
//       errorMessage.value = "Failed to fetch completed orders: $e";
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
///09999
import 'package:get/get.dart';
import 'package:deliveryboy/api/api_service.dart';

class DashboardController extends GetxController {
  final ApiService _apiService = ApiService();

  var normalOrdersCount = 0.obs;
  var completedOrdersCount = 0.obs;

  var isLoadingNormal = false.obs;
  var isLoadingCompleted = false.obs;

  var errorMessage = "".obs;

  /// 🔵 Fetch Normal Orders Count
  Future<void> fetchNormalOrders(int driverAssignedId, String securityToken) async {
    isLoadingNormal.value = true;
    errorMessage.value = '';
    try {
      final result = await _apiService.getNormalOrders(driverAssignedId, securityToken);
      print("Normal Orders Count API Response: $result"); // Debug log
      normalOrdersCount.value = result;
    } catch (e) {
      errorMessage.value = "Failed to fetch normal orders: $e";
    } finally {
      isLoadingNormal.value = false;
    }
  }

  /// 🟢 Fetch Completed Orders Count
  Future<void> fetchCompletedOrders(int driverAssignedId, String securityToken) async {
    isLoadingCompleted.value = true;
    errorMessage.value = '';
    try {
      final result = await _apiService.getCompletedOrders(driverAssignedId, securityToken);
      print("Completed Orders Count API Response: $result"); // Debug log
      completedOrdersCount.value = result;
    } catch (e) {
      errorMessage.value = "Failed to fetch completed orders: $e";
    } finally {
      isLoadingCompleted.value = false;
    }
  }
}
