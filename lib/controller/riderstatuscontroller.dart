// import 'package:deliveryboy/Api/api_service.dart';
// import 'package:deliveryboy/model/riderstatusmodel.dart';
//
// import 'package:get/get.dart';
//
//
// class RiderStatusController extends GetxController {
//   final ApiService _apiService = ApiService();
//   var isLoading = false.obs;
//
//   Future<StatusUpdateResponse?> updateRiderStatus(String riderId, String status) async {
//     isLoading.value = true;
//     final response = await _apiService.updateRiderStatus(riderId: riderId, status: status);
//     isLoading.value = false;
//     return response;
//   }
// }
import 'package:deliveryboy/Api/api_service.dart';
import 'package:deliveryboy/model/riderstatusmodel.dart';
import 'package:get/get.dart';

class RiderStatusController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;

  Future<StatusUpdateResponse?> updateRiderStatus(String riderId, String status) async {
    isLoading.value = true;
    final response = await _apiService.updateRiderStatus(riderId: riderId, status: status);
    isLoading.value = false;

    // 🐞 Debug print to show API response
    if (response != null) {
      print("🚀 Rider Status API Response: ${response.responseMsg}");
      print("✅ Result: ${response.result}, Code: ${response.responseCode}");
    } else {
      print("❌ Failed to get a response from Rider Status API.");
    }

    return response;
  }
}
