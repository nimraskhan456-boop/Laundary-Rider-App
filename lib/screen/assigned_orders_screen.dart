import 'package:deliveryboy/controller/order_controller.dart';
import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'order_details_screen.dart';

class AssignedOrdersScreen extends StatelessWidget {
  final OrderController _orderController =
      Get.put(OrderController(), permanent: true);
  final GetStorage _storage = GetStorage();

  AssignedOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? storedDriverId = _storage.read("StoreLogin")?["id"]?.toString();
    String? storedSecurityToken =
        _storage.read("StoreLogin")?["security_token"]?.toString();

    if (storedDriverId != null && storedSecurityToken != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _orderController.fetchOrders(
            driverId: storedDriverId,
            status: "pending",
            token: storedSecurityToken);
        _orderController.fetchOrders(
            driverId: storedDriverId,
            status: "completed",
            token: storedSecurityToken);
      });
    } else {
      debugPrint("❌ Error: Missing Security Token or Driver ID!");
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Orders",
            style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
          ),
          backgroundColor: primeryColor,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Current Orders"),
              Tab(text: "Past Orders"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrdersList(showCurrentOrders: true),
            _buildOrdersList(showCurrentOrders: false),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList({required bool showCurrentOrders}) {
    return Obx(() {
      if (_orderController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (_orderController.orderInfo.isEmpty) {
        return const Center(child: Text("No Orders Available"));
      }

      var filteredOrders = _orderController.orderInfo.where((order) {
        String status = order.orderStatus.toLowerCase();
        String orderDriverId = order.driverAssignedId.toString();
        String storedDriverId =
            _storage.read("StoreLogin")?["id"]?.toString() ?? "";

        bool isAssignedToDriver = orderDriverId == storedDriverId;

        return isAssignedToDriver &&
            (showCurrentOrders
                ? (status == "pending" ||
                    status == "on the way" ||
                    status == "confirmed" ||
                    status == "in_process" ||
                    status == "ready" ||
                    status == "in delivery")
                : (status == "completed" || status == "cancelled"));
      }).toList();

      if (filteredOrders.isEmpty) {
        return const Center(child: Text("No Matching Orders"));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: filteredOrders.length,
        itemBuilder: (context, index) {
          return _buildOrderCard(filteredOrders[index]);
        },
      );
    });
  }

  Widget _buildOrderCard(order) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.orderTime?.toString() ?? "Unknown Date",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                _getStatusWidget(order.orderStatus),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Order ID: #${order.orderId?.toString() ?? 'N/A'}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Order Type: ${order.orderType?.toString() ?? 'N/A'}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Customer: ${order.customer?.name?.toString() ?? "Unknown"}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.store, color: primeryColor),
                const SizedBox(width: 10),
                Text(
                  order.laundromatDetails?.name?.toString() ??
                      "Unknown Laundry",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const Spacer(),
                Text(
                  "\$${order.orderPrice?.toString() ?? '0.00'}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primeryColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                order.orderStatus == "pending"
                    ? Expanded(
                        child: InkWell(
                          onTap: () {
                            // ticketCancell(order.id ?? "");
                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: RedColor,
                            ),
                            child: Text(
                              "Cancle".tr,
                              style: TextStyle(
                                fontFamily: FontFamily.gilroyMedium,
                                color: WhiteColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Get.to(() => OrderDetailsScreen(),
                          arguments:
                              order); // Make sure you're passing the correct Order object
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: gradient.btnGradient,
                      ),
                      child: Text(
                        "Info".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyMedium,
                          color: WhiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     // Store Order ID & Driver Assigned ID in GetStorage
            //     Get.to(() => OrderDetailsScreen(),
            //         arguments:
            //             order); // Make sure you're passing the correct Order object
            //   },
            //   icon: const Icon(Icons.info, color: Colors.white),
            //   label: const Text("Info"),
            //   style:
            //       ElevatedButton.styleFrom(backgroundColor: Color(0xFF0057FF)),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _getStatusWidget(String? status) {
    if (status == null) return const Text("Unknown");

    const Map<String, dynamic> statusData = {
      "pending": {
        "icon": Icons.hourglass_empty,
        "color": Colors.orange,
        "text": "Pending"
      },
      "on the way": {
        "icon": Icons.directions_car,
        "color": Colors.blue,
        "text": "On The Way"
      },
      "confirmed": {
        "icon": Icons.check_circle,
        "color": Colors.green,
        "text": "Confirmed"
      },
      "in_process": {
        "icon": Icons.sync,
        "color": Colors.amber,
        "text": "In process"
      },
      "ready": {"icon": Icons.done_all, "color": Colors.blue, "text": "Ready"},
      "in delivery": {
        "icon": Icons.delivery_dining,
        "color": Colors.purple,
        "text": "In Delivery"
      },
      "completed": {
        "icon": Icons.check_circle,
        "color": Colors.green,
        "text": "Completed"
      },
      "cancelled": {
        "icon": Icons.cancel,
        "color": Colors.red,
        "text": "Cancelled"
      },
    };

    final data = statusData[status.toLowerCase()] ??
        {"icon": Icons.error, "color": Colors.grey, "text": "Unknown"};

    return Row(
      children: [
        Icon(data["icon"] as IconData, size: 16, color: data["color"] as Color),
        const SizedBox(width: 5),
        Text(data["text"] as String,
            style: TextStyle(
                color: data["color"] as Color, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
