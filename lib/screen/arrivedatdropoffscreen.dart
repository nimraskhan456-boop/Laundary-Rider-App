// import 'package:deliveryboy/screen/DropOffScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import 'package:deliveryboy/controller/laundryPickupController.dart';
// import 'package:deliveryboy/model/pickup_model.dart';


// class ArrivedAtDropoffScreen extends StatefulWidget {
//   @override
//   _ArrivedAtDropoffScreenState createState() => _ArrivedAtDropoffScreenState();
// }

// class _ArrivedAtDropoffScreenState extends State<ArrivedAtDropoffScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//   final GetStorage _storage = GetStorage();

//   @override
//   void initState() {
//     super.initState();

//     // ✅ Extract Order ID & Driver Assigned ID
//     int? orderId = Get.arguments?["order_id"] ?? _storage.read("order_id");
//     int? driverAssignedId =
//         Get.arguments?["driver_assigned_id"] ?? _storage.read("StoreLogin")?["driver_assigned_id"];

//     print("🛑 Retrieved Order ID: $orderId, Driver Assigned ID: $driverAssignedId");

//     if (orderId != null && driverAssignedId != null) {
//       controller.fetchPickupOrderDetails(orderId, driverAssignedId);
//     } else {
//       print("⚠️ Error: Order ID or Driver Assigned ID not found.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE5F0FA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFE5F0FA),
//         elevation: 0,
//         title: Obx(() => Text(
//               controller.pickupOrderDetails.value?.customerName ?? "Order Details",
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//             )),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.chat, color: Colors.black), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.phone, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final order = controller.pickupOrderDetails.value;
//         if (order == null) {
//           return const Center(child: Text("❌ No order details available"));
//         }

//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.home, color: Colors.blue),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Drop',
//                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 order.orderAddress ?? "No Drop-off Address",
//                                 style: const TextStyle(fontSize: 14, color: Colors.blue),
//                               ),
//                               const SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.check_circle, color: Colors.blue, size: 18),
//                                   const SizedBox(width: 5),
//                                   const Text("Elevator", style: TextStyle(fontSize: 14)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.note, color: Colors.blue),
//                         const SizedBox(width: 8),
//                         const Text(
//                           "Note",
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       order.orderInstructions ?? "No instructions provided",
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DropDetailsScreen()), // ✅ Next step
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 ),
//                 child: const Text(
//                   'Arrived',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:deliveryboy/screen/DropOffScreen.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:deliveryboy/controller/laundryPickupController.dart';
import 'package:deliveryboy/model/pickup_model.dart';

// class ArrivedAtDropoffScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//   final String securityToken;
//
//   ArrivedAtDropoffScreen({
//     required this.orderId,
//     required this.driverAssignedId,
//     required this.securityToken,
//   });
//
//   @override
//   _ArrivedAtDropoffScreenState createState() => _ArrivedAtDropoffScreenState();
// }
//
// class _ArrivedAtDropoffScreenState extends State<ArrivedAtDropoffScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//
//   @override
//   void initState() {
//     super.initState();
// WidgetsBinding.instance.addPostFrameCallback((_) {
//     // Fetch order details using the orderId, driverAssignedId, and securityToken
//     controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE5F0FA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFE5F0FA),
//         elevation: 0,
//         title: Obx(() {
//           return Text(
//             controller.pickupOrderDetails.value?.customerName ?? "Order Details",
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//           );
//         }),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.chat, color: Colors.black), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.phone, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final order = controller.pickupOrderDetails.value;
//         if (order == null) {
//           return const Center(child: Text("❌ No order details available"));
//         }
//
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.home, color: Colors.blue),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Drop',
//                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 order.orderAddress ?? "No Drop-off Address",
//                                 style: const TextStyle(fontSize: 14, color: Colors.blue),
//                               ),
//                               const SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.check_circle, color: Colors.blue, size: 18),
//                                   const SizedBox(width: 5),
//                                   const Text("Elevator", style: TextStyle(fontSize: 14)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.note, color: Colors.blue),
//                         const SizedBox(width: 8),
//                         const Text(
//                           "Note",
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       order.orderInstructions ?? "No instructions provided",
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DropDetailsScreen(
//                         orderId: widget.orderId, // Pass data to next screen
//                         driverAssignedId: widget.driverAssignedId,
//                         securityToken: widget.securityToken,
//                       ),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 ),
//                 child: const Text(
//                   'Arrived',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         );
// //       }),
// //     );
// //   }
// // }
// class ArrivedAtDropoffScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//   final String securityToken;
//
//   ArrivedAtDropoffScreen({
//     required this.orderId,
//     required this.driverAssignedId,
//     required this.securityToken,
//   });
//
//   @override
//   _ArrivedAtDropoffScreenState createState() => _ArrivedAtDropoffScreenState();
// }
//
// class _ArrivedAtDropoffScreenState extends State<ArrivedAtDropoffScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Ensure API call happens after first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       print("🛑 Retrieved Order ID: ${widget.orderId}, Driver Assigned ID: ${widget.driverAssignedId}");
//       if (widget.orderId != null && widget.driverAssignedId != null) {
//         controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);
//       } else {
//         print("⚠️ Error: Order ID or Driver Assigned ID not found.");
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE5F0FA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFE5F0FA),
//         elevation: 0,
//         centerTitle: true,
//         title: Obx(() {
//           return Text(
//             controller.pickupOrderDetails.value?.customerName ?? "Arrived at Dropoff",
//             style: const TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//           );
//         }),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.chat, color: Colors.black), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.phone, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final order = controller.pickupOrderDetails.value;
//         if (order == null) {
//           return const Center(child: Text("❌ No order details available"));
//         }
//
//         return Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildDropInfo(order),
//               const SizedBox(height: 16),
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
//   Widget _buildDropInfo(PickupOrderDetails order) {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Icon(Icons.home, color: Colors.blue),
//                 const SizedBox(width: 8),
//                 Text(
//                   "Drop",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               order.orderAddress ?? "No Drop-off Address",
//               style: TextStyle(fontSize: 16, color: Colors.blue),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNoteInfo(PickupOrderDetails order) {
//     return Card(
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Icon(Icons.note, color: Colors.blue),
//                 const SizedBox(width: 8),
//                 Text(
//                   "Note",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               order.orderInstructions ?? "No instructions provided",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomButton(PickupOrderDetails order) {
//     // Validate security token
//     if (widget.securityToken.isEmpty) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Security token is missing. Please re-login."),
//             backgroundColor: Colors.red,
//           ),
//         );
//       });
//       return const SizedBox.shrink();
//     }
//
//     return ElevatedButton(
//       onPressed: () {
//         if (order.id == null || order.driverAssignedId == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Order ID or Driver Assigned ID is missing."),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return;
//         }
//
//         print("✅ Navigating to DropDetailsScreen - Order ID: ${order.id}, Driver Assigned ID: ${order.driverAssignedId}");
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DropDetailsScreen(
//               orderId: order.id!,
//               driverAssignedId: order.driverAssignedId!,
//               securityToken: widget.securityToken,
//             ),
//           ),
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         minimumSize: const Size(double.infinity, 50),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//       child: const Text(
//         'Arrived',
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//       ),
//     );
//   }
// }
class ArrivedAtDropoffScreen extends StatefulWidget {
  final int orderId;
  final int driverAssignedId;
  final String securityToken;

  ArrivedAtDropoffScreen({
    required this.orderId,
    required this.driverAssignedId,
    required this.securityToken,
  });

  @override
  _ArrivedAtDropoffScreenState createState() => _ArrivedAtDropoffScreenState();
}

class _ArrivedAtDropoffScreenState extends State<ArrivedAtDropoffScreen> {
  final LaundryPickupController controller = Get.put(LaundryPickupController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.orderId != null && widget.driverAssignedId != null) {
        controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);
      }
    });
  }

  Widget _buildSectionCard({required Widget child}) {
    return Card(
      color: Colors.white,
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
        elevation: 0,
        centerTitle: true,
        title: Obx(() {
          return Text(
            controller.pickupOrderDetails.value?.customerName ?? "Arrived at Dropoff",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: whiteColor),
          );
        }),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

  Widget _buildDropInfo(PickupOrderDetails order) {
    return _buildSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.home, color: primaryColor),
              SizedBox(width: 8),
              Text("Drop", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
            ],
          ),
          const SizedBox(height: 12),
          Text(order.orderAddress ?? "No Drop-off Address", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
          const SizedBox(height: 8),
          Text("Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
        ],
      ),
    );
  }

  Widget _buildNoteInfo(PickupOrderDetails order) {
    return _buildSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.note, color: primaryColor),
              SizedBox(width: 8),
              Text("Note", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
            ],
          ),
          const SizedBox(height: 12),
          Text(order.orderInstructions ?? "No instructions provided", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
        ],
      ),
    );
  }

  Widget _buildBottomButton(PickupOrderDetails order) {
    if (widget.securityToken.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Security token is missing. Please re-login."),
            backgroundColor: Colors.red,
          ),
        );
      });
      return const SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () {
        if (order.id == null || order.driverAssignedId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Order ID or Driver Assigned ID is missing."),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DropDetailsScreen(
              orderId: order.id!,
              //orderQid: order.orderQid,
              driverAssignedId: order.driverAssignedId!,
              securityToken: widget.securityToken,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Arrived',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: whiteColor),
      ),
    );
  }
}
