import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/controller/currency_controller.dart';
import 'package:deliveryboy/controller/login_controller.dart';
import 'package:deliveryboy/helpar/routes_helper.dart';
import 'package:deliveryboy/notificaition_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'helpar/get_di.dart' as di;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Handling a background message ${message.data}');
  await Firebase.initializeApp();
  await NotificationsRepo().initLocalNotifications();
  await NotificationsRepo().showNotifications(message);
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationsRepo().initLocalNotifications();
  await NotificationsRepo().initNotifications();
  NotificationsRepo().firebaseInit();
  Get.put(LoginController());
  await Firebase.initializeApp();
  await GetStorage.init();
  await di
      .init(); // ✅ Ensuring dependencies are initialized before running the app

  final CurrencyController currencyController =
      Get.put(CurrencyController()); // ✅ Register CurrencyController
  await currencyController
      .loadCurrency(); // ✅ Load saved currency before app starts

  runApp(MyApp()); // ✅ Ensure GetMaterialApp is fully loaded first
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FastLaundry Rider App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        // primarySwatch: primeryColor,
        primarySwatch: Colors.cyan,
        fontFamily: "Gilroy",
      ),
      initialRoute: getData.read('Remember') != true
          ? Routes.driverLoginScreen
          : Routes.bottombarscreen, // ✅ Corrected Initial Route
      getPages: getPages, // ✅ Ensure all routes are registered
    );
  }
}
