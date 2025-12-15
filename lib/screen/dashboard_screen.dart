import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/controller/dashboard_controller.dart';
import 'package:deliveryboy/controller/login_controller.dart';
import 'package:deliveryboy/screen/UpdateDriverScreen.dart';
import 'package:deliveryboy/screen/assigned_orders_screen.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:deliveryboy/screen/update_rider_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GetStorage _storage = GetStorage();
  final DashboardController dashboardController =
      Get.put(DashboardController());
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //String driverAssignedId = (_storage.read("StoreLogin")?["driver_assigned_id"] ?? 0).toString();
      int driverAssignedId =
          int.tryParse(_storage.read("StoreLogin")?["id"]?.toString() ?? '0') ??
              0;

      String securityToken =
          (_storage.read("StoreLogin")?["security_token"] ?? "").toString();

      print(
          "🚚 Driver Assigned ID: $driverAssignedId, Security Token: $securityToken");

      dashboardController.fetchNormalOrders(driverAssignedId, securityToken);
      dashboardController.fetchCompletedOrders(driverAssignedId, securityToken);
    });
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index == 1) {
      Get.to(() => AssignedOrdersScreen());
    } else if (index == 2) {
      Get.to(() => UpdateDriverScreen()); // 👈 Navigate to Profile Screen
    }
  }

  @override
  Widget build(BuildContext context) {
    String driverName = _storage.read("StoreLogin")?["name"] ?? "Driver";

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 220,
              padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40),
              decoration: BoxDecoration(
                // color: Color(0xFF0057FF),
                color: primeryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: whiteColor,
                            ),
                            child:
                                Image.asset('assets/appLogo.png', height: 40),
                          ),
                          // SizedBox(width: 10),
                          // Text(
                          //   "SoftLaundry",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 22,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.notifications,
                                color: Colors.white, size: 28),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.logout,
                                color: Colors.white, size: 28),
                            onPressed: () {
                              // _loginController.handleLogout();
                              // void handleLogout() {
                              _storage.remove("StoreLogin");
                              _storage.remove("securityToken");
                              save('Remember', false);
                              Get.offAll(() => DriverLoginScreen());
                              // }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Hello, Welcome Back",
                      style: TextStyle(color: Colors.white70, fontSize: 16)),
                  Text(
                    driverName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            /// ✅ Display Order Cards with Live Data from API
            Positioned(
              top: 180,
              left: 20,
              right: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(() => _buildOrderCard(
                        "Normal Order",
                        //dashboardController.isLoading.value
                        dashboardController.isLoadingNormal.value
                            ? "..."
                            : dashboardController.normalOrdersCount.toString(),
                        Icons.shopping_bag)),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Obx(() => _buildOrderCard(
                        "Completed Order",
                        //dashboardController.isLoading.value
                        dashboardController.isLoadingCompleted.value
                            ? "..."
                            : dashboardController.completedOrdersCount
                                .toString(),
                        Icons.check_circle)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.dashboard), label: "Dashboard"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_bag), label: "My Orders"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color(0xFF0057FF),
      //   onTap: _onItemTapped,
      // ),
    );
  }

  Widget _buildOrderCard(String title, String count, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon, size: 40,
            // color: Color(0xFF0057FF),
            color: primeryColor,
          ),
          SizedBox(height: 10),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 5),
          Text(
            count,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // color: Color(0xFF0057FF),
              color: primeryColor,
            ),
          ),
        ],
      ),
    );
  }
}
