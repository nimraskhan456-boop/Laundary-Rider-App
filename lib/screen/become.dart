// import 'package:country_code_picker/country_code_picker.dart';   
// import 'package:deliveryboy/controller/registeration_controller.dart';
// import 'package:deliveryboy/screen/driver_login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'rules.dart';

// class BecomeDriverForm extends StatefulWidget {
//    @override
//   _BecomeDriverFormState createState() => _BecomeDriverFormState();
// }

// class _BecomeDriverFormState extends State<BecomeDriverForm> {
//   final DriverController driverController = Get.put(DriverController());

//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final addressController = TextEditingController();
//   final emailController = TextEditingController();
//   final mobileController = TextEditingController();
//   final passwordController = TextEditingController();
//   String? selectedState;
//   String? selectedCity;
//   final zipCodeController = TextEditingController();

//   String selectedCountryCode = "+1"; // Default country code

//   // U.S. states and their cities
//   final Map<String, List<String>> statesWithCities = {
//     "California": ["Los Angeles", "San Diego", "San Francisco", "San Jose"],
//     "Texas": ["Houston", "Dallas", "Austin", "San Antonio"],
//     "Florida": ["Miami", "Orlando", "Tampa", "Jacksonville"],
//     "New York": ["New York City", "Buffalo", "Rochester", "Albany"],
//     "Illinois": ["Chicago", "Springfield", "Peoria", "Naperville"],
//     "Georgia": ["Atlanta", "Augusta", "Columbus", "Savannah"],
//     "Ohio": ["Columbus", "Cleveland", "Cincinnati", "Toledo"],
//   };

//   void navigateToNextScreen() {
//     if (firstNameController.text.isEmpty ||
//         lastNameController.text.isEmpty ||
//         addressController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         mobileController.text.isEmpty ||
//         passwordController.text.isEmpty ||
//         selectedState == null ||
//         selectedCity == null ||
//         zipCodeController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please fill all the required fields")),
//       );
//       return;
//     }

//     driverController.updateRegistrationData({
//       "first_name": firstNameController.text,
//       "last_name": lastNameController.text,
//       "address": addressController.text,
//       "driver_email": emailController.text,
//       "ccode": selectedCountryCode, 
//       "mobile": mobileController.text,
//       "driver_password": passwordController.text,
//       "state_id": selectedState,
//       "city_id": selectedCity,
//       "zipcode": zipCodeController.text,
//     });

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const RulesAndRegulationsScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         title: const Text("Create Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         elevation: 6,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Container(
//               width: 320,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
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
//                 children: [
//                   buildTextField(firstNameController, "First Name", Icons.person),
//                   buildTextField(lastNameController, "Last Name", Icons.person_outline),
//                   buildTextField(addressController, "Address", Icons.home),
//                   buildTextField(emailController, "Email", Icons.email, inputType: TextInputType.emailAddress),
//                   Row(
//                     children: [
//                       CountryCodePicker(
//                         onChanged: (code) {
//                           setState(() {
//                             selectedCountryCode = code.dialCode ?? "+1";
//                           });
//                         },
//                         initialSelection: 'US',
//                         favorite: ['+1', '+92'],
//                         showFlag: true,
//                         showCountryOnly: false,
//                         showOnlyCountryWhenClosed: false,
//                         alignLeft: false,
//                       ),
//                       Expanded(
//                         child: buildTextField(mobileController, "Mobile", Icons.phone, inputType: TextInputType.phone),
//                       ),
//                     ],
//                   ),
//                   buildTextField(passwordController, "Password", Icons.lock, obscure: true),
//                   DropdownButtonFormField(
//                     decoration: inputDecoration("State", Icons.map),
//                     items: statesWithCities.keys.map((state) => DropdownMenuItem(value: state, child: Text(state))).toList(),
//                     onChanged: (val) {
//                       setState(() {
//                         selectedState = val;
//                         selectedCity = null;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   DropdownButtonFormField(
//                     decoration: inputDecoration("City", Icons.location_city),
//                     items: (statesWithCities[selectedState] ?? [])
//                         .map((city) => DropdownMenuItem(value: city, child: Text(city)))
//                         .toList(),
//                     onChanged: (val) => setState(() => selectedCity = val),
//                   ),
//                   buildTextField(zipCodeController, "Zip Code", Icons.pin_drop, inputType: TextInputType.number),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: navigateToNextScreen,
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: primaryColor, padding: const EdgeInsets.symmetric(vertical: 20), minimumSize: const Size(double.infinity, 50)),
//                     child: const Text("Next", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(TextEditingController controller, String label, IconData icon,
//       {TextInputType inputType = TextInputType.text, bool obscure = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscure,
//         keyboardType: inputType,
//         decoration: inputDecoration(label, icon),
//       ),
//     );
//   }

//   InputDecoration inputDecoration(String label, IconData icon) {
//     return InputDecoration(
//       labelText: label,
//       prefixIcon: Icon(icon, color: primaryColor),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//     );
//   }
// }
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:deliveryboy/controller/registeration_controller.dart';
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:get/get.dart';
import 'rules.dart';

class BecomeDriverForm extends StatefulWidget {
  @override
  _BecomeDriverFormState createState() => _BecomeDriverFormState();
}

class _BecomeDriverFormState extends State<BecomeDriverForm> {
  final DriverController driverController = Get.put(DriverController());

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedStateId;
  String? selectedCityId;
  final zipCodeController = TextEditingController();

  String selectedCountryCode = "+1"; // Default country code

  // Hardcoded states and cities with IDs
  final List<Map<String, dynamic>> statesWithCities = [
    {"stateId": "1", "stateName": "California", "cities": [
      {"cityId": "101", "cityName": "Los Angeles"},
      {"cityId": "102", "cityName": "San Francisco"},
      {"cityId": "103", "cityName": "San Diego"}
    ]},
    {"stateId": "2", "stateName": "Texas", "cities": [
      {"cityId": "201", "cityName": "Houston"},
      {"cityId": "202", "cityName": "Dallas"},
      {"cityId": "203", "cityName": "Austin"}
    ]}
  ];

  void navigateToNextScreen() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        addressController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        passwordController.text.isEmpty ||
        selectedStateId == null ||
        selectedCityId == null ||
        zipCodeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the required fields")),
      );
      return;
    }

    // Send data to the driver controller
    driverController.updateRegistrationData({
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "address": addressController.text,
      "driver_email": emailController.text,
      "ccode": selectedCountryCode,
      "mobile": mobileController.text,
      "driver_password": passwordController.text,
      "state_id": selectedStateId, // Send State ID
      "city_id": selectedCityId,   // Send City ID
      "zipcode": zipCodeController.text,
    });

    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RulesAndRegulationsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Create Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
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
                children: [
                  buildTextField(firstNameController, "First Name", Icons.person),
                  buildTextField(lastNameController, "Last Name", Icons.person_outline),
                  buildTextField(addressController, "Address", Icons.home),
                  buildTextField(emailController, "Email", Icons.email, inputType: TextInputType.emailAddress),
                  Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            selectedCountryCode = code.dialCode ?? "+1";
                          });
                        },
                        initialSelection: 'US',
                        favorite: ['+1', '+92'],
                        showFlag: true,
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      Expanded(
                        child: buildTextField(mobileController, "Mobile", Icons.phone, inputType: TextInputType.phone),
                      ),
                    ],
                  ),
                  buildTextField(passwordController, "Password", Icons.lock, obscure: true),

                  // State Dropdown
                  DropdownButtonFormField<String>(
                    decoration: inputDecoration("State", Icons.map),
                    items: statesWithCities.map((state) {
                      return DropdownMenuItem<String>(
                        value: state['stateId'],
                        child: Text(state['stateName']),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedStateId = val;
                        selectedCityId = null; // Reset city
                      });
                    },
                  ),
                  const SizedBox(height: 10),

                  // City Dropdown
                  DropdownButtonFormField<String>(
                    decoration: inputDecoration("City", Icons.location_city),
                    items: selectedStateId == null
                        ? []
                        : (statesWithCities
                            .firstWhere((state) => state['stateId'] == selectedStateId)['cities']
                            as List)
                            .map((city) {
                              return DropdownMenuItem<String>(
                                value: city['cityId'],
                                child: Text(city['cityName']),
                              );
                            }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCityId = val;
                      });
                    },
                  ),
                  buildTextField(zipCodeController, "Zip Code", Icons.pin_drop, inputType: TextInputType.number),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: navigateToNextScreen,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, padding: const EdgeInsets.symmetric(vertical: 20), minimumSize: const Size(double.infinity, 50)),
                    child: const Text("Next", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label, IconData icon,
      {TextInputType inputType = TextInputType.text, bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: inputType,
        decoration: inputDecoration(label, icon),
      ),
    );
  }

  InputDecoration inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: primaryColor),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
