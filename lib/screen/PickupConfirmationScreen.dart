//
import 'package:deliveryboy/screen/arrivedatdropoffscreen.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:deliveryboy/controller/laundryPickupController.dart';
import 'package:deliveryboy/controller/order_status_controller.dart';
import 'package:deliveryboy/controller/help_status_controller.dart';

//
// class ConfirmPickupScreen extends StatefulWidget {
//   final int orderId;
//   final int driverAssignedId;
//   final String securityToken;
//
//   ConfirmPickupScreen({
//     required this.orderId,
//     required this.driverAssignedId,
//     required this.securityToken,
//   });
//
//   @override
//   _ConfirmPickupScreenState createState() => _ConfirmPickupScreenState();
// }
//
// class _ConfirmPickupScreenState extends State<ConfirmPickupScreen> {
//   final LaundryPickupController pickupController =
//       Get.put(LaundryPickupController());
//   final OrderStatusController statusController =
//       Get.put(OrderStatusController());
//   final HelpStatusController helpController = Get.put(HelpStatusController());
//
//   bool _showPickupOverlay = false;
//   bool _showHelpOverlay = false;
//
//   // ✅ Stores selected help options
//   final Map<String, bool> _selectedHelpOptions = {
//     "Laundry is closed": false,
//     "Bags not Available": false,
//     "Communication Issue": false,
//     "Laundromat Delay": false,
//     "Order Cancelled": false,
//   };
//
//   final TextEditingController _helpTextController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       pickupController.fetchPickupOrderDetails(
//           widget.orderId, widget.driverAssignedId);
//     });
//   }
//
//   void _togglePickupOverlay() {
//     setState(() {
//       _showPickupOverlay = !_showPickupOverlay;
//     });
//   }
//
//   void _toggleHelpOverlay() {
//     setState(() {
//       _showHelpOverlay = !_showHelpOverlay;
//     });
//   }
//
//   Future<void> _confirmPickup() async {
//     setState(() {
//       _showPickupOverlay = false;
//     });
//
//     bool success = await statusController.updateOrderStatus(
//       orderId: widget.orderId,
//       status: "confirmed",
//       driverId: widget.driverAssignedId,
//       securityToken: widget.securityToken,
//     );
//
//     if (success) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ArrivedAtDropoffScreen(
//             orderId: widget.orderId,
//             driverAssignedId: widget.driverAssignedId,
//             securityToken: widget.securityToken,
//           ),
//         ),
//       );
//     }
//   }
//
//   // ✅ Builds each help option checkbox
//   Widget _buildHelpOption(String title) {
//     return CheckboxListTile(
//       title: Text(title, style: TextStyle(fontSize: 14)),
//       value: _selectedHelpOptions[title] ?? false,
//       onChanged: (value) {
//         setState(() {
//           _selectedHelpOptions[title] = value!;
//         });
//       },
//     );
//   }
//
//   // ✅ Handles sending the help request
//   void _sendHelpRequest() async {
//     String selectedIssues = _selectedHelpOptions.entries
//         .where((entry) => entry.value)
//         .map((entry) => entry.key)
//         .join(", ");
//
//     String additionalComment = _helpTextController.text.trim();
//
//     if (selectedIssues.isEmpty && additionalComment.isEmpty) {
//       Get.snackbar("Error", "Please select a reason or enter a message.",
//           backgroundColor: Colors.red, colorText: Colors.white);
//       return;
//     }
//
//     // ✅ Combine selected issues and additional comment
//     String helpStatus = additionalComment.isNotEmpty
//         ? "$selectedIssues, $additionalComment"
//         : selectedIssues;
//
//     bool success = await helpController.sendHelpStatus(
//       orderId: widget.orderId,
//       helpStatus: helpStatus,
//       driverId: widget.driverAssignedId,
//       securityToken: widget.securityToken,
//     );
//
//     if (success) {
//       setState(() {
//         _showHelpOverlay = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:whiteColor,
//       appBar: AppBar(
//         backgroundColor:primaryColor,
//         elevation: 0,
//         title: Obx(() {
//           final customerName =
//               pickupController.pickupOrderDetails.value?.customerName ??
//                   "Order Details";
//           return Text(customerName,
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black));
//         }),
//         centerTitle: true,
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.pop(context)),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.chat, color: Colors.black), onPressed: () {}),
//           IconButton(
//               icon: Icon(Icons.phone, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: Obx(() {
//         if (pickupController.isLoading.value)
//           return Center(child: CircularProgressIndicator());
//
//         final order = pickupController.pickupOrderDetails.value;
//         if (order == null)
//           return Center(child: Text("❌ No order details available"));
//
//         return Stack(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(
//                     'Pickup',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     order.laundromatName ?? "Laundromat Name",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 4),
//
//                   SizedBox(height: 16),
//
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: ElevatedButton(
//                       onPressed: _toggleHelpOverlay,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                       ),
//                       child: Text('Help',
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white)),
//                     ),
//                   ),
//                   Spacer(),
//                   ElevatedButton(
//                     onPressed: _togglePickupOverlay,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: Text('Confirm Pickup',
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                   ),
//                 ],
//               ),
//             ),
//
//             // ✅ Confirm Pickup Overlay
//             if (_showPickupOverlay)
//               GestureDetector(
//                 onTap: _togglePickupOverlay,
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                   child: Center(
//                     child: Container(
//                       width: 300,
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                           color: whiteColor,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text('Confirm the Pickup',
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold)),
//                           SizedBox(height: 16),
//                           Text('Total Bags: ${order.totalBags ?? "N/A"}',
//                               style: TextStyle(fontSize: 14)),
//                           SizedBox(height: 16),
//                           ElevatedButton(
//                             onPressed: _confirmPickup,
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8))),
//                             child: Text('Confirm',
//                                 style: TextStyle(
//                                     color: whiteColor,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//             // ✅ Help Overlay
//             if (_showHelpOverlay)
//               GestureDetector(
//                 onTap: _toggleHelpOverlay,
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                   child: Center(
//                     child: Container(
//                       width: 300,
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                           color: whiteColor,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(12)),
//                             ),
//                             child: Text(
//                               'Help with Pickup',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: whiteColor,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(height: 16),
//                           Column(
//                             children: _selectedHelpOptions.keys
//                                 .map(_buildHelpOption)
//                                 .toList(),
//                           ),
//                           SizedBox(height: 12),
//                           TextField(
//                               controller: _helpTextController,
//                               decoration: InputDecoration(hintText: "Type...")),
//                           SizedBox(height: 16),
//                           ElevatedButton(
//                               onPressed: _sendHelpRequest,
//                               child: Text('Send',
//                                   style: TextStyle(color: whiteColor))),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         );
//       }),
//     );
//   }
// }
class ConfirmPickupScreen extends StatefulWidget {
  final int orderId;
  final int driverAssignedId;
  final String securityToken;

  ConfirmPickupScreen({
    required this.orderId,
    required this.driverAssignedId,
    required this.securityToken,
  });

  @override
  _ConfirmPickupScreenState createState() => _ConfirmPickupScreenState();
}

class _ConfirmPickupScreenState extends State<ConfirmPickupScreen> {
  final LaundryPickupController pickupController =
      Get.put(LaundryPickupController());
  final OrderStatusController statusController =
      Get.put(OrderStatusController());
  final HelpStatusController helpController = Get.put(HelpStatusController());

  bool _showPickupOverlay = false;
  bool _showHelpOverlay = false;

  final Map<String, bool> _selectedHelpOptions = {
    "Laundry is closed": false,
    "Bags not Available": false,
    "Communication Issue": false,
    "Laundromat Delay": false,
    "Order Cancelled": false,
  };

  final TextEditingController _helpTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pickupController.fetchPickupOrderDetails(
          widget.orderId, widget.driverAssignedId);
    });
  }

  void _togglePickupOverlay() =>
      setState(() => _showPickupOverlay = !_showPickupOverlay);
  void _toggleHelpOverlay() =>
      setState(() => _showHelpOverlay = !_showHelpOverlay);

  Future<void> _confirmPickup() async {
    setState(() => _showPickupOverlay = false);
    bool success = await statusController.updateOrderStatus(
      orderId: widget.orderId,
      status: "confirmed",
      driverId: widget.driverAssignedId,
      securityToken: widget.securityToken,
    );
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArrivedAtDropoffScreen(
            orderId: widget.orderId,
            driverAssignedId: widget.driverAssignedId,
            securityToken: widget.securityToken,
          ),
        ),
      );
    }
  }

  Widget _buildHelpOption(String title) {
    return CheckboxListTile(
      title: Text(title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333))),
      value: _selectedHelpOptions[title] ?? false,
      onChanged: (value) =>
          setState(() => _selectedHelpOptions[title] = value!),
    );
  }

  void _sendHelpRequest() async {
    String selectedIssues = _selectedHelpOptions.entries
        .where((entry) => entry.value)
        .map((e) => e.key)
        .join(", ");
    String additionalComment = _helpTextController.text.trim();

    if (selectedIssues.isEmpty && additionalComment.isEmpty) {
      Get.snackbar("Error", "Please select a reason or enter a message.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    String helpStatus = additionalComment.isNotEmpty
        ? "$selectedIssues, $additionalComment"
        : selectedIssues;

    bool success = await helpController.sendHelpStatus(
      orderId: widget.orderId,
      helpStatus: helpStatus,
      driverId: widget.driverAssignedId,
      securityToken: widget.securityToken,
    );

    if (success) setState(() => _showHelpOverlay = false);
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
          final name =
              pickupController.pickupOrderDetails.value?.customerName ??
                  "Order Details";
          return Text(name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: whiteColor));
        }),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: whiteColor),
            onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.chat_bubble, color: whiteColor),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.call, color: whiteColor),
              onPressed: () {}),
        ],
      ),
      body: Obx(() {
        if (pickupController.isLoading.value)
          return const Center(child: CircularProgressIndicator());

        final order = pickupController.pickupOrderDetails.value;
        if (order == null)
          return const Center(child: Text("❌ No order details available"));

        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      shadowColor: Colors.black.withOpacity(0.05),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Pickup',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor)),
                            const SizedBox(height: 12),
                            Text(order.laundromatName ?? "Laundromat Name",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF333333))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _toggleHelpOverlay,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Help',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: whiteColor)),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _togglePickupOverlay,
                      style: ElevatedButton.styleFrom(
                        // fixedSize: Size(double.infinity, 80),
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Confirm Pickup',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: whiteColor)),
                    ),
                  ),
                ],
              ),
            ),
            if (_showPickupOverlay)
              GestureDetector(
                onTap: _togglePickupOverlay,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Confirm the Pickup',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor)),
                          const SizedBox(height: 16),
                          Text('Total Bags: ${order.totalBags ?? "N/A"}',
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xFF333333))),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _confirmPickup,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Confirm',
                                style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (_showHelpOverlay)
              GestureDetector(
                onTap: _toggleHelpOverlay,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                            ),
                            child: const Text(
                              'Help with Pickup',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                              children: _selectedHelpOptions.keys
                                  .map(_buildHelpOption)
                                  .toList()),
                          const SizedBox(height: 12),
                          TextField(
                              controller: _helpTextController,
                              decoration:
                                  const InputDecoration(hintText: "Type...")),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _sendHelpRequest,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor),
                            child: const Text('Send',
                                style: TextStyle(color: whiteColor)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
