import 'package:deliveryboy/controller/registeration_controller.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'personalinfo.dart';

class BackgroundCheckScreen extends StatefulWidget {
  const BackgroundCheckScreen({super.key});

  @override
  _BackgroundCheckScreenState createState() => _BackgroundCheckScreenState();
}

class _BackgroundCheckScreenState extends State<BackgroundCheckScreen> {
  final DriverController driverController = Get.find<DriverController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController ssnController = TextEditingController();
  final TextEditingController confirmSsnController = TextEditingController();

  void navigateToNextScreen() {
    if (formKey.currentState!.validate()) {
      driverController.updateRegistrationData({
        "dob": dobController.text,
        "ssn": ssnController.text,
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PersonalInfoScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Background Check", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:primaryColor,
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Background Check',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: dobController,
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Date of birth is required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: ssnController,
                      decoration: const InputDecoration(
                        labelText: 'SSN / EIN',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.perm_identity),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'SSN/EIN is required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: confirmSsnController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm SSN / EIN',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.check_circle_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please confirm your SSN/EIN';
                        if (value != ssnController.text) return 'SSN/EIN does not match';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: navigateToNextScreen,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Next', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
