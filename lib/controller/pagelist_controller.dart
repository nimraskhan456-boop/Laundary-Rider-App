// ignore_for_file: avoid_print, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/model/pagelist_info.dart';
import 'package:deliveryboy/utils/Custom_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:http/http.dart' as http;

import '../Api/dio_api.dart';

class PageListController extends GetxController implements GetxService {
  DynamicPageData? dynamicPageData;
  bool isLodding = false;
  final dioApi = Api();
  PageListController() {
    getPageListData();
  }

  getPageListData() async {
    try {
      String uri = Config.path + Config.pageListApi;
      var response = await dioApi.sendRequest.post(uri);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        print(result.toString());
        dynamicPageData = DynamicPageData.fromJson(result);
        isLodding = true;
        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  deletAccount() async {
    try {
      Map map = {
        "rider_id": getData.read("StoreLogin")["id"].toString(),
      };
      print(map.toString());
      String uri = Config.path + Config.deletAccount;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        // showToastMessage(result["ResponseMsg"]);
      }
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
