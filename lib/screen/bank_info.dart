import 'package:deliveryboy/controller/registeration_controller.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:deliveryboy/screen/driver_login_screen.dart';

class BankInfoScreen extends StatefulWidget {
  const BankInfoScreen({super.key});

  @override
  _BankInfoScreenState createState() => _BankInfoScreenState();
}

class _BankInfoScreenState extends State<BankInfoScreen> {
  final DriverController driverController = Get.find<DriverController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController routingNumberController = TextEditingController();
  final TextEditingController confirmAccountNumberController =
      TextEditingController();

  bool isLoading = false;

  void handleRegister() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    driverController.updateRegistrationData({
      "bank_account_number": accountNumberController.text,
      "bank_routing_number": routingNumberController.text,
      "zone_id": 1,
      "status": "active",
      "laundry_id": "2",
      "driver_type": "active",
      "contact_details": "active",
      "language": "active",
    });

    try {
      // await driverController.registerDriver();
      await driverController.submitFinalRegistration();

      setState(() => isLoading = false);

      if (driverController.errorMessage.value.isEmpty) {
        Get.snackbar(
            "Success",
            driverController.successMessage.value.isNotEmpty
                ? driverController.successMessage.value
                : "Registration successful!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: primaryColor,
            colorText: whiteColor);
        Get.offAll(() => DriverLoginScreen());
      } else {
        Get.snackbar("Error", driverController.errorMessage.value,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: RedColor,
            colorText: whiteColor);
      }
    } catch (e) {
      setState(() => isLoading = false);
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: RedColor,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Info'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bank Info',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: routingNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Routing No',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Routing Number is required'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: accountNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Account No',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Account Number is required'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: confirmAccountNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Account No',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please confirm your Account Number';
                    if (value != accountNumberController.text)
                      return 'Account Number does not match';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isLoading ? null : handleRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor,
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
