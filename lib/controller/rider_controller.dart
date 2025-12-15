import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

class RiderProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final isLoading = false.obs;

  final _storage = GetStorage();

  String riderId = "";
  String securityToken = "";

  void loadRiderData() {
    final riderData = _storage.read("StoreLogin");

    print("📦 StoreLogin Data: $riderData");

    riderId = riderData?["id"]?.toString() ?? "";
    securityToken = riderData?["security_token"] ?? "";

    nameController.text = riderData?["name"] ?? "";
    emailController.text = riderData?["email"] ?? "";
    phoneController.text = riderData?["phone"] ?? "";

    print("🔐 Loaded Rider ID: $riderId");
    print("🔐 Loaded Token: $securityToken");
    print("👤 Loaded Name: ${nameController.text}");
    print("📧 Loaded Email: ${emailController.text}");
    print("📱 Loaded Phone: ${phoneController.text}");
  }

  Future<void> updateRiderProfile() async {
    if (riderId.isEmpty) {
      Get.snackbar("Error", "Missing Rider ID");
      return;
    }

    isLoading.value = true;

    try {
      // Build data map with only non-empty fields
      final Map<String, dynamic> data = {
        "id": riderId,
      };

      // Only add fields that have values
      if (nameController.text.trim().isNotEmpty) {
        data["rider_name"] = nameController.text.trim();
      }
      if (emailController.text.trim().isNotEmpty) {
        data["rider_email"] = emailController.text.trim();
      }
      if (phoneController.text.trim().isNotEmpty) {
        data["rider_phone"] = phoneController.text.trim();
      }

      print("📤 Update Rider Request Data: $data");

      final response = await Dio().put(
        "http://10.0.2.2:8000/rider_api/update_rider.php",
        data: data,
        options: Options(
          headers: {
            "Security-Token": securityToken,
            "Content-Type": "application/json",
          },
        ),
      );

      print("📤 Response: ${response.data}");

      if (response.statusCode == 200 &&
          response.data["ResponseCode"] == "200") {
        Get.snackbar("Success", "Profile Updated");
      } else {
        Get.snackbar("Failed", response.data["ResponseMsg"] ?? "Update Failed");
      }
    } catch (e) {
      print("❌ Error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
