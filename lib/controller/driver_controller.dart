import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../api/api_service.dart';

class DriverController extends GetxController {
  final isLoading = false.obs;
  final _storage = GetStorage();
  String driverId = '';

  @override
  void onInit() {
    super.onInit();
    _loadDriverAuth();
  }

  void _loadDriverAuth() {
    final driverData = _storage.read("StoreLogin");
    driverId = driverData?["id"]?.toString() ?? '';
    print("🪪 Loaded Driver ID: $driverId");
  }

  Future<void> updateDriver({
    required Map<String, dynamic> formData,
  }) async {
    if (driverId.isEmpty) {
      Get.snackbar("Error", "Missing Driver ID");
      return;
    }

    try {
      isLoading.value = true;

      // Attach ID to form data
      final processedFormData = {
        "id": driverId,
        ...formData.map((key, value) => MapEntry(key, value.toString())),
      };

      print("📤 Sending update request: $processedFormData");

      final result = await ApiService.updateDriver(body: processedFormData);

      if (result['Result'] == 'true') {
        // Update local storage with data from API response
        final currentData = _storage.read("StoreLogin") ?? {};
        final driverData = result['DriverData'];
        
        if (driverData != null) {
          // Update with response data
          currentData['first_name'] = driverData['first_name'];
          currentData['last_name'] = driverData['last_name'];
          currentData['driver_email'] = driverData['driver_email'];
          currentData['mobile'] = driverData['mobile'];
          currentData['address'] = driverData['address'];
          
          // Also update 'name' and 'email' for profile screen compatibility
          currentData['name'] = '${driverData['first_name']} ${driverData['last_name']}';
          currentData['email'] = driverData['driver_email'];
          currentData['phone'] = driverData['mobile'];
        }
        
        _storage.write("StoreLogin", currentData);
        print("✅ Updated StoreLogin: $currentData");

        Get.snackbar(
          "Success",
          result['ResponseMsg'] ?? "Profile updated successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.primaryColor,
          colorText: Get.theme.colorScheme.onPrimary,
        );
      } else {
        Get.snackbar(
          "Error",
          result['ResponseMsg'] ?? "Failed to update profile",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print("❌ Update Error: $e");
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
