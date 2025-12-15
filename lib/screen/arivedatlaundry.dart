
import 'package:deliveryboy/controller/riderstatuscontroller.dart';
import 'package:deliveryboy/screen/PickupConfirmationScreen.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:deliveryboy/controller/laundryPickupController.dart';
import 'package:deliveryboy/model/pickup_model.dart';

// class ArrivedAtLaundryScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//
//   ArrivedAtLaundryScreen({required this.orderId, required this.driverAssignedId});
//
//   @override
//   _ArrivedAtLaundryScreenState createState() => _ArrivedAtLaundryScreenState();
// }
//
// class _ArrivedAtLaundryScreenState extends State<ArrivedAtLaundryScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//   final GetStorage _storage = GetStorage();
//
//   @override
//   // void initState() {
//   //   super.initState();
//
//   //   print("🛑 Retrieved Order ID: ${widget.orderId}, Driver Assigned ID: ${widget.driverAssignedId}");
//
//   //   if (widget.orderId != null && widget.driverAssignedId != null) {
//   //     controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);
//   //   } else {
//   //     print("⚠️ Error: Order ID or Driver Assigned ID not found.");
//   //   }
//   // }
// @override
// void initState() {
//   super.initState();
//
//   /// ✅ **Ensure API call happens after the first frame**
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     int? orderId = widget.orderId;
//     int? driverAssignedId = widget.driverAssignedId;
//
//     print("🛑 Retrieved Order ID: $orderId, Driver Assigned ID: $driverAssignedId");
//
//     if (orderId != null && driverAssignedId != null) {
//       controller.fetchPickupOrderDetails(orderId, driverAssignedId);
//     } else {
//       print("⚠️ Error: Order ID or Driver Assigned ID not found.");
//     }
//   });
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: Obx(() => Text(
//             controller.pickupOrderDetails.value?.customerName ?? "Arrived at Laundry")),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.chat_bubble, color: whiteColor),
//               onPressed: () {}),
//           IconButton(
//               icon: Icon(Icons.call, color: whiteColor), onPressed: () {}),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         final order = controller.pickupOrderDetails.value;
//         if (order == null) {
//           return Center(child: Text("❌ No order details available"));
//         }
//
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildPickupInfo(order),
//               const SizedBox(height: 10),
//               _buildDropInfo(order),
//               const SizedBox(height: 10),
//               _buildNoteInfo(order),
//               const Spacer(),
//               _buildBottomButton(order),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _buildPickupInfo(PickupOrderDetails order) {
//     return Card(
//       color: primaryColor,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.local_laundry_service, color: primaryColor),
//                 SizedBox(width: 8),
//                 Text("Pickup",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ],
//             ),
//             Text(order.laundromatName ?? "No Laundromat Name",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             Text(order.orderAddress ?? "No Address",
//                 style: TextStyle(fontSize: 16, color:primaryColor)),
//             SizedBox(height: 5),
//             Text("\$${order.orderPrice ?? "0.00"}",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             Text("No. of Bags: ${order.totalBags ?? "N/A"}",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropInfo(PickupOrderDetails order) {
//     return Card(
//       color: primaryColor,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.home, color: primaryColor),
//                 SizedBox(width: 8),
//                 Text("Drop",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ],
//             ),
//             Text(order.customerName ?? "No Customer Name",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             Text(order.orderAddress ?? "No Drop Address",
//                 style: TextStyle(fontSize: 16, color:primaryColor)),
//             Text(
//                 "Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNoteInfo(PickupOrderDetails order) {
//     return Card(
//       color:whiteColor,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.note, color: primaryColor),
//                 SizedBox(width: 8),
//                 Text("Note",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ],
//             ),
//             Text(order.orderInstructions ?? "No instructions provided",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomButton(PickupOrderDetails order) {
//     // ✅ Retrieve the security token from GetStorage
//   String? securityToken = GetStorage().read("StoreLogin")?["security_token"];
//
//   if (securityToken == null || securityToken.isEmpty) {
//     print("❌ Error: Missing Security Token.");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Security token is missing. Please re-login."),
//         backgroundColor: Colors.red,
//       ),
//     );
//     return SizedBox.shrink(); // Hide button if token is missing
//   }
//
//   return ElevatedButton(
//     onPressed: () {
//       if (order.id == null || order.driverAssignedId == null) {
//         print("❌ Error: Missing Order ID or Driver Assigned ID.");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Order ID or Driver Assigned ID is missing."),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//
//       print("✅ Navigating to ConfirmPickupScreen - Order ID: ${order.id}, Driver Assigned ID: ${order.driverAssignedId}");
//
//       /// ✅ Safe Navigation with Arguments
//       Future.delayed(Duration.zero, () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
// //             builder: (context) => ConfirmPickupScreen(
// //               orderId: order.id!,
// //               driverAssignedId: order.driverAssignedId!,
// //                securityToken: securityToken,
// //             ),
// //           ),
// //         );
// //       });
// //     },
// //     style: ElevatedButton.styleFrom(
// //       backgroundColor: primaryColor,
// //       minimumSize: Size(double.infinity, 50),
// //     ),
// //     child: const Text(
// //       'Arrived at laundry',
// //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: whiteColor),
// //     ),
// //   );
// // }
// // }
// class ArrivedAtLaundryScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//
//   ArrivedAtLaundryScreen({required this.orderId, required this.driverAssignedId});
//
//   @override
//   _ArrivedAtLaundryScreenState createState() => _ArrivedAtLaundryScreenState();
// }
//
// class _ArrivedAtLaundryScreenState extends State<ArrivedAtLaundryScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//   final RiderStatusController ridercontroller = Get.put(RiderStatusController());
//   final GetStorage _storage = GetStorage();
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       int? orderId = widget.orderId;
//       int? driverAssignedId = widget.driverAssignedId;
//
//       print("🛑 Retrieved Order ID: $orderId, Driver Assigned ID: $driverAssignedId");
//
//       if (orderId != null && driverAssignedId != null) {
//         controller.fetchPickupOrderDetails(orderId, driverAssignedId);
//       } else {
//         print("⚠️ Error: Order ID or Driver Assigned ID not found.");
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: Obx(() => Text(
//           controller.pickupOrderDetails.value?.customerName ?? "Arrived at Laundry",
//           style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
//         )),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.chat_bubble, color: whiteColor),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.call, color: whiteColor),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         final order = controller.pickupOrderDetails.value;
//         if (order == null) {
//           return Center(child: Text("❌ No order details available"));
//         }
//
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildPickupInfo(order),
//               const SizedBox(height: 10),
//               _buildDropInfo(order),
//               const SizedBox(height: 10),
//               _buildNoteInfo(order),
//               const Spacer(),
//               _buildBottomButton(order),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _buildPickupInfo(PickupOrderDetails order) {
//     return Card(
//       color: whiteColor,
//       elevation: 6,
//       shadowColor: primaryColor.withOpacity(0.3),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.local_laundry_service, color: primaryColor),
//                 SizedBox(width: 8),
//                 Text(
//                   "Pickup",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor),
//                 ),
//               ],
//             ),
//             Text(
//               order.laundromatName ?? "No Laundromat Name",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
//             ),
//             Text(
//               order.orderAddress ?? "No Address",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "\$${order.orderPrice ?? "0.00"}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green.shade700),
//             ),
//             Text(
//               "No. of Bags: ${order.totalBags ?? "N/A"}",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade700),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropInfo(PickupOrderDetails order) {
//     return Card(
//       color: whiteColor,
//       elevation: 6,
//       shadowColor: primaryColor.withOpacity(0.3),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.home, color: primaryColor),
//                 SizedBox(width: 8),
//                 Text(
//                   "Drop",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor),
//                 ),
//               ],
//             ),
//             Text(
//               order.customerName ?? "No Customer Name",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
//             ),
//             Text(
//               order.orderAddress ?? "No Drop Address",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
//             ),
//             Text(
//               "Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNoteInfo(PickupOrderDetails order) {
//     return Card(
//       color: whiteColor,
//       elevation: 6,
//       shadowColor: primaryColor.withOpacity(0.3),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.note, color: primaryColor),
//                 SizedBox(width: 8),
//                 Text(
//                   "Note",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor),
//                 ),
//               ],
//             ),
//             Text(
//               order.orderInstructions ?? "No instructions provided",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomButton(PickupOrderDetails order) {
//     String? securityToken = GetStorage().read("StoreLogin")?["security_token"];
//
//     if (securityToken == null || securityToken.isEmpty) {
//       print("❌ Error: Missing Security Token.");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Security token is missing. Please re-login."),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return SizedBox.shrink(); // Hide button if token is missing
//     }
//
//     return ElevatedButton(
//       onPressed: () async {
//         if (order.id == null || order.driverAssignedId == null) {
//           print("❌ Error: Missing Order ID or Driver Assigned ID.");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Order ID or Driver Assigned ID is missing."),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return;
//         }
//         //Call your controller to update status & trigger notification via backend
//         String? riderId = _storage.read("StoreLogin")?["driver_assigned_id"]?.toString();
//         // await ridercontroller.updateRiderStatus(
//         //   riderId: riderId!,
//         //   status: 'en_route_to_laundry',
//         // );
//         if (riderId != null) {
//         await ridercontroller.updateRiderStatus(
//         riderId, 'en_route_to_laundry');
//         }
//
//         print("✅ Navigating to ConfirmPickupScreen - Order ID: ${order.id}, Driver Assigned ID: ${order.driverAssignedId}");
//
//         Future.delayed(Duration.zero, () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ConfirmPickupScreen(
//                 orderId: order.id!,
//                 driverAssignedId: order.driverAssignedId!,
//                 securityToken: securityToken,
//               ),
//             ),
//           );
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: primaryColor,
//         minimumSize: Size(double.infinity, 50),
//       ),
//       child: Text(
//         'Arrived at laundry',
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: whiteColor),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../controller/laundryPickupController.dart';
// import '../controller/riderstatuscontroller.dart';
// import '../model/pickup_model.dart';
// import 'confirm_pickup_screen.dart';

class ArrivedAtLaundryScreen extends StatefulWidget {
  final int orderId;
  final int driverAssignedId;

  ArrivedAtLaundryScreen({required this.orderId, required this.driverAssignedId});

  @override
  _ArrivedAtLaundryScreenState createState() => _ArrivedAtLaundryScreenState();
}

class _ArrivedAtLaundryScreenState extends State<ArrivedAtLaundryScreen> {
  final LaundryPickupController controller = Get.put(LaundryPickupController());
  final RiderStatusController ridercontroller = Get.put(RiderStatusController());
  final GetStorage _storage = GetStorage();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      int? orderId = widget.orderId;
      int? driverAssignedId = widget.driverAssignedId;

      if (orderId != null && driverAssignedId != null) {
        controller.fetchPickupOrderDetails(orderId, driverAssignedId);
      }
    });
  }

  Widget _buildSectionCard({required Widget child}) {
    return Card(
      color: whiteColor,
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.black.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Obx(() => Text(
          controller.pickupOrderDetails.value?.customerName ?? "Arrived at Laundry",
          style: const TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
        )),
        actions: [
          IconButton(icon: const Icon(Icons.chat_bubble, color: whiteColor), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call, color: whiteColor), onPressed: () {}),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final order = controller.pickupOrderDetails.value;
        if (order == null) {
          return const Center(child: Text("❌ No order details available"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPickupInfo(order),
              _buildDropInfo(order),
              _buildNoteInfo(order),
              const SizedBox(height: 24),
              _buildBottomButton(order),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildPickupInfo(PickupOrderDetails order) {
    return _buildSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.local_laundry_service, color: primaryColor),
            const SizedBox(width: 8),
            const Text("Pickup", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
          ]),
          const SizedBox(height: 12),
          Text(order.laundromatName ?? "No Laundromat Name", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
          Text(order.orderAddress ?? "No Address", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
          const SizedBox(height: 8),
          Text("Total: \$${order.deliveryCharges ?? "0.00"}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.green.shade700)),
          Text("No. of Bags: ${order.totalBags ?? "N/A"}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  Widget _buildDropInfo(PickupOrderDetails order) {
    return _buildSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.home, color: primaryColor),
            const SizedBox(width: 8),
            const Text("Drop", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
          ]),
          const SizedBox(height: 12),
          Text(order.customerName ?? "No Customer Name", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
          Text(order.orderAddress ?? "No Drop Address", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
          Text("Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor)),
        ],
      ),
    );
  }

  Widget _buildNoteInfo(PickupOrderDetails order) {
    return _buildSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.note, color: primaryColor),
            const SizedBox(width: 8),
            const Text("Note", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
          ]),
          const SizedBox(height: 12),
          Text(order.orderInstructions ?? "No instructions provided", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
        ],
      ),
    );
  }

  Widget _buildBottomButton(PickupOrderDetails order) {
    String? securityToken = _storage.read("StoreLogin")?["security_token"];

    if (securityToken == null || securityToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Security token is missing. Please re-login."),
          backgroundColor: Colors.red,
        ),
      );
      return const SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () async {
        if (order.id == null || order.driverAssignedId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Order ID or Driver Assigned ID is missing."),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        String? riderId = _storage.read("StoreLogin")?["driver_assigned_id"]?.toString();

        if (riderId != null) {
          await ridercontroller.updateRiderStatus(riderId, 'en_route_to_laundry');
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmPickupScreen(
              orderId: order.id!,
              driverAssignedId: order.driverAssignedId!,
              securityToken: securityToken,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Arrived at laundry',
        style: TextStyle(fontSize: 18, color: whiteColor),
      ),
    );
  }
}
