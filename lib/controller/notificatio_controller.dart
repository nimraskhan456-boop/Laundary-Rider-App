// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/model/notification_info.dart';
import 'package:get/get.dart';

import '../Api/dio_api.dart';

class NotificationController extends GetxController implements GetxService {
  NotificationInfo? notificationInfo;
  bool isLoading = false;
  final dioApi = Api();
  getNotificationData() async {
    try {
      Map map = {
        "rider_id": getData.read("StoreLogin")["id"].toString(),
      };
      String uri = Config.path + Config.notificationApi;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        notificationInfo = NotificationInfo.fromJson(result);
      }
      isLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
