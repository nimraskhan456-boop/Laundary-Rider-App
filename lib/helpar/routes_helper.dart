// // // ignore_for_file: prefer_const_constructors

// // import 'package:deliveryboy/screen/myorder_screen.dart';
// // import 'package:deliveryboy/screen/orderdetails_screen.dart';
// // import 'package:deliveryboy/screen/subscription_order.dart';
// // import 'package:deliveryboy/screen/subscriptiondetails_screen.dart';
// // import 'package:get/get.dart';

// // class Routes {
// //   static String initial = "/";
// //   static String myBookingScreen = "/myBookingScreen";
// //   static String orderDetailsScreen = "/orderDetailsScreen";
// //   static String myPriscriptionOrder = "/MyPriscriptionOrder";
// //   static String myPriscriptionInfo = "/MyPriscriptionInfo";
// // }

// // final getPages = [
// //   // GetPage(
// //   //   name: Routes.initial,
// //   //   // page: () => onbording(),
// //   // ),
// //   GetPage(
// //     name: Routes.myBookingScreen,
// //     page: () => MyBookingScreen(isBack: "1"),
// //   ),
// //   GetPage(
// //     name: Routes.orderDetailsScreen,
// //     page: () => OrderdetailsScreen(),
// //   ),
// //   GetPage(
// //     name: Routes.myPriscriptionOrder,
// //     page: () => MyPriscriptionOrder(isBack: "1"),
// //   ),
// //   GetPage(
// //     name: Routes.myPriscriptionInfo,
// //     page: () => MyPriscriptionInfo(),
// //   ),
// // ];
// import 'package:deliveryboy/screen/login_screen.dart';
// import 'package:deliveryboy/screen/dashboard_screen.dart';
// import 'package:deliveryboy/screen/myorder_screen.dart';
// import 'package:deliveryboy/screen/orderdetails_screen.dart';
// import 'package:deliveryboy/screen/subscription_order.dart';
// import 'package:deliveryboy/screen/subscriptiondetails_screen.dart';
// import 'package:get/get.dart';

// class Routes {
//   static String initial = "/LoginScreen"; // ✅ Ensure correct initial route
//   static String DriverLoginScreen = "/LoginScreen";
//   static String dashboardScreen = "/dashboardScreen";
//   static String myBookingScreen = "/myBookingScreen";
//   static String orderDetailsScreen = "/orderDetailsScreen";
//   static String myPriscriptionOrder = "/myPriscriptionOrder";
//   static String myPriscriptionInfo = "/myPriscriptionInfo";
// }

// final getPages = [
//   GetPage(
//     name: Routes.DriverLoginScreen,
//     page: () => DriverLoginScreen(),
//   ),
//   GetPage(
//     name: Routes.dashboardScreen,
//     page: () => DashBoardScreen(),
//   ),
//   GetPage(
//     name: Routes.myBookingScreen,
//     page: () => MyBookingScreen(isBack: "1"),
//   ),
//   GetPage(
//     name: Routes.orderDetailsScreen,
//     page: () => OrderdetailsScreen(),
//   ),
//   GetPage(
//     name: Routes.myPriscriptionOrder,
//     page: () => MyPriscriptionOrder(isBack: "1"),
//   ),
//   GetPage(
//     name: Routes.myPriscriptionInfo,
//     page: () => MyPriscriptionInfo(),
//   ),
// ];
import 'package:deliveryboy/screen/PickupConfirmationScreen.dart';
import 'package:deliveryboy/screen/arivedatlaundry.dart';
import 'package:deliveryboy/screen/become.dart';
import 'package:deliveryboy/screen/bottombar_screen.dart';
import 'package:deliveryboy/screen/dashboard_screen.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:deliveryboy/screen/assigned_orders_screen.dart';
import 'package:deliveryboy/screen/order_details_screen.dart';
import 'package:deliveryboy/screen/profile_screen.dart';
import 'package:deliveryboy/screen/registeration_screen.dart';
import 'package:deliveryboy/screen/LaundryPickupDetailsScreen.dart';
// import 'package:deliveryboy/screen/subscription_order.dart';
// import 'package:deliveryboy/screen/subscriptiondetails_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String initial =
      "/driverLoginScreen"; // ✅ Ensure correct initial route
  static String driverLoginScreen = "/driverLoginScreen";

  static const String BecomeDriverForm =
      '/BecomeDriverForm'; // ✅ Corrected Name
  static String dashboardScreen = "/dashboardScreen";
  static String bottombarscreen = "/bottomBarScreen";
  static String myBookingScreen = "/myBookingScreen";
  static String orderDetailsScreen = "/orderDetailsScreen";
  static String LaundryDetailsScreen = "/LaundryDetailsScreen";
  static String ArrivedAtLaundryScreen = '/ArrivedAtLaundryScreen';
  static String ConfirmPickupScreen = '/ConfirmPickupScreen';
  static String myPriscriptionOrder = "/myPriscriptionOrder";
  static String myPriscriptionInfo = "/myPriscriptionInfo";
  static String registrationSceen = "/driverRegistrationScreen";
  static String profileScreen = "/profileScreen";
}

final getPages = [
  GetPage(
    name: Routes.driverLoginScreen,
    page: () => DriverLoginScreen(),
  ),
  GetPage(
    name: Routes.BecomeDriverForm,
    page: () => BecomeDriverForm(),
  ),
  GetPage(
    name: Routes.bottombarscreen,
    page: () => BottoBarScreen(),
  ),
  // GetPage(
  //   name: Routes.LaundryDetailsScreen,
  //   page: () => LaundryPickupDetailsScreen(),),
  // GetPage(
  //   name: Routes.dashboardScreen,
  //   page: () => DashBoardScreen(),
  // ),
  // GetPage(
  //   name: Routes.myBookingScreen,
  //   page: () =>AssignedOrdersScreen(),
  // ),
  // GetPage(
  //   name: Routes.orderDetailsScreen,
  //   page: () => OrderDetailsScreen(),
  // ),
  // GetPage(
  //   name: Routes.myPriscriptionOrder,
  //   page: () => MyPriscriptionOrder(isBack: "1"),
  // ),
  // GetPage(
  //   name: Routes.myPriscriptionInfo,
  //   page: () => MyPriscriptionInfo(),),
  // GetPage(
  //   name: Routes.profileScreen,
  //   page: () => ProfileScreen(),
  // ),
  // GetPage(
  //   name: Routes.ArrivedAtLaundryScreen,
  //   page: () => ArrivedAtLaundryScreen(),
  // ),
  // GetPage(
  //   name: Routes.ConfirmPickupScreen,
  //   page: () => ConfirmPickupScreen(),
  // ),
];
