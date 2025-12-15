// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/rider_controller.dart';
//
// class UpdateRiderScreen extends StatelessWidget {
//   final RiderProfileController controller = Get.put(RiderProfileController());
//
//   final idController = TextEditingController(text: '3');
//   final titleController = TextEditingController();
//   final emailController = TextEditingController();
//   final ccodeController = TextEditingController(text: '+92');
//   final mobileController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Update Rider')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _inputField("Title", titleController),
//             _inputField("Email", emailController),
//             _inputField("Country Code", ccodeController),
//             _inputField("Mobile", mobileController),
//             _inputField("Password", passwordController, obscure: true),
//             const SizedBox(height: 20),
//             Obx(() => controller.isLoading.value
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//               onPressed: () {
//                 final data = {
//                   "id": idController.text,
//                   "title": titleController.text,
//                   "email": emailController.text,
//                   "ccode": ccodeController.text,
//                   "mobile": mobileController.text,
//                   "password": passwordController.text,
//                 };
//                 controller.updateRiderDetails(data);
//               },
//               child: Text("Update"),
//             )),
//             const SizedBox(height: 20),
//             Obx(() => Text(
//               controller.responseMsg.value,
//               style: TextStyle(color: Colors.green),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _inputField(String label, TextEditingController controller, {bool obscure = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: TextField(
//         controller: controller,
//         obscureText: obscure,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
// import 'package:deliveryboy/controller/rider_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class RiderProfileScreen extends StatelessWidget {
//   final RiderProfileController controller = Get.put(RiderProfileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Update Rider Profile")),
//       body: Obx(() => controller.isLoading.value
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller.nameController,
//               decoration: InputDecoration(labelText: "Name"),
//             ),
//             TextField(
//               controller: controller.emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               controller: controller.phoneController,
//               decoration: InputDecoration(labelText: "Phone"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: controller.updateRiderProfile,
//               child: Text("Update Profile"),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:deliveryboy/controller/rider_controller.dart';

class RiderProfileScreen extends StatefulWidget {
  @override
  State<RiderProfileScreen> createState() => _RiderProfileScreenState();
}

class _RiderProfileScreenState extends State<RiderProfileScreen> {
  final RiderProfileController controller = Get.put(RiderProfileController());

  @override
  void initState() {
    super.initState();
    controller.loadRiderData(); // ✅ Make sure rider_id is read from storage here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Rider Profile")),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: controller.phoneController,
              decoration: InputDecoration(labelText: "Phone"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.updateRiderProfile,
              child: Text("Update Profile"),
            ),
          ],
        ),
      )),
    );
  }
}
