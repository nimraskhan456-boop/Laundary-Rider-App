class Config {
  static const String oneSignel = "****************************";
  // For iOS Simulator use: 'http://localhost:8000/'
  // For Android Emulator use: 'http://93.127.202.7:8080/'
  // For Physical Device use your computer's IP: 'http://YOUR_IP:8000/'
  static const String baseUrl = 'http://93.127.202.7/';
  static const String imageurl = baseUrl;

  // ✅ Correct Path for Driver APIs
  static const String path = baseUrl + 'driver_api/';

  // ✅ Full Login API URL
  static const String loginApi = path + "driver_login.php";

  static const String dashboard = path + 'u_dashboard.php';
  static const String myOrderApi = path + "u_order_history.php";
  static const String orderInformetion = path + "u_order_information.php";
  static const String subScriptionHistory = path + "u_subscription_history.php";
  static const String subScriptionInformetion =
      path + "d_sub_order_product_list.php";

  static const String makeDecision = path + "make_decision.php";
  static const String completeOrder = path + "complete_order.php";

  static const String preDecision = path + "sub_decision.php";
  static const String preCompleteOrder = path + "sub_complete.php";

  static const String notificationApi = path + "u_notification_list.php";

  static const String pageListApi = path + "u_pagelist.php";
  static const String deletAccount = path + "acc_delete.php";

  static const String conpleteDeliveries = path + "completedate.php";

  // ============================== COMPLAINTS RELATED APIs ==============================
  static const String submitComplaintApi = path + "submit_complaint.php";
  static const String getMyComplaintsApi = path + "get_my_complaints.php";
}
