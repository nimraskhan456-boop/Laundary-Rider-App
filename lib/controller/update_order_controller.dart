import 'package:deliveryboy/Api/api_service.dart';
import 'package:deliveryboy/model/update_order.dart';
import 'package:get/get.dart';

class UpdateOrderController extends GetxController {
  final ApiService _apiService = ApiService(); // Use the API service

  var isLoading = false.obs;
  var updateResponse = UpdateOrderResponse().obs;
  var errorMessage = ''.obs;
  


//   Future<void> updateOrder({
//     required int orderId,
//     required int driverAssignedId,
//     required Map<String, dynamic> orderData,
//     required String securityToken,
//   }) async {
//     try {
//       print("🟡 Starting order update...");
//       print("📦 Data to send: $orderData");
//       print("🆔 Order ID: $orderId | 👤 Driver Assigned ID: $driverAssignedId");

//       isLoading.value = true;
//       errorMessage.value = '';

//       UpdateOrderResponse response = await _apiService.updateOrder(
//         orderId: orderId,
//         driverAssignedId: driverAssignedId,
//         orderData: orderData,
//         securityToken: securityToken,
//          paymentStatus: paymentStatus, 
//          paymentType:paymentType ,
//          amountCcollected: amountCcollected 
         
//       );
//       //Debug the response
//       print("✅ Order update successful! Response: ${response.toString()}");


//       updateResponse.value = response;
//     } catch (e) {
//       print("❌ Error during order update: $e");
//       errorMessage.value = "Error updating order: $e";
//     } finally {
//       isLoading.value = false;
//        print("🟣 Update process finished.");
//     }
//   }
// }
Future<void> updateOrder({
  required int orderId,
  required int driverAssignedId,
  required Map<String, dynamic> orderData,
  required String securityToken,
  required String paymentStatus,
  required String paymentType,
  required int amountCollected,
  required int totalBags,
}) async {
  try {
    print("🟡 Starting order update...");
    print("📦 Data to send: $orderData");
    print("🆔 Order ID: $orderId | 👤 Driver Assigned ID: $driverAssignedId");

    isLoading.value = true;
    errorMessage.value = '';

    UpdateOrderResponse response = await _apiService.updateOrder(
      orderId: orderId,
      driverAssignedId: driverAssignedId,
      orderData: orderData,
      securityToken: securityToken,
      paymentStatus: paymentStatus,
      paymentType: paymentType,
      amountCollected: amountCollected,
      totalBags: totalBags,
    );

    print("✅ Order update successful! Response: ${response.toString()}");

    updateResponse.value = response;
  } catch (e) {
    print("❌ Error during order update: $e");
    errorMessage.value = "Error updating order: $e";
  } finally {
    isLoading.value = false;
    print("🟣 Update process finished.");
  }
}
}