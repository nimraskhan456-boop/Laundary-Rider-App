// import 'package:deliveryboy/Api/api_service.dart';
// import 'package:get/get.dart';

// import 'package:deliveryboy/model/help_status_model.dart';

// class HelpStatusController extends GetxController {
//   final ApiService _apiService = ApiService(); // ``✅ Inject API Service

//   var isLoading = false.obs;

//   /// ✅ **Send Help Status API Call**
//   Future<bool> sendHelpStatus({
//     required int orderId,
//     required String helpStatus,
//     required int driverId,
//     required String securityToken,
//   }) async {
//     try {
//       isLoading(true);

//       // ✅ Store in HelpStatusResponse instead of dio.Response
//       HelpStatusResponse response = await _apiService.sendHelpStatus(
//         orderId: orderId,
//         helpStatus: helpStatus,
//         driverId: driverId,
//         securityToken: securityToken,
//       );

//       isLoading(false);

//       if (response.result == "true") {
//         return true;
//       }

//       Get.snackbar("Error", "Failed to send help status",
//           backgroundColor: Get.theme.snackBarTheme.backgroundColor, colorText: Get.theme.snackBarTheme.actionTextColor);
//       return false;
//     } catch (e) {
//       isLoading(false);
//       Get.snackbar("Error", "API Error: $e",
//           backgroundColor: Get.theme.snackBarTheme.backgroundColor, colorText: Get.theme.snackBarTheme.actionTextColor);
//       return false;
//     }
//   }
// }
import 'package:deliveryboy/Api/api_service.dart'; 
import 'package:get/get.dart';
import 'package:deliveryboy/model/help_status_model.dart';

class HelpStatusController extends GetxController {
  final ApiService _apiService = ApiService(); // ✅ Inject API Service

  var isLoading = false.obs;

  /// ✅ **Send Help Status API Call (With Debugging)**
  Future<bool> sendHelpStatus({
    required int orderId,
    required String helpStatus,
    required int driverId,
    required String securityToken,
  }) async {
    try {
      isLoading(true);

      // 🔍 **Debugging: Print Data Before API Call**
      print("🛑 Sending Help Status API Request...");
      print("📌 Order ID: $orderId");
      print("📌 Driver ID: $driverId");
      print("📌 Help Status: $helpStatus");
      print("📌 Security Token: $securityToken");

      // ✅ Store in HelpStatusResponse instead of dio.Response
      HelpStatusResponse response = await _apiService.sendHelpStatus(
        orderId: orderId,
        helpStatus: helpStatus,
        driverId: driverId,
        securityToken: securityToken,
      );

      isLoading(false);

      // 🔍 **Debugging: Print API Response**
      print("✅ Help Status API Response Received");
      print("📌 Response Code: ${response.responseCode}");
      print("📌 Result: ${response.result}");
      print("📌 Message: ${response.responseMsg}");

      if (response.result == "true") {
        Get.snackbar("Success", "Help status updated successfully!",
            backgroundColor: Get.theme.snackBarTheme.backgroundColor,
            colorText: Get.theme.snackBarTheme.actionTextColor);

        return true;
      }

      Get.snackbar("Error", "Failed to send help status",
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
      return false;
    } catch (e) {
      isLoading(false);

      // 🔍 **Debugging: Log API Errors**
      print("❌ API Error: $e");

      Get.snackbar("Error", "API Error: $e",
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
      return false;
    }
  }
}
