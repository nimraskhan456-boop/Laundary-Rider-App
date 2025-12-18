import 'package:dio/dio.dart';

import '../dio_api.dart';

class NotificationRepo {
  // static final dioApi = Api();

  static Future<dynamic> sendNotification(
      {String? channelName,
      required String targetid,
      required String role,
      required String uid,
      required String touserType,
      String? body}) async {
    try {
      final Dio dio = Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
      };
      dio.options.responseType = ResponseType.plain;
      final String uri =
          "http://93.127.202.7/token.php?channelName=$channelName&target_id=$targetid&user_type=$role&uid=$uid&body=$body&touserType=$touserType";

      var response = await dio.post(uri);

      //print("🔹 Login API Response: $response");

      if (response.statusCode == 200) {
        //  print("✅ Login Successful! Saving user data...");
        return response.data;

        //print("🔍 Checking Token After Saving: ${await userPreference.getToken()}");
      } else {
        return null;
        //print("🚨 Login Failed: ${response["ResponseMsg"]}");
      }

      // return response; // Return response to UI
    } catch (e) {
      print("❌ Login Error: $e");
      return null;
    }
  }
}
