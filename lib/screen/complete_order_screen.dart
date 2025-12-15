// import 'package:deliveryboy/controller/order_completion_controller.dart';
// import 'package:deliveryboy/model/orders_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class CompleteOrderScreen extends StatelessWidget {
//   final CompleteOrderController _completeOrderController = Get.put(CompleteOrderController());
//   final TextEditingController _signatureController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     OrderData order = Get.arguments; // Receiving the order
//     String securityToken = GetStorage().read("StoreLogin")?['security_token'] ?? ''; // ✅ Retrieve Token

//     return Scaffold(
//       appBar: AppBar(title: Text("Complete Order")),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Completing Order #${order.orderQId ?? 'N/A'}",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             TextField(
//               controller: _signatureController,
//               decoration: InputDecoration(labelText: "Enter Signature Image URL"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _completeOrderController.isLoading.value
//                   ? null
//                   : () {
//                       if (order.orderQId != null) {
//                         _completeOrderController.completeOrder(
//                           orderID: order.orderQId!,
//                           image: _signatureController.text,
//                           token: securityToken,
//                         );
//                       } else {
//                         Get.snackbar("Error", "Order ID is missing!", snackPosition: SnackPosition.BOTTOM);
//                       }
//                     },
//               child: Obx(() => _completeOrderController.isLoading.value
//                   ? CircularProgressIndicator()
//                   : Text("Submit")),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:deliveryboy/controller/laundryPickupController.dart';
// import 'package:deliveryboy/screen/earning_and_tips_screen.dart';
//
// class CompletedScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//   final String securityToken;
//
//   const CompletedScreen({
//     required this.orderId,
//     required this.driverAssignedId,
//     required this.securityToken,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CompletedScreen> createState() => _CompletedScreenState();
// }
//
// class _CompletedScreenState extends State<CompletedScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue[50],
//       body: Obx(() {
//         final order = controller.pickupOrderDetails.value;
//
//         return order == null
//             ? Center(child: CircularProgressIndicator())
//             : Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Completed", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//               SizedBox(height: 20),
//               Icon(Icons.check_circle, color: Colors.green, size: 100),
//               SizedBox(height: 30),
//               Text("Earned:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900])),
//               Text("\$${order.orderPrice ?? "0.00"}", style: TextStyle(fontSize: 20, color: Colors.blue[900])),
//               SizedBox(height: 10),
//               Text("Tip:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900])),
//               Text("\$5", style: TextStyle(fontSize: 20, color: Colors.blue[900])),
//               SizedBox(height: 10),
//               Text("Total", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900])),
//               Text("\$${(double.tryParse(order.orderPrice ?? "0") ?? 0) + 5}", style: TextStyle(fontSize: 20, color: Colors.blue[900])),
//               SizedBox(height: 40),
//               Divider(thickness: 2),
//               Text("Menu", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//               SizedBox(height: 15),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => EarningAndTripsScreen(
//                         // orderId: widget.orderId,
//                         // driverAssignedId: widget.driverAssignedId,
//                         driverId: widget.driverAssignedId,
//                         securityToken: widget.securityToken,
//
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text("Go to Earning History"),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
//090909
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:deliveryboy/controller/laundryPickupController.dart';
// import 'package:deliveryboy/screen/earning_and_tips_screen.dart';
//
// class CompletedScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//   final String securityToken;
//
//   const CompletedScreen({
//     required this.orderId,
//     required this.driverAssignedId,
//     required this.securityToken,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CompletedScreen> createState() => _CompletedScreenState();
// }
//
// class _CompletedScreenState extends State<CompletedScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Obx(() {
//         final order = controller.pickupOrderDetails.value;
//
//         return order == null
//             ? const Center(child: CircularProgressIndicator())
//             : SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Icon(Icons.check_circle, color: Colors.green, size: 100),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Order Completed",
//                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 30),
//
//                 Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       children: [
//                         _buildRow("Earned", "\$${order.orderPrice ?? "0.00"}"),
//                         const SizedBox(height: 8),
//                         _buildRow("Tip", "\$5"),
//                         const Divider(height: 30),
//                         _buildRow(
//                           "Total",
//                           "\$${(double.tryParse(order.orderPrice ?? "0") ?? 0) + 5}",
//                           isBold: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 const Text(
//                   "Menu",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => EarningAndTripsScreen(
//                           driverId: widget.driverAssignedId,
//                           securityToken: widget.securityToken,
//                         ),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.arrow_forward),
//                   label: const Text("Go to Earning History"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueAccent,
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _buildRow(String label, String value, {bool isBold = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 18, fontWeight: isBold ? FontWeight.bold : FontWeight.w500),
//         ),
//         Text(
//           value,
//           style: TextStyle(fontSize: 18, fontWeight: isBold ? FontWeight.bold : FontWeight.w400),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliveryboy/controller/laundryPickupController.dart';
import 'package:deliveryboy/screen/earning_and_tips_screen.dart';

class CompletedScreen extends StatefulWidget {
  final int orderId;
  final int driverAssignedId;
  final String securityToken;

  const CompletedScreen({
    required this.orderId,
    required this.driverAssignedId,
    required this.securityToken,
    Key? key,
  }) : super(key: key);

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  final LaundryPickupController controller = Get.put(LaundryPickupController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchPickupOrderDetails(
          widget.orderId, widget.driverAssignedId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Order Completed",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Obx(() {
        final order = controller.pickupOrderDetails.value;

        return order == null
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 80),
                      const SizedBox(height: 16),
                      const Text(
                        "Order Completed Successfully",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _buildRow("Earned",
                                "\$${order.deliveryCharges ?? "0.00"}"),
                            const SizedBox(height: 10),
                            _buildRow("Tip", "\$5"),
                            const Divider(height: 32),
                            _buildRow(
                              "Total",
                              "\$${(double.tryParse(order.deliveryCharges ?? "0") ?? 0) + 5}",
                              isBold: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EarningAndTripsScreen(
                                driverId: widget.driverAssignedId,
                                securityToken: widget.securityToken,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Go to Earning History"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
      }),
      bottomSheet: Container(
        width: double.infinity,
        // height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EarningAndTripsScreen(
                  driverId: widget.driverAssignedId,
                  securityToken: widget.securityToken,
                ),
              ),
            );
          },
          icon: const Icon(Icons.home_outlined),
          label: const Text("Home"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
