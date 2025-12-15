import 'package:deliveryboy/Api/api_service.dart';
import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/model/login_model.dart';
import 'package:deliveryboy/screen/bottombar_screen.dart';
import 'package:deliveryboy/screen/dashboard_screen.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// ✅ Import LoginModel
// ✅ Import Dashboard Screen

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();
  final GetStorage _storage = GetStorage();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;
  bool showPassword = true;
  var isLoading = false.obs;
  var securityToken = "".obs; // ✅ Now observable
  var driverId = "".obs; // ✅ Now observable

// not working
  @override
  void onClose() {
    // Dispose of the controllers to clear their memory and data
    emailController.clear();
    passwordController.clear();
    isChecked = false;
    showPassword = true;
    isLoading = false.obs;
    securityToken = "".obs; // ✅ Now observable
    driverId = "".obs; // ✅ Now observable
    super.onClose();
  }

  /// ✅ Toggle Remember Me Checkbox
  void changeRememberMe(bool? value) {
    isChecked = value ?? true;
    update();
  }

  /// ✅ Toggle Password Visibility
  void showOfPassword() {
    showPassword = !showPassword;
    update();
  }

  /// ✅ Handles login process
  Future<void> handleLogin() async {
    isLoading.value = true;

    try {
      // ✅ Call API to login and receive raw response
      final response = await _apiService.loginDriver(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      print(response.data);
      // ✅ Convert raw response data into a LoginModel object
      final loginModel = LoginModel.fromJson(response.data);

      if (loginModel.driverDetails != null) {
        // ✅ Store values in observables
        driverId.value = loginModel.driverDetails!.driverId.toString();
        securityToken.value =
            loginModel.driverDetails!.securityToken.toString();

        // ✅ Save login details in GetStorage for later use
        _storage.write("StoreLogin", {
          'id': driverId.value,
          'security_token': securityToken.value,
          'name': loginModel.driverDetails!.driverName,
          'email': loginModel.driverDetails!.driverEmail,
          'phone': loginModel.driverDetails!.driverPhone,
        });
        _storage.write('securityToken', securityToken.value); // ✅ Fix

        print("✅ Driver ID Stored: ${driverId.value}");
        print("✅ Security Token Stored: ${securityToken.value}");

        // ✅ Navigate to app home
        // Get.offAll(() => DashBoardScreen());
        Get.offAll(() => BottoBarScreen());
        onClose(); //calling for disposal of data
      } else {
        Get.snackbar(
            "Login Failed", loginModel.responseMsg ?? "Invalid credentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e",
          snackPosition: SnackPosition.BOTTOM);
      print("❌ Login Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
