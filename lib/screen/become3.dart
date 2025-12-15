// import 'package:deliveryboy/controller/registeration_controller.dart';
// import 'package:deliveryboy/screen/driver_login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'add_vehicle.dart';

// class BecomeDriverScreen extends StatefulWidget {
//   const BecomeDriverScreen({super.key});

//   @override
//   _BecomeDriverScreenState createState() => _BecomeDriverScreenState();
// }

// class _BecomeDriverScreenState extends State<BecomeDriverScreen> {
//   final DriverController driverController = Get.find<DriverController>();

//   bool is18OrOlder = false;
//   bool canLift = false;
//   bool hasCar = false;

//   void navigateToNextScreen() {
//     if (is18OrOlder && canLift && hasCar) {
//       driverController.updateRegistrationData({
//         "age_check": is18OrOlder ? "1" : "0",
//         "can_lift_40_lb": canLift ? "1" : "0",
//         "register_car": hasCar ? "1" : "0",
//       });

//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const AddVehicleScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please agree to all conditions')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         title: const Text("Become Driver", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor:primaryColor,
//         elevation: 6,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//         ),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               width: 320,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: whiteColor,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.4),
//                     blurRadius: 10,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Requirements',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:primaryColor),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 20),
//                   CheckboxListTile(
//                     value: is18OrOlder,
//                     onChanged: (value) => setState(() => is18OrOlder = value!),
//                     title: const Text('I am 18 years or older'),
//                     activeColor: primaryColor,
//                     controlAffinity: ListTileControlAffinity.leading,
//                   ),
//                   CheckboxListTile(
//                     value: canLift,
//                     onChanged: (value) => setState(() => canLift = value!),
//                     title: const Text('Can lift 30-40 lbs'),
//                     activeColor:primaryColor,
//                     controlAffinity: ListTileControlAffinity.leading,
//                   ),
//                   CheckboxListTile(
//                     value: hasCar,
//                     onChanged: (value) => setState(() => hasCar = value!),
//                     title: const Text('Have a registered car'),
//                     activeColor: primaryColor,
//                     controlAffinity: ListTileControlAffinity.leading,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: navigateToNextScreen,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:primaryColor,
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       minimumSize: const Size(double.infinity, 50),
//                     ),
//                     child: const Text('Next', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.grey[200],
//     );
//   }
// }
import 'package:deliveryboy/controller/registeration_controller.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_vehicle.dart';

class BecomeDriverScreen extends StatefulWidget {
  const BecomeDriverScreen({super.key});

  @override
  _BecomeDriverScreenState createState() => _BecomeDriverScreenState();
}

class _BecomeDriverScreenState extends State<BecomeDriverScreen> {
  final DriverController driverController = Get.find<DriverController>();

  bool is18OrOlder = false;
  bool canLift = false;
  bool hasCar = false;

  void navigateToNextScreen() {
    if (is18OrOlder && canLift && hasCar) {
      // ✅ Convert `bool` to `int` (1 for true, 0 for false)
      driverController.updateRegistrationData({
        "age_check": is18OrOlder ? 1 : 0,  // ✅ Sending as `int`
        "can_lift_40_lb": canLift ? 1 : 0, // ✅ Sending as `int`
        "register_car": hasCar ? 1 : 0,    // ✅ Sending as `int`
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddVehicleScreen()),
      );
    } else {
      Get.snackbar(
        "Requirements Not Met",
        "Please agree to all conditions to proceed.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Become a Driver",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue[800], // Replace `primaryColor`
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
                color: Colors.white, // Replace `whiteColor`
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
                    'Requirements',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue), // Replace `primaryColor`
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    value: is18OrOlder,
                    onChanged: (value) => setState(() => is18OrOlder = value!),
                    title: const Text('I am 18 years or older'),
                    activeColor: Colors.blue, // Replace `primaryColor`
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: canLift,
                    onChanged: (value) => setState(() => canLift = value!),
                    title: const Text('Can lift 30-40 lbs'),
                    activeColor: Colors.blue, // Replace `primaryColor`
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: hasCar,
                    onChanged: (value) => setState(() => hasCar = value!),
                    title: const Text('Have a registered car'),
                    activeColor: Colors.blue, // Replace `primaryColor`
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: navigateToNextScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Replace `primaryColor`
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Next',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
