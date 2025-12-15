import 'package:deliveryboy/controller/order_details_controller.dart';
import 'package:deliveryboy/controller/order_status_controller.dart';
import 'package:deliveryboy/controller/update_order_controller.dart';
import 'package:deliveryboy/controller/update_weight_controller.dart';
import 'package:deliveryboy/model/orders_model.dart';
import 'package:deliveryboy/screen/LaundryPickupDetailsScreen.dart';
import 'package:deliveryboy/screen/assigned_orders_screen.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'chat/chat.dart';

final box = GetStorage();
String securityToken = box.read('securityToken') ?? '';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final OrderDetailsController controller = Get.put(OrderDetailsController());
  final UpdateOrderController updateOrderController =
      Get.put(UpdateOrderController());
  final OrderStatusController statusController =
      Get.put(OrderStatusController());
  final UpdateWeightController weightControllerX =
      Get.put(UpdateWeightController());
  String selectedPaymentType = 'Cash'; // Default

  // Controllers for text fields
  TextEditingController orderStatusController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController subtotalController = TextEditingController();
  TextEditingController deliveryChargeController = TextEditingController();
  TextEditingController platformFeeController = TextEditingController();
  TextEditingController finalAmountController = TextEditingController();
  TextEditingController paymentTypeController = TextEditingController();
  TextEditingController paymentStatusController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  TextEditingController deliveryInstructionsController =
      TextEditingController();
  TextEditingController amountCollectedController = TextEditingController();

  TextEditingController totalAmountController = TextEditingController();
  TextEditingController totalBagsController = TextEditingController();
  TextEditingController orderTypeController = TextEditingController();

  bool isEditable = false;
  late String securityToken;

  @override
  void initState() {
    super.initState();

    final box = GetStorage();
    securityToken = box.read('securityToken') ?? '';

    print("🧾 Retrieved Security Token in screen (initState): $securityToken");
    selectedPaymentType = paymentTypeController.text.isNotEmpty
        ? paymentTypeController.text
        : 'Cash';
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the order details passed through Get.arguments
    final Orders? order0 = Get.arguments;
    // final Orders? order = Get.arguments;

    if (order0 == null) {
      return Scaffold(
        appBar:
            AppBar(title: Text("Order Details"), backgroundColor: primeryColor),
        body: Center(
            child: CircularProgressIndicator()), // Show loader if order is null
      );
    }
    // ✅ Now safely assign it to a non-nullable variable
    final order = order0;

    // Populate text fields with order data, ensuring null safety
    orderStatusController.text = order.orderStatus ?? "N/A";
    totalPriceController.text = order.orderPrice ?? "0.00";
    orderTypeController.text = order.orderType ?? "N/A";
    subtotalController.text = order.laundromatDetails.storePrice ?? "0.00";
    deliveryChargeController.text =
        order.laundromatDetails.deliveryCharges ?? "0.00";
    platformFeeController.text = order.platformPrice ?? "0.00";
    totalBagsController.text = order.totalBags ?? "0";
    finalAmountController.text = order.totalPrice.toString() ?? "0.00";
    amountCollectedController.text = order.amount_collected.toString();
    weightController.text = order.weight.toString() ?? "0.0";
    paymentTypeController.text = order.paymentType ?? "Cash";
    paymentStatusController.text = order.paymentStatus ?? "N/A";
    deliveryInstructionsController.text =
        order.deliveryInstructions ?? "No Instructions";
    totalAmountController.text = order.totalAmount.toString() ?? "0.00";

    // totalBagsController.text = order.totalBags ?? "0";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order ID: ${order.orderId ?? 'Unknown'}",
          style: TextStyle(color: whiteColor),
        ),
        backgroundColor: primeryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.chat_bubble,
              color: whiteColor,
            ),
            onPressed: () {
              Get.to(() => ChatWithCustomer(
                    customerId: order.customer.userId?.toString() ?? '',
                    customerName: order.customer.name ?? '',
                  ));
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderInfo(),
              const SizedBox(height: 20),
              _buildOrderSummary(order),
              const SizedBox(height: 20),
              _buildProductDetails(order),
              const SizedBox(height: 20),
              _buildCustomerAddress(order),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(order),
    );
  }

  // Display Order Information
  Widget _buildOrderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading "Order Info"
        Text(
          "Order Info",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
            height: 10), // Add some space between heading and order details

        _buildDetailRow("Order Status", orderStatusController.text),
        _buildDetailRow("Total Price", totalPriceController.text),
        //   _buildEditableRow("Platform Fee", platformFeeController),
        // _buildEditableRow("Payment Type", paymentTypeController),
      ],
    );
  }

  // Display Order Summary
  Widget _buildOrderSummary(Orders order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow("Subtotal", subtotalController.text),
        _buildDetailRow("Delivery Charge", deliveryChargeController.text),
        // _buildDetailRow("Platform Fee", platformFeeController.text),

        _buildEditableRow("Platform Fee", platformFeeController),
        // _buildEditableRow("Payment Type", paymentTypeController),
        // Payment Type Dropdown
        _buildPaymentTypeDropdown(),

        // Show Delivery Instructions only if order_type is "pickup & delivery"
        if (order.orderType == "pickup & delivery")
          _buildDeliveryInstructions(),

        Divider(),

        _buildDetailRow("Total Amount", totalAmountController.text),
        // ✅ Show this only if selectedPaymentType is Cash
        if (selectedPaymentType.toLowerCase() == "cash")
          _buildEditableRow("Amount Collected", amountCollectedController),

        // _buildDetailRow("Amount Collected", amountCollectedController.text),
        _buildDetailRow("Total Bags", totalBagsController.text ?? "N/A"),
        _buildEditableRow("Payment Status", paymentStatusController),
      ],
    );
  }

  // Widget _buildPaymentTypeDropdown() {
  //   // Define a list of payment types
  //   // List<String> paymentTypes = ['Cash', 'Credit', 'Debit', 'Online'];
  //   List<String> paymentTypes = ['Cash', 'Card', 'unpaid', "N/A","null","testing", 'cash', 'value', 'test'];
  //
  //   // A variable to hold the selected payment type
  //   String selectedPaymentType = paymentTypeController.text.isEmpty
  //       ? paymentTypes[0]
  //       : paymentTypeController.text;
  //
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           "Payment Type",
  //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //         ),
  //         DropdownButton<String>(
  //           value: selectedPaymentType,
  //           icon: Icon(Icons.arrow_downward),
  //           iconSize: 24,
  //           elevation: 16,
  //           style: TextStyle(color: Colors.black),
  //           onChanged: (String? newValue) {
  //             setState(() {
  //               selectedPaymentType = newValue!;
  //               paymentTypeController.text =
  //                   selectedPaymentType; // Update the controller
  //             });
  //           },
  //           items: paymentTypes.map<DropdownMenuItem<String>>((String value) {
  //             return DropdownMenuItem<String>(
  //               value: value,
  //               child: Text(value),
  //             );
  //           }).toList(),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildPaymentTypeDropdown() {
    List<String> paymentTypes = [
      'Cash',
      'Card',
      'unpaid',
      "N/A",
      "null",
      "testing",
      'cash',
      'value',
      'test'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Payment Type",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          DropdownButton<String>(
            value: selectedPaymentType,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black),
            dropdownColor: Colors.white,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedPaymentType = newValue;
                  paymentTypeController.text = newValue;
                });
              }
            },
            items: paymentTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

// Define the _buildDeliveryInstructions method
  Widget _buildDeliveryInstructions() {
    // Define the options for delivery instructions
    List<String> deliveryOptions = [
      'Hand to Hand Delivery',
      'Leave at the Door'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivery Instructions",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        // Iterate over delivery options and create a RadioButton for each option
        ...deliveryOptions.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: deliveryInstructionsController.text.isEmpty
                ? 'Hand to Hand Delivery' // Default value if no selection
                : deliveryInstructionsController.text,
            onChanged: (String? newValue) {
              setState(() {
                deliveryInstructionsController.text = newValue!;
              });
            },
          );
        }),
      ],
    );
  }

  // // Display Product Details
  // Widget _buildProductDetails(Orders order) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text("Product Info", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //       const SizedBox(height: 5),
  //       // Iterate through the products
  //       Column(
  //         children: order.products?.map<Widget>((product) {
  //           return Card(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   _buildDetailRow("Product Name", product.productName ?? "N/A"),
  //                   _buildDetailRow("Variation", product.variationName ?? "N/A"),

  //                   _buildEditableRow("Quantity", TextEditingController(text: product.quantity?.toString() ?? "N/A")),
  //                    _buildEditableRow("Weight", TextEditingController(text: order.weight?.toString() ?? "N/A")),
  //                   _buildDetailRow("Price Per Item", product.price?.toString() ?? "N/A"),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }).toList() ?? [],
  //       ),
  //       // Display the Total Bags information
  //     Divider(),
  //     _buildDetailRow("Total Bags", totalBagsController.text ?? "0"), // Show total bags
  //     ],
  //   );
  // }
  Widget _buildProductDetails(Orders order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Product Info",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        // Iterate through the products
        Column(
          children: order.products.map<Widget>((product) {
                List<Widget> productDetails = [];

                productDetails.add(_buildDetailRow(
                    "Product Name", product.productName ?? "N/A"));
                // Create a controller for Quantity field
                TextEditingController quantityController =
                    TextEditingController(
                  text: product.quantity?.toString() ??
                      "0", // Default value if quantity is null
                );

                // Conditional logic for comforters and blankets
                if (product.productName == "Comforter " ||
                    product.productName == "blanket") {
                  productDetails.add(_buildDetailRow(
                      "Variation", product.variationName ?? "N/A"));
                  // productDetails.add(_buildEditableRow("Quantity", TextEditingController(text: product.quantity?.toString() ?? "N/A")));
                  // Use TextField to make Quantity editable
                  productDetails
                      .add(_buildEditableRow("Quantity", quantityController));
                }
                // Conditional logic for clothes
                else if (product.productName?.toLowerCase() == "clothes") {
                  // productDetails.add(_buildEditableRow(
                  //     "Weight",
                  //     TextEditingController(
                  //         text: order.weight?.toString() ?? "N/A")));
                  // productDetails.add(_buildEditableRow("Weight", weightController));
                  // productDetails.add(Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //   child: TextFormField(
                  //     controller: weightController,
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //       labelText: 'Weight (KG)',
                  //       border: OutlineInputBorder(),
                  //     ),
                  //   ),
                  // ));
                  productDetails.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: isEditable
                          ? TextFormField(
                              controller: weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Weight (LB)',
                                border: OutlineInputBorder(),
                              ),
                            )
                          : _buildDetailRow(
                              "Weight (KG)",
                              weightController.text.isNotEmpty
                                  ? weightController.text
                                  : (order.weight.toString() ?? "N/A"),
                            ),
                    ),
                  );

                  // 🟦 Confirm button for weight update
                  if (isEditable) {
                    productDetails.add(
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final double weight =
                                double.tryParse(weightController.text) ?? 0.0;
                            final int orderId = order.orderId ?? 0;
                            final int driverAssignedId =
                                order.driverAssignedId ?? 0;
                            final String orderPrice = order.orderPrice ?? "0.0";
                            final token = GetStorage()
                                    .read("StoreLogin")?["security_token"] ??
                                "";

                            if (weight == 0.0) {
                              Get.snackbar(
                                  "Error", "Please enter a valid weight");
                              return;
                            }

                            Get.find<UpdateWeightController>().updateOrder(
                              driverAssignedId: driverAssignedId,
                              orderId: orderId,
                              weight: weight,
                              orderPrice: orderPrice,
                              token: token,
                            );
                          },
                          child: Text("Confirm Weight"),
                        ),
                      ),
                    );
                  }
                  productDetails.add(_buildEditableRow("Total Bags",
                      totalBagsController)); // Editable bags for clothes
                }
                // Default case for other products

                // Always add the price per item to the product details
                productDetails.add(_buildDetailRow(
                    "Price Per Item", product.price?.toString() ?? "N/A"));

                // Return the product's details as a list of widgets
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: productDetails,
                    ),
                  ),
                );
              }).toList() ??
              [],
        ),
        Divider(),
        // _buildDetailRow("Total Bags", totalBagsController.text ?? "0"),
      ],
    );
  }

  // Display Customer Address
  Widget _buildCustomerAddress(Orders order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Customer Address",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        _buildDetailRow("address", order.customer.address ?? "N/A"),
      ],
    );
  }

  // Editable Row for Inputs
  Widget _buildEditableRow(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          isEditable
              ? Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType:
                        isNumber ? TextInputType.number : TextInputType.text,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                )
              : Text(controller.text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  // Helper function to display key-value details in a row
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Text("${label} : ",
      //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      //     Text(
      //       value,
      //       style: TextStyle(fontSize: 16),
      //       softWrap: true,
      //       maxLines: 3,
      //       overflow: TextOverflow.ellipsis,
      //     ),
      //   ],
      // ),
      child: Text(
        "$label : $value",
        style: TextStyle(fontSize: 16),
        softWrap: true,
      ),
    );
  }

  // Bottom Navigation Bar for Edit/Confirm Actions
  Widget _buildBottomBar(Orders order) {
    if (order.orderStatus.toLowerCase() == "completed") {
      return SizedBox.shrink(); // Return empty widget, i.e., nothing is shown
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: isEditable
                ? null
                : () {
                    if (order.orderType.toLowerCase() == "pickup & delivery") {
                      Get.snackbar(
                        "No Implementation",
                        "For this order type, service is not implemented yet",
                        backgroundColor: Colors.red[400],
                      );
                    } else if (order.orderType.toLowerCase() == "dropoff") {}
                    setState(() {
                      isEditable = true;
                    });
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // minimumSize: Size(double.infinity, 50),
              backgroundColor: isEditable ? Colors.grey : Colors.green,
            ),
            child: Text("Accept", style: TextStyle(color: Colors.white)),
          ),
          if (isEditable)
            ElevatedButton(
              // onPressed: () {
              //   setState(() {
              //     isEditable = false;
              //   });
              // },
              onPressed: () async {
                print("🔑 Order ID: ${order.orderId}");
                print("👤 Driver Assigned ID: ${order.driverAssignedId}");

                try {
                  bool success = await statusController.updateOrderStatus(
                    orderId: order.orderId ?? 0,
                    status: "cancelled",
                    driverId: order.driverAssignedId ?? 0,
                    securityToken: securityToken,
                  );

                  if (success) {
                    setState(() {
                      isEditable = false;
                    });

                    Get.snackbar(
                        "Cancelled", "Order has been cancelled successfully!",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignedOrdersScreen()),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    Get.snackbar("Error", "Failed to cancel order.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  }
                } catch (e) {
                  print("❌ Cancel update error: $e");
                  Get.snackbar("Error", "Failed to cancel order.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white);
                }
              },

              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
          if (isEditable)
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> updateData = {};

                // // if (platformFeeController.text != order.platformPrice) {
                // //   updateData["platform_fee"] = platformFeeController.text;
                // // }

                if (paymentTypeController.text != order.paymentStatus) {
                  updateData["payment_type"] = paymentTypeController.text;
                }
                // if (platformFeeController.text != order.platformPrice) {
                //   updateData["platform_fee"] = platformFeeController.text;
                // }

                // if (paymentTypeController.text != order.paymentStatus) {
                //   updateData["payment_type"] = paymentTypeController.text;
                // }
                if (paymentStatusController.text != order.paymentStatus) {
                  updateData["payment_status"] = paymentStatusController.text;
                }
                if (orderStatusController.text != order.orderStatus) {
                  updateData["order_status"] = orderStatusController.text;
                  //updateData["order_status"] = "in_process";
                }

                if (finalAmountController.text != order.totalPrice.toString()) {
                  updateData["total_price"] = finalAmountController.text;
                }
                if (amountCollectedController.text !=
                    order.amount_collected.toString()) {
                  updateData["amount_collected"] =
                      amountCollectedController.text;
                }
                if (totalBagsController.text != order.totalBags) {
                  updateData["total_bags"] = totalBagsController.text;
                }

                // ✅ Add optional debug print
                print("📤 Sending updateData: $updateData");
                print("🔑 Order ID: ${order.orderId}");
                print("👤 Driver Assigned ID: ${order.driverAssignedId}");
                if (updateData.isEmpty) {
                  Get.snackbar("Info", "No changes made to update.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blue,
                      colorText: Colors.white);
                  return;
                }
                try {
                  await updateOrderController.updateOrder(
                    orderData: updateData,
                    securityToken: securityToken,
                    orderId: order.orderId,
                    driverAssignedId: order.driverAssignedId,
                    paymentStatus: paymentStatusController.text,
                    paymentType: paymentTypeController.text,
                    // totalBags: totalBagsController.text,
                    totalBags: int.parse(totalBagsController.text),

                    amountCollected:
                        int.tryParse(amountCollectedController.text) ?? 0,
                  );
// 👇 Add this before navigation
                  await statusController.updateOrderStatus(
                    orderId: order.orderId ?? 0,
                    status: "in_process",
                    driverId: order.driverAssignedId ?? 0,
                    securityToken: securityToken,
                  );

                  setState(() {
                    isEditable = false;
                  });

                  Get.snackbar("Success", "Order updated successfully!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white);
                  // ✅ Navigate to next screen using Navigator.push
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LaundryPickupDetailsScreen(
                        orderId: order.orderId,
                        driverAssignedId: order.driverAssignedId,
                      ),
                    ),
                  );
                } catch (e) {
                  print("❌ Update error: $e");
                  Get.snackbar("Error", "Failed to update order.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text("Confirm", style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
    );
  }
}
