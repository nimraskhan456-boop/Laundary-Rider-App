import 'dart:io';
import 'package:deliveryboy/Api/api_service.dart';
import 'package:deliveryboy/model/registeration_model.dart'
    as registeration_model;
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';

class DriverController extends GetxController {
  final ApiService _apiService = ApiService();

  // Observable variables for managing state
  var isLoading = false.obs; // Tracks if registration is in progress
  var errorMessage = ''.obs; // Stores any error messages
  var successMessage = ''.obs; // Stores success messages
  var driverDetails = Rxn<
      registeration_model
      .DriverDetails>(); // Stores driver details after successful registration

  // Store registration data across multiple screens
  Map<String, dynamic> registrationData = {}; // Holds form data
  File? vehiclePhoto; // Holds the selected vehicle photo
  File? driverSelfie; // Holds the selected driver selfie
  File? drivingLicense; // Holds the selected driving license image

  // Method to update registration data from each screen
  void updateRegistrationData(Map<String, dynamic> data) {
    registrationData.addAll(data);
  }

  // Methods to set images from screens
  void setVehiclePhoto(File photo) {
    vehiclePhoto = photo;
  }

  void setDriverSelfie(File selfie) {
    driverSelfie = selfie;
  }

  void setDrivingLicense(File license) {
    drivingLicense = license;
  }

  /// Final method for submitting registration data with debugging
  Future<void> submitFinalRegistration() async {
    try {
      isLoading.value = true; // Start loading state
      errorMessage.value = '';
      successMessage.value = '';

      // Get FCM token for push notifications
      String? fcmToken;
      try {
        fcmToken = await FirebaseMessaging.instance.getToken();
        print("📱 FCM Token: $fcmToken");
      } catch (e) {
        print("⚠️ Could not get FCM token: $e");
      }

      // Debugging: Print registration data and image paths
      print("Registration Data: $registrationData");
      print("Vehicle Photo Path: ${vehiclePhoto?.path}");
      print("Driver Selfie Path: ${driverSelfie?.path}");
      print("Driving License Path: ${drivingLicense?.path}");

      // Prepare FormData for API request - images are optional
      Map<String, dynamic> formDataMap = {
        ...registrationData,
        "token": fcmToken ?? "",
      };

      // Add images only if they are provided
      if (vehiclePhoto != null) {
        formDataMap["vehicle_photo"] = await dio.MultipartFile.fromFile(
            vehiclePhoto!.path,
            filename: vehiclePhoto!.path.split('/').last);
      }
      if (driverSelfie != null) {
        formDataMap["driver_selfie"] = await dio.MultipartFile.fromFile(
            driverSelfie!.path,
            filename: driverSelfie!.path.split('/').last);
      }
      if (drivingLicense != null) {
        formDataMap["driving_license"] = await dio.MultipartFile.fromFile(
            drivingLicense!.path,
            filename: drivingLicense!.path.split('/').last);
      }

      dio.FormData formData = dio.FormData.fromMap(formDataMap);

      // Send API request
      final response = await _apiService.registerDriverWithFormData(formData);

      print("API Response: ${response.toString()}"); // Debugging API response

      // Handle API response
      if (response.status.toLowerCase() == "success" &&
          response.driverDetails != null) {
        successMessage.value = response.message; // Store success message
        driverDetails.value = response.driverDetails; // Save driver details
      } else {
        errorMessage.value = response.message.isNotEmpty
            ? response.message
            : 'Registration failed'; // Store error message
      }
    } catch (e) {
      // Handle exceptions and print error
      errorMessage.value = 'Error: ${e.toString()}';
      print("Registration Error: ${e.toString()}");
    } finally {
      isLoading.value = false; // Stop loading state
    }
  }
}
// import 'dart:io';
// import 'package:deliveryboy/Api/api_service.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:deliveryboy/model/registeration_model.dart' as registeration_model;

// class DriverController extends GetxController {
//   final ApiService _apiService = ApiService();
  
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var successMessage = ''.obs;
//   var driverDetails = Rxn<registeration_model.DriverDetails>();

//   Map<String, dynamic> registrationData = {}; 
//   String? vehiclePhotoUrl, driverSelfieUrl, drivingLicenseUrl; 

//   void updateRegistrationData(Map<String, dynamic> data) {
//     registrationData.addAll(data);
//   }

//   /// ✅ **Upload image & get URL**
//   Future<String> uploadImage(File imageFile, String imageType) async {
//     return await _apiService.uploadImage(imageFile, imageType);
//   }

//   // ✅ **Save image URLs**
//   void setVehiclePhotoUrl(String url) => vehiclePhotoUrl = url;
//   void setDriverSelfieUrl(String url) => driverSelfieUrl = url;
//   void setDrivingLicenseUrl(String url) => drivingLicenseUrl = url;

//   /// ✅ **Submit registration data**
//   Future<void> submitFinalRegistration() async {
//     if (vehiclePhotoUrl == null || driverSelfieUrl == null || drivingLicenseUrl == null) {
//       errorMessage.value = "All required images must be uploaded.";
//       return;
//     }

//     try {
//       isLoading.value = true;
//       errorMessage.value = '';
//       successMessage.value = '';

//       dio.FormData formData = dio.FormData.fromMap({
//         ...registrationData,
//         "vehicle_photo_url": vehiclePhotoUrl,
//         "driver_selfie_url": driverSelfieUrl,
//         "driving_license_url": drivingLicenseUrl,
//       });

//       final response = await _apiService.registerDriverWithFormData(formData);

//       if (response.status.toLowerCase() == "success" && response.driverDetails != null) {
//         successMessage.value = response.message;
//         driverDetails.value = response.driverDetails;
//       } else {
//         errorMessage.value = response.message ?? 'Registration failed';
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: ${e.toString()}';
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
// import 'dart:io';
// import 'package:deliveryboy/Api/api_service.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:deliveryboy/model/registeration_model.dart' as registeration_model;

// class DriverController extends GetxController {
//   final ApiService _apiService = ApiService(); // API service instance
  
//   // Reactive variables for state management
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var successMessage = ''.obs;
//   var driverDetails = Rxn<registeration_model.DriverDetails>(); // Store driver info after registration

//   // Data map for storing registration form fields
//   Map<String, dynamic> registrationData = {};

//   // URLs for uploaded images
//   String? vehiclePhotoUrl, driverSelfieUrl, drivingLicenseUrl;

//   /// ✅ Update registration form data
//   void updateRegistrationData(Map<String, dynamic> data) {
//     registrationData.addAll(data); // Merge new data into the form data
//   }

//   /// ✅ Upload image and get its URL (for any of the required images)
//   Future<String> uploadImage(File imageFile, String imageType) async {
//     return await _apiService.uploadImage(imageFile, imageType);
//   }

//   /// ✅ Setters for each image type after upload
//   void setVehiclePhotoUrl(String url) => vehiclePhotoUrl = url;
//   void setDriverSelfieUrl(String url) => driverSelfieUrl = url;
//   void setDrivingLicenseUrl(String url) => drivingLicenseUrl = url;

//   /// ✅ Submit final registration with all data and uploaded image URLs
//   Future<void> submitFinalRegistration() async {
//     // Check if all required images are uploaded
//     if (vehiclePhotoUrl == null || driverSelfieUrl == null || drivingLicenseUrl == null) {
//       errorMessage.value = "All required images must be uploaded.";
//       return;
//     }

//     try {
//       // Start loading and reset previous messages
//       isLoading.value = true;
//       errorMessage.value = '';
//       successMessage.value = '';

//       // Create FormData including form fields and uploaded image URLs
//       dio.FormData formData = dio.FormData.fromMap({
//         ...registrationData, // Spread the registration fields
//         "vehicle_photo_url": vehiclePhotoUrl,
//         "driver_selfie_url": driverSelfieUrl,
//         "driving_license_url": drivingLicenseUrl,
//       });

//       // Call the API to register driver
//       final response = await _apiService.registerDriverWithFormData(formData);

//       // Handle API response
//       if (response.status.toLowerCase() == "success" && response.driverDetails != null) {
//         successMessage.value = response.message;
//         driverDetails.value = response.driverDetails;
//       } else {
//         errorMessage.value = response.message ?? 'Registration failed';
//       }
//     } catch (e) {
//       // Handle errors during API call
//       errorMessage.value = 'Error: ${e.toString()}';
//     } finally {
//       // Stop loading in both success and error cases
//       isLoading.value = false;
//     }
//   }
// }
