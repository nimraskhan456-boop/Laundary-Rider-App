import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    // tabController = TabController()
  }

  void changeTab(int index) {
    currentIndex = index;
    update();
  }
}
