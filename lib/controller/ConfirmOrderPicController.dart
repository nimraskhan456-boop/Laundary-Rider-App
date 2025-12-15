import 'dart:io';

import 'package:deliveryboy/Api/api_service.dart';
import 'package:deliveryboy/model/ConfirmOrderPicResponse.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class ConfirmOrderPicController extends GetxController { 
//   final ApiService _apiService = ApiService();

//   Future<bool> uploadConfirmOrderPic({
//     required int driverId,
//     required int orderId,
//     required File imageFile,
//   }) async {
//     return await _apiService.uploadConfirmOrderPic(
//       driverId: driverId,
//       orderId: orderId,
//       imageFile: imageFile,
//     );
//   }
// }
class ConfirmOrderPicController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<bool> uploadConfirmOrderPic({
    required int driverId,
    required int orderId,
    required File imageFile,
  }) async {
    try {
      final response = await _apiService.uploadConfirmOrderPic(
        driverId: driverId,
        orderId: orderId,
        imageFile: imageFile,
      );

      // Parse response JSON into model
      final confirmResponse = ConfirmOrderPicResponse.fromJson(response.data);

      if (confirmResponse.responseCode == "200" &&
          confirmResponse.result.toLowerCase() == "true") {
        print("✅ Image uploaded successfully");
        return true;
      } else {
        print("❌ Upload failed: ${confirmResponse.responseMsg}");
        return false;
      }
    } catch (e) {
      print("❌ Exception in controller upload: $e");
      return false;
    }
  }
}