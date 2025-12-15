import 'dart:convert';
import 'dart:developer';
import 'package:deliveryboy/model/help_status_model.dart';
import 'package:deliveryboy/model/pickup_model.dart';
import 'package:deliveryboy/model/riderstatusmodel.dart';
import 'package:deliveryboy/model/update_order.dart';
import 'package:deliveryboy/model/update_weight_response.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:deliveryboy/model/registeration_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8000/driver_api/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  final GetStorage _storage = GetStorage(); // ✅ Storage for Security Token

  /// ✅ **Upload Image API**
  Future<String> uploadImage(File imageFile, String imageType) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
        "image_type": imageType,
      });

      final response = await _dio.post(
        "rider_register.php",
        data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data['imageUrl'] ??
            ""; // ✅ Ensure key matches API response
      } else {
        throw Exception(
            "Server error: Unexpected response (${response.statusCode}).");
      }
    } catch (e) {
      return "";
    }
  }

  Future<dynamic> sendnotification(String url) async {
    try {
      print("📡 Sending POST request to: $url");

      final Dio dio = Dio(
        BaseOptions(
          baseUrl: "http://10.0.2.2:8000/",
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      final response = await dio
          .get(
            url,
          )
          .timeout(const Duration(seconds: 10));

      print("🔹 Response Headers: ${response.headers}");
      print("🔹 Response Status: ${response.statusCode}");
      print("🔹 Response Body: ${response.data}");

      return response.data;
      // responseJson = returnResponse(response);
    } catch (e) {
      return null;
    }
    // return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.data);
      default:
        throw "unkown Error occured";
    }
  }

  /// ✅ **Driver Registration API**
  Future<DriverRegistrationResponse> registerDriverWithFormData(
      FormData formData) async {
    try {
      final response = await _dio.post("rider_register.php", data: formData);

      if (response.statusCode == 200 && response.data != null) {
        return DriverRegistrationResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to register: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw Exception('API error: $e');
    }
  }

  /// ✅ **Driver Login API**
  Future<Response> loginDriver(String email, String password) async {
    log("${_dio.options.baseUrl}driver_login.php");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await _dio.post(
      "driver_login.php",
      data: {
        "driver_email": email,
        "driver_password": password,
        "token": prefs.getString('token')
      },
    );
  }

  /// ✅ **Fetch Normal Orders Count**
  Future<int> getNormalOrders(
      int driverAssignedId, String securityToken) async {
    try {
      final response = await _dio.post(
        "all_normal_orders_counts.php",
        data: {"driver_assigned_id": driverAssignedId},
        options: Options(headers: {"Security-Token": securityToken}),
      );

      // Print the full response data for debugging
      print("Normal Orders Response: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        // Check if the response has the key "normal_orders" and it's a valid number
        if (response.data["normal_orders"] != null) {
          return int.tryParse(response.data["normal_orders"].toString()) ?? 0;
        }
      }
    } catch (e) {
      print("Error fetching normal orders: $e");
    }
    return 0;
  }

  /// ✅ **Fetch Completed Orders Count**
  Future<int> getCompletedOrders(
      int driverAssignedId, String securityToken) async {
    print("debug:driver id before sending request:$driverAssignedId");
    try {
      final response = await _dio.post(
        "all_completed_orders_count.php",
        data: {"driver_assigned_id": driverAssignedId},
        options: Options(headers: {"Security-Token": securityToken}),
      );

      // Print the full response data for debugging
      print("Completed Orders Response: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        // Check if the response has the key "completed_orders" and it's a valid number
        if (response.data["completed_orders"] != null) {
          return int.tryParse(response.data["completed_orders"].toString()) ??
              0;
        }
      }
    } catch (e) {
      print("Error fetching completed orders: $e");
    }
    return 0;
  }

  // /// ✅ **Fetch Assigned Orders API**
  // Future<Response> fetchOrders({
  //   required String driverId,
  //   required String status,
  //   required String token,
  // }) async {
  //   return await _dio.get(
  //     "get_assign_orders.php",
  //     queryParameters: {
  //       "driver_id": driverId,
  //       "status": status,
  //     },
  //     options: Options(headers: {"Security-Token": token}),
  //   );
  // }

  // /// ✅ **Get Single Order Details API**
  // Future<Response> getOrderDetails({
  //   required String orderID,
  //   required String token,
  // }) async {
  //   return await _dio.get(
  //     "get_assign_orders.php",
  //     queryParameters: {
  //       "order_id": orderID,
  //     },
  //     options: Options(headers: {"Security-Token": token}),
  //   );
  // }
  /// ✅ **Fetch Assigned Orders API** (Fetch list of orders based on driver_id and status)
  Future<Response> fetchOrders({
    required String driverId,
    required String status,
    required String token,
  }) async {
    return await _dio.get(
      "get_assign_orders.php",
      queryParameters: {
        "driver_id": driverId,
        "status": status,
      },
      options: Options(headers: {"Security-Token": token}),
    );
  }

  /// ✅ **Get Single Order Details API** (Fetch a single order's details based on order_id)
  Future<Response> getOrderDetails({
    required String orderID,
    required String token,
  }) async {
    return await _dio.get(
      "get_assign_orders.php", // Using the same endpoint
      queryParameters: {
        "order_id": orderID, // Use order_id as the parameter here
      },
      options: Options(headers: {"Security-Token": token}),
    );
  }

  // //UPDATE weight
  //  Future<bool> updateOrderWeight({
  //    required int orderId,
  //    required int driverAssignedId,
  //    required double weight,
  //    required double orderPrice,
  //    required String token,
  //  }) async {
  //    try {
  //      final body = {
  //        "driver_assigned_id": driverAssignedId,
  //        "order_id": orderId,
  //        "weight": weight,
  //        "order_price": orderPrice,
  //      };
  //
  //      final response = await _dio.put(
  //        "update_weight.php",
  //        data: jsonEncode(body),
  //        options: Options(
  //          headers: {
  //            "Security-Token": token,
  //            "Content-Type": "application/json",
  //          },
  //        ),
  //      );
  //
  //      print("📤 Weight Update Response: ${response.data}");
  //
  //      if (response.statusCode == 200 && response.data["ResponseCode"] == "200") {
  //        return true;
  //      } else {
  //        throw Exception("❌ Failed: ${response.data["ResponseMsg"] ?? "Unknown error"}");
  //      }
  //    } catch (e) {
  //      print("❌ Exception in updateOrderWeight: $e");
  //      return false;
  //    }
  //  }
  Future<UpdateWeightResponse> updateOrderWeight({
    required int orderId,
    required int driverAssignedId,
    required double weight,
    required String orderPrice,
    required String token,
  }) async {
    try {
      final body = {
        "driver_assigned_id": driverAssignedId,
        "order_id": orderId,
        "weight": weight,
        "order_price": orderPrice,
      };

      final response = await _dio.put(
        "update_weight.php",
        data: jsonEncode(body),
        options: Options(
          headers: {
            "Security-Token": token,
            "Content-Type": "application/json",
          },
        ),
      );

      print("📤 Weight Update Response: ${response.data}");

      if (response.statusCode == 200) {
        return UpdateWeightResponse.fromJson(response.data);
      } else {
        throw Exception("❌ Failed: ${response.statusMessage}");
      }
    } catch (e) {
      print("❌ Exception in updateOrderWeight: $e");
      rethrow; // or handle and return custom error model
    }
  }
  //driver update - simplified for essential fields only

  static Future<Map<String, dynamic>> updateDriver({
    required Map<String, dynamic> body,
  }) async {
    const String baseUrl = "http://10.0.2.2:8000/driver_api/";

    try {
      Dio dio = Dio();

      // Build data map - only include non-empty values
      Map<String, dynamic> dataMap = {};

      body.forEach((key, value) {
        if (value != null && value.toString().isNotEmpty) {
          dataMap[key] = value;
        }
      });

      print("📤 Update Driver Request URL: ${baseUrl}update_driver.php");
      print("📤 Update Driver Data: $dataMap");

      final response = await dio.post(
        '${baseUrl}update_driver.php',
        data: dataMap,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      print("📥 Update Driver Response: ${response.data}");

      return response.data;
    } catch (e) {
      print("❌ Update Driver Error: $e");
      throw Exception('Failed to update driver: $e');
    }
  }

  //rider profile update
  Future<Response> updateRiderProfile({
    required String riderId,
    String? name,
    String? email,
    String? phone,
    required String securityToken,
  }) async {
    const String baseUrl = "http://10.0.2.2:8000/rider_api/";

    try {
      // Build data map with only non-empty fields
      final Map<String, dynamic> data = {
        "id": riderId,
      };

      // Only add fields that have values
      if (name != null && name.trim().isNotEmpty) {
        data["rider_name"] = name.trim();
      }
      if (email != null && email.trim().isNotEmpty) {
        data["rider_email"] = email.trim();
      }
      if (phone != null && phone.trim().isNotEmpty) {
        data["rider_phone"] = phone.trim();
      }

      print("📤 Update Rider Request Data: $data");

      final response = await _dio.put(
        "${baseUrl}update_rider.php",
        data: data,
        options: Options(
          headers: {
            "Security-Token": securityToken,
            "Content-Type": "application/json",
          },
        ),
      );

      print("📤 Update Rider Response: ${response.data}");

      if (response.statusCode == 200 &&
          response.data["ResponseCode"] == "200") {
        print("✅ Rider updated successfully");
      } else {
        throw Exception(
            "❌ Failed to update rider: ${response.data["ResponseMsg"]}");
      }

      return response;
    } catch (e) {
      print("❌ Error in updateRiderProfile: $e");
      rethrow;
    }
  }

  /// ✅ **Fetch Pickup Order Details**
  Future<PickupOrderResponse> getOrderById({
    required int orderId,
    required int driverAssignedId, // ✅ Correct Field Name
  }) async {
    try {
      String? securityToken = _storage.read("StoreLogin")?["security_token"];
      if (securityToken == null || securityToken.isEmpty) {
        throw Exception("❌ Missing Security Token");
      }

      print(
          "🔍 Fetching Order ID: $orderId, Driver Assigned ID (Sent as `assign_driver_id`): $driverAssignedId");

      Response response = await _dio.post(
        "get_order_by_id.php",
        data: {
          // "order_id": orderId,
          "order_q_id": orderId,
          "assign_driver_id":
              driverAssignedId, // ✅ Fix: Sent as `assign_driver_id`
        },
        options: Options(headers: {"Security-Token": securityToken}),
      );

      if (response.statusCode == 200) {
        print("✅ Order details fetched successfully");

        PickupOrderResponse pickupOrderResponse =
            PickupOrderResponse.fromJson(response.data);

        print(
            "✅ Response Driver ID (Received as `driver_assigned_id`): ${pickupOrderResponse.pickupOrderDetails?.driverAssignedId}");
        return pickupOrderResponse;
      } else {
        throw Exception("❌ Failed to fetch order: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("❌ Error fetching pickup order: $e");
    }
  }

  Future<StatusUpdateResponse?> updateRiderStatus({
    required String riderId,
    required String status,
  }) async {
    const url = 'http://10.0.2.2:8000/rider_api/rider_status_update.php';

    try {
      final response = await _dio.post(url, data: {
        "rider_id": riderId,
        "status_msg": status,
      });

      if (response.statusCode == 200) {
        return StatusUpdateResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("❌ API Error: $e");
      return null;
    }
  }

  /// ✅ **Update Pickup Order Status**
  Future<bool> updatePickupOrderStatus({
    required int orderId,
    required String status,
    required int driverId,
    required String securityToken,
  }) async {
    try {
      print(
          "🔄 Updating Order ID: $orderId to Status: $status | Sending Driver ID as `driver_id`: $driverId");

      Response response = await _dio.put(
        // ✅ Using PUT for update
        "complete_order.php",
        data: {
          "order_id": orderId,
          "status": status,
          "driver_id": driverId,
        },
        options: Options(headers: {"Security-Token": securityToken}),
      );

      if (response.statusCode == 200 &&
          response.data["ResponseCode"] == "200") {
        print("✅ Order status updated successfully");
        return true;
      } else {
        throw Exception(
            "❌ Failed to update order: ${response.data["ResponseMsg"]}");
      }
    } catch (e) {
      throw Exception("❌ Error updating pickup order: $e");
    }
  }

// ✅ **Send Help Request API (Fixed Conflict)**
  Future<HelpStatusResponse> sendHelpStatus({
    required int orderId,
    required String helpStatus,
    required int driverId,
    required String securityToken,
  }) async {
    try {
      Response response = await _dio.put(
        // ✅ No need to change 'Response'
        "help_status.php",
        data: {
          "order_id": orderId,
          "help_status": helpStatus,
          "driver_id": driverId,
        },
        options: Options(headers: {
          "Security-Token": securityToken
        }), // ✅ No need to change 'Options'
      );

      if (response.statusCode == 200) {
        return HelpStatusResponse.fromJson(response.data);
      } else {
        throw Exception(
            "❌ Failed to send help status: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("❌ Error sending help status: $e");
    }
  }

  /// ✅ **Update Order API Call**
  // Future<UpdateOrderResponse> updateOrder({
  //   required int orderId,
  //   required int driverAssignedId,
  //   required Map<String, dynamic> orderData,
  //   required String securityToken,
  // }) async {
  //   try {
  //     // ✅ Add required fields to the request body
  //     orderData.addAll({
  //       "id": orderId,
  //       "driver_assigned_id": driverAssignedId,
  //     });

  //     Response response = await _dio.put(
  //       "update_order.php",
  //       data: orderData,
  //       options: Options(
  //         headers: {"Security-Token": securityToken},
  //       ),
  //     );

  //     // ✅ Check if request was successful
  //     if (response.statusCode == 200) {
  //       return UpdateOrderResponse.fromJson(response.data);
  //     } else {
  //       throw Exception("❌ Failed to update order: ${response.statusMessage}");
  //     }
  //   } catch (e) {
  //     throw Exception("❌ Error updating order: $e");
  //   }
  // }}
  // Future<UpdateOrderResponse> updateOrder({
  //   required int orderId,
  //   required int driverAssignedId,
  //   required String paymentStatus,
  //   required String paymentType,
  //   required int amountCollected,
  //   required int totalBags,
  //   required Map<String, dynamic> orderData,
  //   required String securityToken,
  // }) async {
  //   orderData.addAll({
  //     "id": orderId,
  //     "driver_assigned_id": driverAssignedId,
  //     "amount_collected": amountCollected,
  //     "payment_status": paymentStatus,
  //     "payment_type": paymentType,
  //     "total_bags": totalBags,
  //   });
  //   print("💀💀 Debbug :: $orderData");
  //
  //   return UpdateOrderResponse.fromJson(orderData);
//     try {
//       // Add required fields to the request body
//       orderData.addAll({
//         "id": orderId,
//         "driver_assigned_id": driverAssignedId,
//         "amount_collected": amountCollected,
//         "payment_status": paymentStatus,
//         "payment_type": paymentType,
//         "total_bags": totalBags,
//       });
// // 🟡 Print the outgoing request data
//       print("📤 PUT request to update_order.php");
//       print("🔐 Security-Token: $securityToken");
//       print("📦 Payload: $orderData");
//       Response response = await _dio.put(
//         "update_order.php",
//         //data: orderData,
//         data: jsonEncode(orderData),
//         options: Options(
//           headers: {
//             "Security-Token": securityToken,
//             "Content-Type": "application/json",
//           },
//         ),
//       );
// // //     final rawData = response.data.toString();
// // //     final parsed = jsonDecode(rawData);
// //  print('Raw response: ${response.data}');
// // //     print("✅ Parsed Response: $parsed");
// //  //🟢 //Print the raw API response
// //     print("✅ Response status code: ${response.statusCode}");
// //     print("📨 Response data: ${response.data}");
// //
// //     // Check if request was successful
// //     if (response.statusCode == 200) {
// //       return UpdateOrderResponse.fromJson(response.data);
// //     } else {
// //       throw Exception("Failed to update order: ${response.statusMessage}");
// //     }
// //   } catch (e) {
// //     throw Exception("Error updating order: $e");
// //   }
//       final rawData =
//           response.data is String ? response.data : jsonEncode(response.data);
//       final parsed = jsonDecode(rawData);
//       print("✅ Parsed Response: $parsed");

//       if (parsed["ResponseCode"] == "200") {
//         return UpdateOrderResponse.fromJson(
//             parsed); // make sure your model matches
//       } else {
//         throw Exception("Update failed: ${parsed["title"]}");
//       }
//     } catch (e) {
//       throw Exception("Error updating order: $e");
//     }
//   }
  Future<UpdateOrderResponse> updateOrder({
    int? orderId,
    int? driverAssignedId,
    String? paymentStatus,
    String? paymentType,
    int? amountCollected,
    int? totalBags,
    required Map<String, dynamic> orderData,
    required String securityToken,
  }) async {
    try {
      // Add values only if provided
      if (orderId != null) orderData["id"] = orderId;
      if (driverAssignedId != null) {
        orderData["driver_assigned_id"] = driverAssignedId;
      }
      if (amountCollected != null) {
        orderData["amount_collected"] = amountCollected;
      }
      if (paymentStatus != null) {
        orderData["payment_status"] = paymentStatus;
      }
      if (paymentType != null) {
        orderData["payment_type"] = paymentType;
      }
      if (totalBags != null) {
        orderData["total_bags"] = totalBags;
      }

      print("📤 PUT request → update_order.php");
      print("🔐 Security-Token: $securityToken");
      print("📦 Payload sent: $orderData");

      final response = await _dio.put(
        "update_order.php",
        data: jsonEncode(orderData),
        options: Options(
          headers: {
            "Security-Token": securityToken,
            "Content-Type": "application/json",
          },
        ),
      );

      print("📥 Raw Response: ${response.data}");

      final parsed =
          response.data is String ? jsonDecode(response.data) : response.data;

      print("✅ Parsed Response: $parsed");

      if (parsed["ResponseCode"] == "200") {
        return UpdateOrderResponse.fromJson(parsed);
      } else {
        throw Exception("Update failed: ${parsed["title"]}");
      }
    } catch (e) {
      throw Exception("Error updating order: $e");
    }
  }

  //earning history
  Future<Map<String, dynamic>> getDriverEarnings(
      int driverId, String token) async {
    final resp = await _dio.post(
      'get_earning_driver.php',
      data: {'driver_id': driverId},
      options: Options(
        headers: {'Security-Token': token, 'Content-Type': 'application/json'},
      ),
    );
    final parsed = resp.data is String ? jsonDecode(resp.data) : resp.data;
    return parsed['Data'] as Map<String, dynamic>;
  }

  /// ✅ Upload Confirm Order Image
// Future<bool> uploadConfirmOrderPic({
//   required int driverId,
//   required int orderId,
//   required File imageFile,
// }) async {
//   try {
//     // 🔐 Get security token from storage
//     String? securityToken = _storage.read("StoreLogin")?["security_token"];
//     if (securityToken == null || securityToken.isEmpty) {
//       throw Exception("❌ Missing security token");
//     }

//     String fileName = imageFile.path.split('/').last;

//     FormData formData = FormData.fromMap({
//       "driver_id": driverId.toString(),
//       "order_id": orderId.toString(),
//       "confirm_order_pic": await MultipartFile.fromFile(
//         imageFile.path,
//         filename: fileName,
//       ),
//     });

//     final response = await _dio.post(
//       "confirm_order_img.php",
//       data: formData,
//       options: Options(
//         headers: {
//           "Security-Token": securityToken,
//           "Content-Type": "multipart/form-data",
//         },
//       ),
//     );

//     print("📤 Upload Response: ${response.data}");

//     if (response.statusCode == 200 &&
//         response.data['response_code'] == "200") {
//       print("✅ Image uploaded successfully");
//       return true;
//     } else {
//       print("❌ Upload failed: ${response.data['response_message']}");
//       return false;
//     }
//   } catch (e) {
//     print("❌ Exception during image upload: $e");
//     return false;
//   }
// }
  Future<Response> uploadConfirmOrderPic({
    required int driverId,
    required int orderId,
    required File imageFile,
  }) async {
    try {
      String? securityToken = _storage.read("StoreLogin")?["security_token"];
      if (securityToken == null || securityToken.isEmpty) {
        throw Exception("❌ Missing security token");
      }

      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "driver_id": driverId.toString(),
        "order_id": orderId.toString(),
        "confirm_order_pic": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        "confirm_order_img.php",
        data: formData,
        options: Options(
          headers: {
            "Security-Token": securityToken,
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      print("📤 Upload Response: ${response.data}");
      return response; // Return full Response object
    } catch (e) {
      print("❌ Exception during image upload: $e");
      rethrow; // Exception ko aage bhej dein taake caller handle kar sake
    }
  }
}
