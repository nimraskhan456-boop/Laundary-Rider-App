import 'package:deliveryboy/controller/registeration_controller.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'become3.dart';

class RulesAndRegulationsScreen extends StatefulWidget {
  const RulesAndRegulationsScreen({super.key});

  @override
  _RulesAndRegulationsScreenState createState() => _RulesAndRegulationsScreenState();
}

class _RulesAndRegulationsScreenState extends State<RulesAndRegulationsScreen> {
  final DriverController driverController = Get.find<DriverController>();

  bool isChecked = false;

  void navigateToNextScreen() {
    if (isChecked) {
      driverController.updateRegistrationData({"rules_regulation": "1"});

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BecomeDriverScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the rules before proceeding.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Rules and Regulations", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: primaryColor,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Rules and Regulations',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Use this Business Rule template to describe how company policies or practices apply to your business. Business rules identify the appropriate action that needs to be taken and remove any ambiguity regarding the rules.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    value: isChecked,
                    onChanged: (value) => setState(() => isChecked = value!),
                    title: const Text('I agree to the rules and regulations'),
                    activeColor: primaryColor,
                    controlAffinity: ListTileControlAffinity.leading,
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
      backgroundColor: Colors.grey[200],
    );
  }
}
