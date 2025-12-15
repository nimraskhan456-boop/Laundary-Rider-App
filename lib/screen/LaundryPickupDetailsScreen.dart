// // // // // // import 'package:deliveryboy/screen/PickupConfirmationScreen.dart';
// // // // // // import 'package:flutter/material.dart';
// //
// // // // // // class LaundryDetailsScreen extends StatelessWidget {
// // // // // //   const LaundryDetailsScreen({super.key});
// //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       backgroundColor: Colors.grey[200],
// // // // // //       appBar: AppBar(
// // // // // //         backgroundColor: Colors.white,
// // // // // //         elevation: 0,
// // // // // //         title: const Text(
// // // // // //           'ALI. B',
// // // // // //           style: TextStyle(
// // // // // //             fontSize: 20,
// // // // // //             fontWeight: FontWeight.bold,
// // // // // //             color: Colors.black,
// // // // // //           ),
// // // // // //         ),
// // // // // //         centerTitle: true,
// // // // // //         leading: IconButton(
// // // // // //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // // // //           onPressed: () {
// // // // // //             Navigator.pop(context);
// // // // // //           },
// // // // // //         ),
// // // // // //         actions: [
// // // // // //           IconButton(
// // // // // //             icon: const Icon(Icons.chat, color: Colors.black),
// // // // // //             onPressed: () {
// // // // // //               // Chat functionality placeholder
// // // // // //             },
// // // // // //           ),
// // // // // //           IconButton(
// // // // // //             icon: const Icon(Icons.phone, color: Colors.black),
// // // // // //             onPressed: () {
// // // // // //               // Call functionality placeholder
// // // // // //             },
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       body: Padding(
// // // // // //         padding: const EdgeInsets.all(16.0),
// // // // // //         child: Column(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             Card(
// // // // // //               shape: RoundedRectangleBorder(
// // // // // //                 borderRadius: BorderRadius.circular(12),
// // // // // //               ),
// // // // // //               child: Padding(
// // // // // //                 padding: const EdgeInsets.all(16.0),
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: [
// // // // // //                     Row(
// // // // // //                       children: [
// // // // // //                         const Icon(Icons.location_on, color: Colors.blue),
// // // // // //                         const SizedBox(width: 8),
// // // // // //                         Expanded(
// // // // // //                           child: Column(
// // // // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                             children: const [
// // // // // //                               Text(
// // // // // //                                 'Pickup',
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 16,
// // // // // //                                   fontWeight: FontWeight.bold,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                               Text(
// // // // // //                                 'Super Laundromat',
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 14,
// // // // // //                                   color: Colors.grey,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                               Text(
// // // // // //                                 '46 Webster Ave',
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 14,
// // // // // //                                   color: Colors.grey,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                             ],
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         const Text(
// // // // // //                           '\$17',
// // // // // //                           style: TextStyle(
// // // // // //                             fontSize: 16,
// // // // // //                             fontWeight: FontWeight.bold,
// // // // // //                             color: Colors.green,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                     const Divider(height: 20, thickness: 1),
// // // // // //                     Row(
// // // // // //                       children: [
// // // // // //                         const Icon(Icons.home, color: Colors.blue),
// // // // // //                         const SizedBox(width: 8),
// // // // // //                         Expanded(
// // // // // //                           child: Column(
// // // // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                             children: const [
// // // // // //                               Text(
// // // // // //                                 'Drop',
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 16,
// // // // // //                                   fontWeight: FontWeight.bold,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                               Text(
// // // // // //                                 '345 Hull Ave',
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 14,
// // // // // //                                   color: Colors.grey,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                               Text(
// // // // // //                                 'Apt 4C, Elevator',
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: 14,
// // // // // //                                   color: Colors.grey,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                             ],
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         const Icon(
// // // // // //                           Icons.check_circle,
// // // // // //                           color: Colors.green,
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                     const Divider(height: 20, thickness: 1),
// // // // // //                     Row(
// // // // // //                       children: [
// // // // // //                         const Icon(Icons.note, color: Colors.blue),
// // // // // //                         const SizedBox(width: 8),
// // // // // //                         const Expanded(
// // // // // //                           child: Text(
// // // // // //                             'Leave the bags at the door',
// // // // // //                             style: TextStyle(
// // // // // //                               fontSize: 14,
// // // // // //                               color: Colors.grey,
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             const Spacer(),
// // // // // //             SizedBox(
// // // // // //               width: double.infinity,
// // // // // //               child: ElevatedButton(
// // // // // //                 style: ElevatedButton.styleFrom(
// // // // // //                   padding: const EdgeInsets.all(16),
// // // // // //                   shape: RoundedRectangleBorder(
// // // // // //                     borderRadius: BorderRadius.circular(12),
// // // // // //                   ),
// // // // // //                   backgroundColor: Colors.blue,
// // // // // //                 ),
// // // // // //                 onPressed: () {
// // // // // //                    Navigator.push(
// // // // // //     context,
// // // // // //     MaterialPageRoute(
// // // // // //       builder: (context) => ConfirmPickupScreen(), // Replace with your actual screen
// // // // // //     ),
// // // // // //   );
// // // // // //                   // Navigation to the next step functionality placeholder
// // // // // //                 },
// // // // // //                 child: const Text(
// // // // // //                   'Arrived at Laundry',
// // // // // //                   style: TextStyle(
// // // // // //                     fontSize: 16,
// // // // // //                     fontWeight: FontWeight.bold,
// // // // // //                     color: Colors.white,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// //
// // // import 'package:deliveryboy/controller/laundryPickupController.dart';
// // // import 'package:deliveryboy/model/pickup_model.dart';
// // // import 'package:deliveryboy/screen/arivedatlaundry.dart';
// // // import 'package:deliveryboy/screen/driver_login_screen.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:get_storage/get_storage.dart';
// // //
// // // class LaundryPickupDetailsScreen extends StatefulWidget {
// // //   final int orderId;
// // //   final int driverAssignedId;
// // //
// // //   const LaundryPickupDetailsScreen({
// // //     required this.orderId,
// // //     required this.driverAssignedId,
// // //     Key? key,
// // //   }) : super(key: key);
// // //
// // //   @override
// // //   _LaundryPickupDetailsScreenState createState() =>
// // //       _LaundryPickupDetailsScreenState();
// // // }
// // //
// // // class _LaundryPickupDetailsScreenState
// // //     extends State<LaundryPickupDetailsScreen> {
// // //   final LaundryPickupController controller = Get.put(LaundryPickupController());
// // //   final GetStorage _storage = GetStorage();
// // //
// // //   @override
// // //   // void initState() {
// // //   //   super.initState();
// // //
// // //   //   /// ✅ Ensures `fetchPickupOrderDetails` is only called after the first frame is built.
// // //   //   WidgetsBinding.instance.addPostFrameCallback((_) {
// // //   //     int? orderId = Get.arguments?["order_id"] ?? _storage.read("order_id");
// // //   //     int? driverAssignedId = Get.arguments?["driver_assigned_id"] ??
// // //   //         _storage.read("StoreLogin")?["driver_assigned_id"];
// // //
// // //   //     print("🛑 Retrieved Order ID: $orderId, Driver Assigned ID: $driverAssignedId");
// // //
// // //   //     if (orderId != null && driverAssignedId != null) {
// // //   //       controller.fetchPickupOrderDetails(orderId, driverAssignedId);
// // //   //     } else {
// // //   //       print("⚠️ Error: Order ID or Driver Assigned ID not found.");
// // //   //     }
// // //   //   });
// // //   // }
// // // @override
// // // void initState() {
// // //   super.initState();
// // //
// // //   WidgetsBinding.instance.addPostFrameCallback((_) {
// // //     int orderId = widget.orderId;
// // //     int driverAssignedId = widget.driverAssignedId;
// // //
// // //     print("🛑 Received Order ID: $orderId, Driver Assigned ID: $driverAssignedId");
// // //
// // //     controller.fetchPickupOrderDetails(orderId, driverAssignedId);
// // //   });
// // // }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: whiteColor,
// // //       appBar: AppBar(
// // //         backgroundColor:primaryColor,
// // //         elevation: 0,
// // //         title: Obx(() => Text(
// // //             controller.pickupOrderDetails.value?.customerName ?? "Order Details",
// // //             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
// // //         centerTitle: true,
// // //         actions: [
// // //           IconButton(
// // //               icon: Icon(Icons.chat_bubble, color: Colors.white),
// // //               onPressed: () {}),
// // //           IconButton(
// // //               icon: Icon(Icons.call, color: Colors.white),
// // //               onPressed: () {}),
// // //         ],
// // //       ),
// // //       body: Obx(() {
// // //         if (controller.isLoading.value) {
// // //           return Center(child: CircularProgressIndicator());
// // //         }
// // //
// // //         final order = controller.pickupOrderDetails.value;
// // //         if (order == null) {
// // //           return Center(child: Text("❌ No order details available"));
// // //         }
// // //
// // //         return Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               _buildPickupInfo(order),
// // //               const SizedBox(height: 10),
// // //               _buildDropInfo(order),
// // //               const SizedBox(height: 10),
// // //               _buildNoteInfo(order),
// // //               const Spacer(),
// // //               _buildBottomButton(order),
// // //             ],
// // //           ),
// // //         );
// // //       }),
// // //     );
// // //   }
// // //
// // //   Widget _buildPickupInfo(PickupOrderDetails order) {
// // //     return Card(
// // //       color: whiteColor,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(12.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               children: [
// // //                 Icon(Icons.store, color: primaryColor),
// // //                 SizedBox(width: 8),
// // //                 Text("Pickup",
// // //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // //               ],
// // //             ),
// // //             Text(order.laundromatName ?? "No Laundromat Name",
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // //             Text(order.orderAddress ?? "No Address",
// // //                 style: TextStyle(fontSize: 16, color:primaryColor)),
// // //             SizedBox(height: 5),
// // //             Text("Total: \$${order.orderPrice ?? "0.00"}",
// // //                 style: TextStyle(
// // //                     fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
// // //             Text("No. of Bags: ${order.totalBags ?? "N/A"}",
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildDropInfo(PickupOrderDetails order) {
// // //     return Card(
// // //       color: whiteColor,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(12.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               children: [
// // //                 Icon(Icons.home, color:primaryColor),
// // //                 SizedBox(width: 8),
// // //                 Text("Drop",
// // //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // //               ],
// // //             ),
// // //             Text(order.orderAddress ?? "No Drop Address",
// // //                 style: TextStyle(fontSize: 16, color: Colors.blue)),
// // //             Text(
// // //                 "Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}",
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildNoteInfo(PickupOrderDetails order) {
// // //     return Card(
// // //       color:whiteColor,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(12.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               children: [
// // //                 Icon(Icons.note, color: primaryColor),
// // //                 SizedBox(width: 8),
// // //                 Text("Note",
// // //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // //               ],
// // //             ),
// // //             Text(order.orderInstructions ?? "No instructions provided",
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //  Widget _buildBottomButton(PickupOrderDetails order) {
// // //   return ElevatedButton(
// // //     onPressed: () {
// // //       print("🛑 Button Pressed: Navigating to Next Screen");
// // //       print("✅ Order ID: ${order.id}, Driver Assigned ID: ${order.driverAssignedId}");
// // //
// // //       if (order.id == null || order.driverAssignedId == null) {
// // //         print("❌ Error: Missing Order ID or Driver Assigned ID.");
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(
// // //             content: Text("Order ID or Driver Assigned ID is missing."),
// // //             backgroundColor: Colors.red,
// // //           ),
// // //         );
// // //         return;
// // //       }
// // //
// // //       /// ✅ **Delay Navigation to Prevent Build Issues**
// // //       Future.delayed(Duration.zero, () {
// // //         Navigator.push(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (context) => ArrivedAtLaundryScreen(
// // //               orderId: order.id!,
// // //               driverAssignedId: order.driverAssignedId!,
// // //             ),
// // //           ),
// // //         );
// // //       });
// // //     },
// // //     style: ElevatedButton.styleFrom(
// // //       backgroundColor: primaryColor,
// // //       minimumSize: Size(double.infinity, 50),
// // //     ),
// // //     child: Text("Head to Laundry",
// // //         style: TextStyle(fontSize: 18, color: whiteColor)),
// // //   );
// // // }
// // //
// // // }
// // //
// // //======
// // import 'package:deliveryboy/controller/laundryPickupController.dart';
// // import 'package:deliveryboy/controller/riderstatuscontroller.dart';
// // import 'package:deliveryboy/model/pickup_model.dart';
// // import 'package:deliveryboy/screen/arivedatlaundry.dart';
// // import 'package:deliveryboy/screen/driver_login_screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';
// //
// // class LaundryPickupDetailsScreen extends StatefulWidget {
// //   final int orderId;
// //   final int driverAssignedId;
// //
// //   const LaundryPickupDetailsScreen({
// //     required this.orderId,
// //     required this.driverAssignedId,
// //     Key? key,
// //   }) : super(key: key);
// //
// //   @override
// //   _LaundryPickupDetailsScreenState createState() =>
// //       _LaundryPickupDetailsScreenState();
// // }
// //
// // class _LaundryPickupDetailsScreenState
// //     extends State<LaundryPickupDetailsScreen> {
// //   final LaundryPickupController controller = Get.put(LaundryPickupController());
// //   final RiderStatusController ridercontroller = Get.put(RiderStatusController());
// //   final GetStorage _storage = GetStorage();
// //
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       int orderId = widget.orderId;
// //       int driverAssignedId = widget.driverAssignedId;
// //
// //       print("🛑 Received Order ID: $orderId, Driver Assigned ID: $driverAssignedId");
// //
// //       controller.fetchPickupOrderDetails(orderId, driverAssignedId);
// //     });
// //   }
// //   Widget _buildBagIcons(int bagCount) {
// //     return Row(
// //       children: List.generate(
// //         bagCount,
// //             (index) => Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 4.0),
// //           child: Icon(Icons.shopping_bag, color: Colors.brown, size: 30),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: whiteColor,
// //       appBar: AppBar(
// //         backgroundColor:primaryColor,
// //         elevation: 0,
// //         title: Obx(() => Text(
// //             controller.pickupOrderDetails.value?.customerName ?? "Order Details",
// //             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //               icon: Icon(Icons.chat_bubble, color: Colors.white),
// //               onPressed: () {}),
// //           IconButton(
// //               icon: Icon(Icons.call, color: Colors.white),
// //               onPressed: () {}),
// //         ],
// //       ),
// //       body: Obx(() {
// //         if (controller.isLoading.value) {
// //           return Center(child: CircularProgressIndicator());
// //         }
// //
// //         final order = controller.pickupOrderDetails.value;
// //         if (order == null) {
// //           return Center(child: Text("❌ No order details available"));
// //         }
// //
// //         return Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               _buildPickupInfo(order),
// //               const SizedBox(height: 10),
// //               _buildDropInfo(order),
// //               const SizedBox(height: 10),
// //               _buildNoteInfo(order),
// //               const Spacer(),
// //               _buildBottomButton(order),
// //             ],
// //           ),
// //         );
// //       }),
// //     );
// //   }
// //
// //   Widget _buildPickupInfo(PickupOrderDetails order) {
// //     return Card(
// //       // color: whiteColor,
// //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       color: whiteColor,
// //       elevation: 6,                        // adds shadow for depth
// //       shadowColor: primaryColor.withOpacity(0.3),  // soft blue shadow
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: Padding(
// //         // padding: const EdgeInsets.all(12.0),
// //         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.store, color: primaryColor),
// //                 SizedBox(width: 8),
// //                 Text("Pickup",
// //                     style: TextStyle(fontSize: 18,
// //                         fontWeight: FontWeight.w700,
// //                       color: primaryColor,)),
// //               ],
// //             ),
// //             Text(order.laundromatName ?? "No Laundromat Name",
// //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
// //                   color: Colors.black87, )),
// //             Text(order.orderAddress ?? "No Address",
// //                 style: TextStyle(fontSize: 16,  fontWeight: FontWeight.w600,
// //                     color: Colors.black87)),
// //             SizedBox(height: 5),
// //             Text("Total: \$${order.orderPrice ?? "0.00"}",
// //                 style: TextStyle(
// //                     fontSize: 18, fontWeight: FontWeight.w500,
// //                   color: Colors.green.shade700,  )),
// //             // Text("No. of Bags: ${order.totalBags ?? "N/A"}",
// //             //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //             Text("No. of Bags: ${order.totalBags ?? "N/A"}",
// //                 style: TextStyle(fontSize: 14,
// //                   fontWeight: FontWeight.w400,
// //                   color: Colors.grey.shade700,)),
// //             if (order.totalBags != null)
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 8.0),
// //                 // child: _buildBagIcons(order.totalBags!),
// //                 child: _buildBagIcons(order.totalBags != null ? int.parse(order.totalBags!) : 0),
// //
// //               ),
// //
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildDropInfo(PickupOrderDetails order) {
// //     return Card(
// //       color: whiteColor,
// //       elevation: 6,
// //       shadowColor: primaryColor.withOpacity(0.3),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(12.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.home, color:primaryColor),
// //                 SizedBox(width: 8),
// //                 Text("Drop",
// //                     // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor),),
// //               ],
// //             ),
// //             Text(order.orderAddress ?? "No Drop Address",
// //                 // style: TextStyle(fontSize: 16, color: Colors.blue)),
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),),
// //             Text(
// //                 "Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}",
// //                 // style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor),),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildNoteInfo(PickupOrderDetails order) {
// //     return Card(
// //       color:whiteColor,
// //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       elevation: 6,
// //       shadowColor: primaryColor.withOpacity(0.3),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(12.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.note, color: primaryColor),
// //                 SizedBox(width: 8),
// //                 Text("Note",
// //                     // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor),),
// //               ],
// //             ),
// //             Text(order.orderInstructions ?? "No instructions provided",
// //                 // style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildBottomButton(PickupOrderDetails order) {
// //     return ElevatedButton(
// //       onPressed: () async {
// //         print("🛑 Button Pressed: Navigating to Next Screen");
// //         print("✅ Order ID: ${order.id}, Driver Assigned ID: ${order.driverAssignedId}");
// //
// //         if (order.id == null || order.driverAssignedId == null) {
// //           print("❌ Error: Missing Order ID or Driver Assigned ID.");
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               content: Text("Order ID or Driver Assigned ID is missing."),
// //               backgroundColor: Colors.red,
// //             ),
// //           );
// //           return;
// //         }
// //         // Call your controller to update status & trigger notification via backend
// //         String? riderId = _storage.read("StoreLogin")?["driver_assigned_id"]?.toString();
// //         // await ridercontroller.updateRiderStatus(
// //         //   riderId: riderId!,
// //         //   status: 'en_route_to_laundry',
// //         // );
// //         if (riderId != null) {
// //           await ridercontroller.updateRiderStatus(
// //               riderId, 'en_route_to_laundry');
// //         }
// //
// //
// //         /// ✅ **Delay Navigation to Prevent Build Issues**
// //         Future.delayed(Duration.zero, () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => ArrivedAtLaundryScreen(
// //                 orderId: order.id!,
// //                 driverAssignedId: order.driverAssignedId!,
// //               ),
// //             ),
// //           );
// //         });
// //       },
// //       style: ElevatedButton.styleFrom(
// //         backgroundColor: primaryColor,
// //         minimumSize: Size(double.infinity, 50),
// //       ),
// //       child: Text("Head to Laundry",
// //           style: TextStyle(fontSize: 18, color: whiteColor)),
// //     );
// //   }
// //
// // }
// //
// //
// //
// //
// import 'package:deliveryboy/controller/laundryPickupController.dart';
// import 'package:deliveryboy/controller/riderstatuscontroller.dart';
// import 'package:deliveryboy/model/pickup_model.dart';
// import 'package:deliveryboy/screen/arivedatlaundry.dart';
// import 'package:deliveryboy/screen/driver_login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
//
// class LaundryPickupDetailsScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//
//   const LaundryPickupDetailsScreen({
//     required this.orderId,
//     required this.driverAssignedId,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _LaundryPickupDetailsScreenState createState() =>
//       _LaundryPickupDetailsScreenState();
// }
//
// class _LaundryPickupDetailsScreenState
//     extends State<LaundryPickupDetailsScreen> {
//   final LaundryPickupController controller = Get.put(LaundryPickupController());
//   final RiderStatusController ridercontroller = Get.put(RiderStatusController());
//   final GetStorage _storage = GetStorage();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);
//     });
//   }
//
//   Widget _buildSectionCard({required Widget child}) {
//     return Card(
//       color: Colors.white,
//       elevation: 4,
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       shadowColor: Colors.black.withOpacity(0.08),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: child,
//       ),
//     );
//   }
//
//   Widget _buildBagIcons(int bagCount) {
//     return Row(
//       children: List.generate(
//         bagCount,
//             (index) => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//           child: Icon(Icons.shopping_bag, color: Colors.brown, size: 28),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         elevation: 0,
//         title: Obx(() => Text(
//           controller.pickupOrderDetails.value?.customerName ?? "Order Details",
//           style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         )),
//         centerTitle: true,
//         actions: [
//           IconButton(icon: const Icon(Icons.chat_bubble, color: Colors.white), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.call, color: Colors.white), onPressed: () {}),
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
//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildPickupInfo(order),
//               _buildDropInfo(order),
//               _buildNoteInfo(order),
//               const SizedBox(height: 24),
//               _buildBottomButton(order),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _buildPickupInfo(PickupOrderDetails order) {
//     return _buildSectionCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle(Icons.store, "Pickup Location"),
//           const SizedBox(height: 12),
//           Text(order.laundromatName ?? "No Laundromat Name",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
//           const SizedBox(height: 4),
//           Row(
//             children: [
//               const Icon(Icons.location_on, size: 20, color: Colors.redAccent),
//               const SizedBox(width: 4),
//               Expanded(
//                 child: Text(order.orderAddress ?? "No Address",
//                     style: const TextStyle(fontSize: 15, color: Color(0xFF333333))),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Text("Total: \$${order.orderPrice ?? "0.00"}",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green.shade700)),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Chip(
//                 label: Text("Bags: ${order.totalBags ?? "N/A"}"),
//                 backgroundColor: primaryColor.withOpacity(0.1),
//                 labelStyle: TextStyle(color: primaryColor),
//               ),
//             ],
//           ),
//           if (order.totalBags != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: _buildBagIcons(int.tryParse(order.totalBags!) ?? 0),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDropInfo(PickupOrderDetails order) {
//     return _buildSectionCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle(Icons.home, "Drop Address"),
//           const SizedBox(height: 12),
//           Row(
//             children: [
//               const Icon(Icons.location_on, size: 20, color: Colors.redAccent),
//               const SizedBox(width: 4),
//               Expanded(
//                 child: Text(order.orderAddress ?? "No Drop Address",
//                     style: const TextStyle(fontSize: 15, color: Color(0xFF333333))),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Chip(
//                 label: Text(order.elevatorStatus == "1" ? "Elevator Available" : "No Elevator"),
//                 backgroundColor: Colors.orange.shade50,
//                 labelStyle: TextStyle(color: Colors.orange.shade800),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNoteInfo(PickupOrderDetails order) {
//     return _buildSectionCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle(Icons.note_alt, "Instructions"),
//           const SizedBox(height: 12),
//           Text(order.orderInstructions ?? "No instructions provided",
//               style: const TextStyle(fontSize: 15, color: Color(0xFF333333))),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomButton(PickupOrderDetails order) {
//     return ElevatedButton.icon(
//       onPressed: () async {
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
//         String? riderId = _storage.read("StoreLogin")?["driver_assigned_id"]?.toString();
//         if (riderId != null) {
//           await ridercontroller.updateRiderStatus(riderId, 'en_route_to_laundry');
//         }
//
//         Future.delayed(Duration.zero, () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ArrivedAtLaundryScreen(
//                 orderId: order.id!,
//                 driverAssignedId: order.driverAssignedId!,
//               ),
//             ),
//           );
//         });
//       },
//       icon: const Icon(Icons.local_laundry_service, color: Colors.white),
//       label: const Text("Head to Laundry", style: TextStyle(fontSize: 16, color: Colors.white)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: primaryColor,
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         elevation: 4,
//       ),
//     );
//   }
//
//   Widget _sectionTitle(IconData icon, String title) {
//     return Row(
//       children: [
//         Icon(icon, color: primaryColor),
//         const SizedBox(width: 8),
//         Text(
//           title,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor),
//         ),
//       ],
//     );
//   }
// }
//
import 'package:deliveryboy/controller/laundryPickupController.dart';
import 'package:deliveryboy/controller/riderstatuscontroller.dart';
import 'package:deliveryboy/model/pickup_model.dart';
import 'package:deliveryboy/screen/arivedatlaundry.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LaundryPickupDetailsScreen extends StatefulWidget {
  final int orderId;
  final int driverAssignedId;

  const LaundryPickupDetailsScreen({
    required this.orderId,
    required this.driverAssignedId,
    Key? key,
  }) : super(key: key);

  @override
  _LaundryPickupDetailsScreenState createState() =>
      _LaundryPickupDetailsScreenState();
}

class _LaundryPickupDetailsScreenState
    extends State<LaundryPickupDetailsScreen> {
  final LaundryPickupController controller = Get.put(LaundryPickupController());
  final RiderStatusController ridercontroller = Get.put(RiderStatusController());
  final GetStorage _storage = GetStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchPickupOrderDetails(
          widget.orderId, widget.driverAssignedId);
    });
  }

  Widget _buildBagIcons(int bagCount) {
    return Row(
      children: List.generate(
        bagCount,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Icon(Icons.shopping_bag, color: Colors.brown, size: 30),
        ),
      ),
    );
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
      backgroundColor: const Color(0xFFF5F5F5), // light grey background
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Obx(() => Text(
          controller.pickupOrderDetails.value?.customerName ?? "Order Details",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.chat_bubble, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.call, color: Colors.white),
              onPressed: () {}),
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
          Row(
            children: [
              Icon(Icons.store, color: primaryColor),
              const SizedBox(width: 8),
              Text("Pickup",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: primaryColor)),
            ],
          ),
          const SizedBox(height: 12),
          Text(order.laundromatName ?? "No Laundromat Name",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333))),
          Text(order.orderAddress ?? "No Address",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333))),
          const SizedBox(height: 8),
          Text("Total: \$${order. deliveryCharges ?? "0.00"}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade700)),
          Text("No. of Bags: ${order.totalBags ?? "N/A"}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700)),
          if (order.totalBags != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _buildBagIcons(
                  int.tryParse(order.totalBags!) ?? 0),
            ),
        ],
      ),
    );
  }

  Widget _buildDropInfo(PickupOrderDetails order) {
    return _buildSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.home, color: primaryColor),
              const SizedBox(width: 8),
              Text("Drop",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: primaryColor)),
            ],
          ),
          const SizedBox(height: 12),
          Text(order.orderAddress ?? "No Drop Address",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333))),
          Text(
              "Elevator: ${order.elevatorStatus == "1" ? "Available" : "Not Available"}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColor)),
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
            children: [
              Icon(Icons.note, color: primaryColor),
              const SizedBox(width: 8),
              Text("Note",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: primaryColor)),
            ],
          ),
          const SizedBox(height: 12),
          Text(order.orderInstructions ?? "No instructions provided",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333))),
        ],
      ),
    );
  }

  Widget _buildBottomButton(PickupOrderDetails order) {
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
          await ridercontroller.updateRiderStatus(
              riderId, 'en_route_to_laundry');
        }

        Future.delayed(Duration.zero, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArrivedAtLaundryScreen(
                orderId: order.id!,
                driverAssignedId: order.driverAssignedId!,
              ),
            ),
          );
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        "Head to Laundry",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
