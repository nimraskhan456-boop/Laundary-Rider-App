import 'package:deliveryboy/controller/ConfirmOrderPicController.dart';
import 'package:deliveryboy/controller/order_status_controller.dart';
import 'package:deliveryboy/screen/qrscan/receive_delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:deliveryboy/controller/laundryPickupController.dart';
import 'package:get/get.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:deliveryboy/screen/complete_order_screen.dart';

class DropDetailsScreen extends StatefulWidget {
  final int orderId;
  //final int orderQid;
  final int driverAssignedId;
  final String securityToken;

  const DropDetailsScreen({
    super.key,
    required this.orderId,
    required this.driverAssignedId,
    required this.securityToken,
    // required this.orderQid,
  });

  @override
  State<DropDetailsScreen> createState() => _DropDetailsScreenState();
}

class _DropDetailsScreenState extends State<DropDetailsScreen> {
  bool _showOverlay = false;
  bool _showQRScanner = false;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  final LaundryPickupController controller = Get.put(LaundryPickupController());
  final ConfirmOrderPicController confirmOrderPicController =
      Get.put(ConfirmOrderPicController());
  final OrderStatusController statusController =
      Get.put(OrderStatusController());

  @override
  void initState() {
    super.initState();
    controller.fetchPickupOrderDetails(widget.orderId, widget.driverAssignedId);
  }

  void _toggleOverlay() => setState(() => _showOverlay = !_showOverlay);
  void _toggleQRScanner() => setState(() => _showQRScanner = !_showQRScanner);

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _showOverlay = true;
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Choose Image Source"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blueAccent),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelivery() async {
    try {
      bool success = await statusController.updateOrderStatus(
        orderId: widget.orderId,
        status: "completed",
        driverId: widget.driverAssignedId,
        securityToken: widget.securityToken,
      );
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompletedScreen(
              orderId: widget.orderId,
              driverAssignedId: widget.driverAssignedId,
              securityToken: widget.securityToken,
            ),
          ),
        );
      } else {
        Get.snackbar("Error", "Failed to complete order.",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong.",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
            title: const Text('Delivery Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.blueAccent),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Drop Location',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text('345 Hull Ave, Apt 4C\nElevator Available',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blueAccent)),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.check_circle,
                              color: Colors.blueAccent),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text("Choose Delivery Type",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 14),
                      GestureDetector(
                        onTap: _toggleOverlay,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 4))
                            ],
                          ),
                          child: const Center(
                            child: Text('📦 Leave Bags at the Door',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      GestureDetector(
                        // onTap: _toggleQRScanner,
                        onTap: () {
                          Get.to(() => ReceiveDelivery());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 4))
                            ],
                          ),
                          child: const Center(
                            child: Text('🤝 Hand-to-Hand Delivery (Scan QR)',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _confirmDelivery,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Confirm Delivery',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
        if (_showOverlay)
          GestureDetector(
            onTap: _toggleOverlay,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _selectedImage != null
                          ? Image.file(_selectedImage!,
                              width: 200, height: 200, fit: BoxFit.cover)
                          : GestureDetector(
                              onTap: _showImageSourceDialog,
                              child: const Icon(Icons.add_a_photo,
                                  size: 100, color: Colors.grey),
                            ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          if (_selectedImage != null) {
                            bool success = await confirmOrderPicController
                                .uploadConfirmOrderPic(
                              driverId: widget.driverAssignedId,
                              orderId: widget.orderId,
                              imageFile: _selectedImage!,
                            );
                            if (success) {
                              _toggleOverlay();
                              _confirmDelivery();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("❌ Upload failed")),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Confirm",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (_showQRScanner)
          GestureDetector(
            onTap: _toggleQRScanner,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: QRView(
                  key: _qrKey,
                  onQRViewCreated: (QRViewController qrController) {
                    qrController.scannedDataStream.listen((scanData) async {
                      qrController.pauseCamera();
                      String qrData = scanData.code ?? '';

                      // Get the expected order_q_id from the fetched order details
                      String? expectedOrderQId =
                          controller.pickupOrderDetails.value?.orderQId;
                      String? expectedDeliveryCode =
                          controller.pickupOrderDetails.value?.deliveryCode;
                      int? expectedOrderId =
                          controller.pickupOrderDetails.value?.id;

                      // Compare QR code with order_q_id, delivery_code, or order ID
                      bool qrMatches = false;

                      if (qrData.isNotEmpty) {
                        // Check against order_q_id (primary match)
                        if (expectedOrderQId != null &&
                            qrData == expectedOrderQId) {
                          qrMatches = true;
                        }
                        // Check against delivery_code (alternative match)
                        else if (expectedDeliveryCode != null &&
                            qrData == expectedDeliveryCode) {
                          qrMatches = true;
                        }
                        // Check against numeric order ID (fallback)
                        else if (expectedOrderId != null &&
                            qrData == expectedOrderId.toString()) {
                          qrMatches = true;
                        }
                      }

                      if (qrMatches) {
                        _toggleQRScanner();
                        await controller.fetchPickupOrderDetails(
                            widget.orderId, widget.driverAssignedId);
                        setState(() {
                          _showOverlay = true;
                        });
                        Get.snackbar(
                            "QR Verified", "QR code verified successfully!",
                            backgroundColor: Colors.green,
                            colorText: Colors.white);
                      } else {
                        Get.snackbar("QR Mismatch",
                            "This QR code doesn't match the current order.\nExpected: $expectedOrderQId",
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            duration: const Duration(seconds: 3));
                      }

                      await qrController.resumeCamera();
                    });
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
