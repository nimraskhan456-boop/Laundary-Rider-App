
// // // import 'package:deliveryboy/utils/Colors.dart';
// // // import 'package:flutter/material.dart';
// // // import 'become.dart'; // The next screen in the flow

// // // class DriverRegistrationScreen extends StatefulWidget {
// // //   @override
// // //   _DriverRegistrationScreenState createState() =>
// // //       _DriverRegistrationScreenState();
// // // }

// // // class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
// // //   final TextEditingController emailController = TextEditingController();
// // //   final TextEditingController passwordController = TextEditingController();
// // //   final TextEditingController countryCodeController =
// // //       TextEditingController(text: "+92");
// // //   final TextEditingController mobileController = TextEditingController();

// // //   final Map<String, dynamic> formData = {}; // To store collected data
// // //   bool isLoading = false;

// // //   void navigateToNextScreen() {
// // //     // Validate required fields
// // //     if (emailController.text.isEmpty ||
// // //         passwordController.text.isEmpty ||
// // //         mobileController.text.isEmpty) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("Please fill all the required fields")),
// // //       );
// // //       return;
// // //     }

// // //     // Save data and navigate to the next screen
// // //     formData["driver_email"] = emailController.text;
// // //     formData["driver_password"] = passwordController.text;
// // //     formData["ccode"] = countryCodeController.text;
// // //     formData["mobile"] = mobileController.text;

// // //     Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => BecomeDriverForm(formData: formData), // Updated to navigate to BecomeDriverScreen
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("Driver Registration"),
// // //         backgroundColor: primeryColor,
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16),
// // //         child: SingleChildScrollView(
// // //           child: Column(
// // //             children: [
              
// // //               const SizedBox(height: 20),

// // //               // Email
// // //               TextField(
// // //                 controller: emailController,
// // //                 decoration: const InputDecoration(
// // //                   labelText: 'Email',
// // //                   border: OutlineInputBorder(),
// // //                 ),
// // //                 keyboardType: TextInputType.emailAddress,
// // //               ),
// // //               const SizedBox(height: 10),

// // //               // Password
// // //               TextField(
// // //                 controller: passwordController,
// // //                 decoration: const InputDecoration(
// // //                   labelText: 'Password',
// // //                   border: OutlineInputBorder(),
// // //                 ),
// // //                 obscureText: true,
// // //               ),
// // //               const SizedBox(height: 10),

// // //               // Country Code
// // //               TextField(
// // //                 controller: countryCodeController,
// // //                 decoration: const InputDecoration(
// // //                   labelText: 'Country Code',
// // //                   border: OutlineInputBorder(),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 10),

// // //               // Mobile
// // //               TextField(
// // //                 controller: mobileController,
// // //                 decoration: const InputDecoration(
// // //                   labelText: 'Mobile',
// // //                   border: OutlineInputBorder(),
// // //                 ),
// // //                 keyboardType: TextInputType.phone,
// // //               ),
// // //               const SizedBox(height: 20),

// // //               // Next Button
// // //               ElevatedButton(
// // //                 onPressed: navigateToNextScreen,
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: Darkblue,
// // //                   minimumSize: const Size(double.infinity, 40),
// // //                 ),
// // //                 child: const Text("Next"),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       backgroundColor: WhiteColor,
// // //     );
// // //   }
// // // }
// // //----------------------------
// // import 'package:deliveryboy/utils/Colors.dart';
// // import 'package:flutter/material.dart';
// // import 'package:country_code_picker/country_code_picker.dart';
// // import 'become.dart';

// // class DriverRegistrationScreen extends StatefulWidget {
// //   @override
// //   _DriverRegistrationScreenState createState() => _DriverRegistrationScreenState();
// // }

// // class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController countryCodeController = TextEditingController(text: "+92");
// //   final TextEditingController mobileController = TextEditingController();

// //   final Map<String, dynamic> formData = {};
// //   bool isLoading = false;
// //   bool isPasswordVisible = false;

// //   void navigateToNextScreen() {
// //     if (emailController.text.isEmpty || passwordController.text.isEmpty || mobileController.text.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Please fill all the required fields")),
// //       );
// //       return;
// //     }

// //     formData["driver_email"] = emailController.text;
// //     formData["driver_password"] = passwordController.text;
// //     formData["ccode"] = countryCodeController.text;
// //     formData["mobile"] = mobileController.text;

// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => BecomeDriverForm(formData: formData)),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       backgroundColor: WhiteColor,
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             // Header with Title & Overlapping Logo
// //             Stack(
// //               clipBehavior: Clip.none,
// //               children: [
// //                 Container(
// //                   height: 200, // Increased height to fix overlap issue
// //                   width: double.infinity,
// //                   decoration: BoxDecoration(
// //                     color: primeryColor,
// //                     borderRadius: const BorderRadius.only(
// //                       bottomLeft: Radius.circular(45),
// //                       bottomRight: Radius.circular(45),
// //                     ),
// //                   ),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       const SizedBox(height: 50), // Spacing for back button
// //                       Text(
// //                         "Create Your Account",
// //                         style: TextStyle(
// //                           fontSize: 22,
// //                           fontWeight: FontWeight.bold,
// //                           color: WhiteColor,
// //                         ),
// //                         textAlign: TextAlign.center,
// //                       ),
// //                       const SizedBox(height: 30), // Extra space to avoid overlapping logo
// //                     ],
// //                   ),
// //                 ),
// //                 Positioned(
// //                   top: 50,
// //                   left: 16,
// //                   child: IconButton(
// //                     icon: Icon(Icons.arrow_back, color: WhiteColor),
// //                     onPressed: () => Navigator.pop(context),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: -40, // Overlap effect
// //                   left: (screenWidth / 2) - 50, // Center the logo dynamically
// //                   child: Container(
// //                     padding: const EdgeInsets.all(12),
// //                     decoration: BoxDecoration(
// //                       color: WhiteColor,
// //                       borderRadius: BorderRadius.circular(20),
// //                       boxShadow: [
// //                         BoxShadow(color: greyColor, blurRadius: 10, spreadRadius: 2),
// //                       ],
// //                     ),
// //                     child: Column(
// //                       children: [
// //                         Image.asset("assets/logo.png", width: 80), // Increased size for clarity
// //                         const SizedBox(height: 4),
// //                         Text(
// //                           "FastLaundry",
// //                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primeryColor),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 70), // Adjusted for correct spacing

// //             // Full Name
// //             _buildTextField("Full Name", Icons.person, TextInputType.text, null, screenWidth),

// //             // Email Address
// //             _buildTextField("Email Address", Icons.email, TextInputType.emailAddress, emailController, screenWidth),

// //             // Mobile Number with Country Code Picker
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Text("Mobile Number", style: TextStyle(fontWeight: FontWeight.w600)),
// //                   const SizedBox(height: 5),
// //                   Row(
// //                     children: [
// //                       CountryCodePicker(
// //                         onChanged: (code) => countryCodeController.text = code.dialCode!,
// //                         initialSelection: 'PK',
// //                         favorite: ['+92', 'PK'],
// //                         showCountryOnly: false,
// //                         showOnlyCountryWhenClosed: false,
// //                         alignLeft: false,
// //                       ),
// //                       Expanded(
// //                         child: TextField(
// //                           controller: mobileController,
// //                           keyboardType: TextInputType.phone,
// //                           decoration: _inputDecoration("Mobile Number", Icons.phone),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 10),
// //                 ],
// //               ),
// //             ),

// //             // Password
// //             _buildPasswordField(screenWidth),

// //             // Continue Button with Auto Sizing
// //             const SizedBox(height: 20),
// //             SizedBox(
// //               width: screenWidth * 0.7,
// //               height: 48,
// //               child: ElevatedButton(
// //                 onPressed: navigateToNextScreen,
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: primeryColor,
// //                   padding: const EdgeInsets.symmetric(vertical: 12),
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //                 ),
// //                 child: isLoading
// //                     ? CircularProgressIndicator(color: WhiteColor)
// //                     : const Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTextField(String label, IconData icon, TextInputType keyboardType, TextEditingController? controller, double screenWidth) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
// //           const SizedBox(height: 5),
// //           SizedBox(
// //             width: screenWidth * 0.9,
// //             child: TextField(
// //               controller: controller,
// //               keyboardType: keyboardType,
// //               decoration: _inputDecoration(label, icon),
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildPasswordField(double screenWidth) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
// //           const SizedBox(height: 5),
// //           SizedBox(
// //             width: screenWidth * 0.9,
// //             child: TextField(
// //               controller: passwordController,
// //               obscureText: !isPasswordVisible,
// //               decoration: InputDecoration(
// //                 hintText: "Password",
// //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// //                 prefixIcon: const Icon(Icons.lock),
// //                 suffixIcon: IconButton(
// //                   icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
// //                   onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
// //                 ),
// //                 filled: true,
// //                 fillColor: greyColor,
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //         ],
// //       ),
// //     );
// //   }

// //   InputDecoration _inputDecoration(String hint, IconData icon) {
// //     return InputDecoration(
// //       hintText: hint,
// //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// //       prefixIcon: Icon(icon),
// //       filled: true,
// //       fillColor: greyColor,
// //     );
// //   }
// // }

// // import 'package:deliveryboy/controller/registeration_controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';


// // class DriverRegistrationScreen extends StatefulWidget {
// //   @override
// //   _DriverRegistrationScreenState createState() => _DriverRegistrationScreenState();
// // }

// // class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
// //   final TextEditingController firstNameController = TextEditingController();
// //   final TextEditingController lastNameController = TextEditingController();
// //   final TextEditingController dobController = TextEditingController();
// //   final TextEditingController stateController = TextEditingController();
// //   final TextEditingController ssnController = TextEditingController();
// //   final TextEditingController driverTypeController = TextEditingController();
// //   final TextEditingController contactDetailsController = TextEditingController();
// //   final TextEditingController zoneController = TextEditingController();
// //   final TextEditingController languageController = TextEditingController();
// //   final TextEditingController accountNumberController = TextEditingController();
// //   final TextEditingController routingNumberController = TextEditingController();
// //   final TextEditingController addressController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController countryCodeController = TextEditingController(text: "+92");
// //   final TextEditingController mobileController = TextEditingController();

// //   bool vehicleInsured = false;
// //   bool canLiftWeight = false;
// //   bool isTwentyYearsOld = false;

// //   final DriverController driverController = Get.put(DriverController());

// //   void handleRegister() {
// //     final data = {
// //       "first_name": firstNameController.text,
// //       "last_name": lastNameController.text,
// //       "dob": dobController.text,
// //       "state_id": stateController.text,
// //       "ssn": ssnController.text,
// //       "driver_type": driverTypeController.text,
// //       "contact_details": contactDetailsController.text,
// //       "zone": int.tryParse(zoneController.text) ?? 1,
// //       "status": "active",
// //       "language": languageController.text,
// //       "account_number": accountNumberController.text,
// //       "routing_number": routingNumberController.text,
// //       "address": addressController.text,
// //       "condition_vehicle_insured": vehicleInsured,
// //       "condition_lift_weight": canLiftWeight,
// //       "condition_20_years": isTwentyYearsOld,
// //       "driver_email": emailController.text,
// //       "driver_password": passwordController.text,
// //       "ccode": countryCodeController.text,
// //       "mobile": mobileController.text,
// //     };

// //     driverController.registerDriver(data);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Driver Registration"), backgroundColor: Colors.cyan),
// //       body: Padding(
// //         padding: EdgeInsets.all(16),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               buildTextField(firstNameController, 'First Name'),
// //               buildTextField(lastNameController, 'Last Name'),
// //               buildTextField(dobController, 'Date of Birth (YYYY-MM-DD)'),
// //               buildTextField(stateController, 'State ID'),
// //               buildTextField(ssnController, 'SSN'),
// //               buildTextField(driverTypeController, 'Driver Type'),
// //               buildTextField(contactDetailsController, 'Contact Details'),
// //               buildTextField(zoneController, 'Zone', isNumber: true),
// //               buildTextField(languageController, 'Language'),
// //               buildTextField(accountNumberController, 'Account Number'),
// //               buildTextField(routingNumberController, 'Routing Number'),
// //               buildTextField(addressController, 'Address'),
// //               buildTextField(emailController, 'Email'),
// //               buildTextField(passwordController, 'Password', isPassword: true),
// //               buildTextField(countryCodeController, 'Country Code'),
// //               buildTextField(mobileController, 'Mobile', isNumber: true),
// //               SizedBox(height: 20),

// //               // ✅ Checkboxes
// //               buildCheckbox('Is your vehicle insured?', vehicleInsured, (value) {
// //                 setState(() => vehicleInsured = value!);
// //               }),
// //               buildCheckbox('Can you lift weights?', canLiftWeight, (value) {
// //                 setState(() => canLiftWeight = value!);
// //               }),
// //               buildCheckbox('Are you 20 years or older?', isTwentyYearsOld, (value) {
// //                 setState(() => isTwentyYearsOld = value!);
// //               }),

// //               SizedBox(height: 20),

// //               // ✅ Register Button
// //               Obx(() => driverController.isLoading.value
// //                   ? CircularProgressIndicator()
// //                   : ElevatedButton(
// //                       onPressed: handleRegister,
// //                       child: Text("Register"),
// //                     )),

// //               // ✅ Success & Error Messages
// //               Obx(() => driverController.successMessage.value.isNotEmpty
// //                   ? Text(driverController.successMessage.value, style: TextStyle(color: Colors.green))
// //                   : Container()),
// //               Obx(() => driverController.errorMessage.value.isNotEmpty
// //                   ? Text(driverController.errorMessage.value, style: TextStyle(color: Colors.red))
// //                   : Container()),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   /// ✅ Common Method for Text Fields
// //   Widget buildTextField(TextEditingController controller, String label, {bool isPassword = false, bool isNumber = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 5),
// //       child: TextField(
// //         controller: controller,
// //         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
// //         obscureText: isPassword,
// //         keyboardType: isNumber ? TextInputType.number : TextInputType.text,
// //       ),
// //     );
// //   }

// //   /// ✅ Common Method for Checkboxes
// //   Widget buildCheckbox(String title, bool value, Function(bool?) onChanged) {
// //     return CheckboxListTile(
// //       title: Text(title),
// //       value: value,
// //       onChanged: onChanged,
// //     );
// //   }
// // }
// //hehehehehe
// import 'package:deliveryboy/controller/registeration_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:country_code_picker/country_code_picker.dart';

// class DriverRegistrationScreen extends StatefulWidget {
//   @override
//   _DriverRegistrationScreenState createState() => _DriverRegistrationScreenState();
// }

// class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController ssnController = TextEditingController();
//   final TextEditingController driverTypeController = TextEditingController();
//   final TextEditingController contactDetailsController = TextEditingController();
//   final TextEditingController zoneController = TextEditingController();
//   final TextEditingController languageController = TextEditingController();
//   final TextEditingController accountNumberController = TextEditingController();
//   final TextEditingController routingNumberController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   String selectedCountryCode = "+92";

//   bool vehicleInsured = false;
//   bool canLiftWeight = false;
//   bool isTwentyYearsOld = false;

//   final DriverController driverController = Get.put(DriverController());

//   void handleRegister() {
//     final data = {
//       "first_name": firstNameController.text,
//       "last_name": lastNameController.text,
//       "dob": dobController.text,
//       "state_id": stateController.text,
//       "ssn": ssnController.text,
//       "driver_type": driverTypeController.text,
//       "contact_details": contactDetailsController.text,
//       "zone": int.tryParse(zoneController.text) ?? 1,
//       "status": "active",
//       "language": languageController.text,
//       "account_number": accountNumberController.text,
//       "routing_number": routingNumberController.text,
//       "address": addressController.text,
//       "condition_vehicle_insured": vehicleInsured,
//       "condition_lift_weight": canLiftWeight,
//       "condition_20_years": isTwentyYearsOld,
//       "driver_email": emailController.text,
//       "driver_password": passwordController.text,
//       "ccode": selectedCountryCode,
//       "mobile": mobileController.text,
//     };

//     driverController.registerDriver(data);
//     Get.offNamed('/driverLoginScreen'); // ✅ Navigate to Login Screen After Registration
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.white,
//         child: Column(
//           children: [
//             // ✅ Header Section
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(vertical: 20),
//               decoration: BoxDecoration(
//                 color: Color(0xFF0057FF),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Image.asset(
//                     'assets/logo.png',
//                     height: 60,
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Register to start",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       buildTextField(firstNameController, 'First Name', Icons.person),
//                       buildTextField(lastNameController, 'Last Name', Icons.person_outline),
//                       buildTextField(dobController, 'Date of Birth (YYYY-MM-DD)', Icons.calendar_today),
//                       buildTextField(stateController, 'State ID', Icons.location_city),
//                       buildTextField(ssnController, 'SSN', Icons.security),
//                       buildTextField(driverTypeController, 'Driver Type', Icons.directions_car),
//                       buildTextField(contactDetailsController, 'Contact Details', Icons.contact_mail),
//                       buildTextField(zoneController, 'Zone', Icons.map, isNumber: true),
//                       buildTextField(languageController, 'Language', Icons.language),
//                       buildTextField(accountNumberController, 'Account Number', Icons.account_balance),
//                       buildTextField(routingNumberController, 'Routing Number', Icons.account_balance_wallet),
//                       buildTextField(addressController, 'Address', Icons.home),
//                       buildTextField(emailController, 'Email', Icons.email),
//                       buildTextField(passwordController, 'Password', Icons.lock, isPassword: true),
//                       Row(
//                         children: [
//                           CountryCodePicker(
//                             initialSelection: selectedCountryCode,
//                             onChanged: (code) {
//                               setState(() {
//                                 selectedCountryCode = code.dialCode!;
//                               });
//                             },
//                           ),
//                           Expanded(
//                             child: buildTextField(mobileController, 'Mobile', Icons.phone, isNumber: true),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),

//                       // ✅ Register Button
//                       Obx(() => driverController.isLoading.value
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                               onPressed: handleRegister,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFF0057FF),
//                                 padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               child: Text(
//                                 "Register",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             )),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(TextEditingController controller, String label, IconData icon, {bool isPassword = false, bool isNumber = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//           prefixIcon: Icon(icon),
//         ),
//         obscureText: isPassword,
//         keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       ),
//     );
//   }
// }
