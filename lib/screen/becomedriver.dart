// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // For input formatters
// import 'package:get/get.dart'; // For displaying snackbars
// import 'package:intl_phone_field/intl_phone_field.dart'; // For phone number input with country code
// import 'package:pinput/pinput.dart'; // For OTP input
// import 'package:sms_autofill/sms_autofill.dart'; // For SMS autofill
// import 'become.dart'; // Next screen after successful OTP verification

// class BecomeDriverScreen extends StatefulWidget {
//   const BecomeDriverScreen({super.key});

//   @override
//   _BecomeDriverScreenState createState() => _BecomeDriverScreenState();
// }

// class _BecomeDriverScreenState extends State<BecomeDriverScreen> {
//   // Controller for phone number input
//   final TextEditingController phoneController = TextEditingController();

//   // Controller for OTP input
//   final TextEditingController otpController = TextEditingController();

//   // Form key for validating phone number input
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   String? appSignature; // Holds the app signature for SMS Retriever API
//   String generatedCode = "123456"; // Simulated OTP for testing
//   String selectedCountryCode = "+1"; // Default country code

//   @override
//   void initState() {
//     super.initState();
//     // _initializeAppSignature(); // Retrieve app signature for SMS integration
//   }

//   // Retrieve the app signature for SMS integration
//   // Future<void> _initializeAppSignature() async {
//   //   try {
//   //     // Get the app signature (required for sending SMS with signature)
//   //     appSignature = await SmsAutoFill().getAppSignature();
//   //     print("App Signature: $appSignature"); // Debugging: Print the app signature
//   //   } catch (e) {
//   //     print("Failed to retrieve app signature: $e"); // Handle errors gracefully
//   //   }
//   // }

//   // Simulate sending OTP to the user's phone number
//   void sendCode() {
//     if (_formKey.currentState!.validate()) {
//       // Show a snackbar to confirm that OTP was sent
//       Get.snackbar(
//         "Code Sent",
//         "A verification code has been sent to $selectedCountryCode ${phoneController.text}",
//         snackPosition: SnackPosition.BOTTOM,
//       );

//       // Debugging: Print the generated OTP and app signature
//       print("Send OTP: $generatedCode with App Signature: $appSignature");
//     }
//   }

//   // Confirm the entered OTP and navigate to the next screen if valid
//   void confirmCode() {
//     if (otpController.text == generatedCode) {
//       // Show success message if OTP matches
//       Get.snackbar(
//         "Success",
//         "Phone number verified successfully!",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );

//       // Navigate to the next screen (BecomeDriverForm)
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => BecomeDriverForm()),
//       );
//     } else {
//       // Show error message if OTP is incorrect
//       Get.snackbar(
//         "Error",
//         "Invalid code. Please try again.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50], // Light blue background
//       appBar: AppBar(
//         title: const Text("Become Driver"), // AppBar title
//         backgroundColor: Colors.blue, // AppBar color
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0), // Add padding around the form
//         child: Form(
//           key: _formKey, // Attach the form key for validation
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Title text
//               const Text(
//                 "Become Driver",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               const SizedBox(height: 20), // Add spacing

//               // Phone Number Input Field with Country Code Picker
//               IntlPhoneField(
//                 controller: phoneController, // Controller for phone input
//                 decoration: const InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//                 initialCountryCode: 'US', // Default country code
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly, // Allow only numeric input
//                 ],
//                 onChanged: (phone) {
//                   // Update the selected country code
//                   selectedCountryCode = phone.countryCode;
//                 },
//                 validator: (value) {
//                   // Validate the phone number input
//                   if (value == null || value.number.isEmpty) {
//                     return 'Please enter a valid phone number';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20), // Add spacing

//               // Send OTP Button
//               ElevatedButton(
//                 onPressed: sendCode, // Button text
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button color
//                 ), // Call the sendCode method
//                 child: const Text("Send Code"),
//               ),
//               const SizedBox(height: 20), // Add spacing

//               // Instruction text for OTP confirmation
//               const Text(
//                 "Confirm code",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.blue,
//                 ),
//               ),
//               const SizedBox(height: 10), // Add spacing

//               // OTP Input Field using Pinput
//               Pinput(
//                 length: 6, // The OTP length
//                 controller: otpController, // Controller for OTP input
//                 defaultPinTheme: PinTheme(
//                   width: 40, // Width of each OTP box
//                   height: 50, // Height of each OTP box
//                   textStyle: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey), // Border styling
//                     borderRadius: BorderRadius.circular(8), // Rounded corners
//                   ),
//                 ),
//                 onCompleted: (pin) {
//                   // Print the OTP once all digits are entered
//                   print("Entered OTP: $pin");
//                 },
//               ),
              
//               const SizedBox(height: 20), // Add spacing

//               // Confirm OTP Button
//               ElevatedButton(
//                 onPressed: confirmCode, // Button text
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button color
//                 ), // Call the confirmCode method
//                 child: const Text("Confirm"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
