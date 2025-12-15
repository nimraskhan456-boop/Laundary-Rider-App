import 'package:deliveryboy/Api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:deliveryboy/model/update.dart';

class OrderStatusController extends GetxController {
  var isUpdating = false.obs;
  final ApiService _apiService = ApiService();

  /// ✅ Update Order Status
  Future<bool> updateOrderStatus({
    required int orderId,
    required String status,
    required int driverId,
    required String securityToken,
  }) async {
    isUpdating(true);
    bool response = await _apiService.updatePickupOrderStatus(
      orderId: orderId,
      status: status,
      driverId: driverId,
      securityToken: securityToken,
    );
    isUpdating(false);

    if (response) {
      return true;
    } else {
      Get.snackbar(
        "Error",
        "Failed to update order status.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }
}
