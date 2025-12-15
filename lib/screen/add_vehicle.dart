import 'package:deliveryboy/controller/registeration_controller.dart'; 
import 'package:deliveryboy/screen/driver_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'background_check.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final DriverController driverController = Get.find<DriverController>();

  final ValueNotifier<bool> _isChecked = ValueNotifier(false);
  bool _hasInsurance = false; // New boolean for the insurance checkbox
  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  String? selectedModel;
  String? selectedMake;
  String? selectedYear;
  String? selectedColor;

  Future<XFile?> _showImageSourceDialog() async {
    return await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  final image = await _picker.pickImage(source: ImageSource.camera);
                  Navigator.of(context).pop(image);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  final image = await _picker.pickImage(source: ImageSource.gallery);
                  Navigator.of(context).pop(image);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Add Vehicle', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
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
                  const Text('Vehicle Information',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor)),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Model', border: OutlineInputBorder()),
                    items: ['Model 1', 'Model 2', 'Model 3']
                        .map((model) => DropdownMenuItem(value: model, child: Text(model)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedModel = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Make', border: OutlineInputBorder()),
                    items: ['Make 1', 'Make 2', 'Make 3']
                        .map((make) => DropdownMenuItem(value: make, child: Text(make)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedMake = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Year', border: OutlineInputBorder()),
                    items: ['2020', '2021', '2022']
                        .map((year) => DropdownMenuItem(value: year, child: Text(year)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedYear = value),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Color', border: OutlineInputBorder()),
                    items: ['Red', 'Blue', 'Black']
                        .map((color) => DropdownMenuItem(value: color, child: Text(color)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedColor = value),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      final image = await _showImageSourceDialog();
                      if (image != null) {
                        setState(() {
                          _selectedImage = image;
                          driverController.setVehiclePhoto(File(image.path));
                        });
                      }
                    },
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: _selectedImage == null
                          ? const Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(File(_selectedImage!.path), fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Add Vehicle Photo', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text("I have insurance for my car"),
                    value: _hasInsurance,
                    onChanged: (value) {
                      setState(() {
                        _hasInsurance = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      driverController.updateRegistrationData({
                        "model": selectedModel,
                        "make": selectedMake,
                        "year": selectedYear,
                        "color": selectedColor,
                        "vehicle_insured": _hasInsurance ? "1" : "0",
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BackgroundCheckScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Next', style: TextStyle(fontSize: 18)),
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
// import 'package:deliveryboy/controller/registeration_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'background_check.dart';

// class AddVehicleScreen extends StatefulWidget {
//   const AddVehicleScreen({super.key});

//   @override
//   _AddVehicleScreenState createState() => _AddVehicleScreenState();
// }

// class _AddVehicleScreenState extends State<AddVehicleScreen> {
//   final DriverController driverController = Get.find<DriverController>();
//   final ImagePicker _picker = ImagePicker();

//   XFile? _selectedImage;
//   bool _hasInsurance = false;
//   String? selectedModel, selectedMake, selectedYear, selectedColor;
//   bool _isUploading = false; // Prevents multiple taps on the button

//   /// ✅ **Pick and Upload Image with Error Handling**
//   Future<void> _pickAndUploadImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image == null) {
//       Get.snackbar("Image Required", "Please select an image.",
//           backgroundColor: Colors.orange, colorText: Colors.white);
//       return;
//     }

//     setState(() {
//       _selectedImage = image;
//       _isUploading = true; // Show loading while uploading
//     });

//     try {
//       String imageUrl = await driverController.uploadImage(File(image.path), "vehicle");
//       if (imageUrl.isNotEmpty) {
//         driverController.setVehiclePhotoUrl(imageUrl);
//       } else {
//         Get.snackbar("Upload Failed", "Could not upload image. Try again.",
//             backgroundColor: Colors.red, colorText: Colors.white);
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Image upload failed: $e",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     } finally {
//       setState(() {
//         _isUploading = false; // Remove loading state
//       });
//     }
//   }

//   /// ✅ **Submit Vehicle Details**
//   void _submitVehicleDetails() {
//     if (selectedModel == null || selectedMake == null || selectedYear == null || selectedColor == null) {
//       Get.snackbar("Error", "Please fill all vehicle details before proceeding.",
//           backgroundColor: Colors.red, colorText: Colors.white);
//       return;
//     }

//     if (_selectedImage == null) {
//       Get.snackbar("Error", "Please upload a vehicle photo.",
//           backgroundColor: Colors.red, colorText: Colors.white);
//       return;
//     }

//     setState(() {
//       _isUploading = true;
//     });

//     driverController.updateRegistrationData({
//       "model": selectedModel ?? "",
//       "make": selectedMake ?? "",
//       "year": selectedYear ?? "",
//       "color": selectedColor ?? "",
//       "vehicle_insured": _hasInsurance ? 1 : 0, // ✅ Convert bool to int
//     });

//     Future.delayed(const Duration(seconds: 1), () {
//       setState(() {
//         _isUploading = false;
//       });
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const BackgroundCheckScreen()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Vehicle')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Vehicle Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

//             const SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Model'),
//               items: ['Model 1', 'Model 2', 'Model 3']
//                   .map((model) => DropdownMenuItem(value: model, child: Text(model)))
//                   .toList(),
//               onChanged: (value) => setState(() => selectedModel = value),
//             ),

//             const SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Make'),
//               items: ['Make A', 'Make B', 'Make C']
//                   .map((make) => DropdownMenuItem(value: make, child: Text(make)))
//                   .toList(),
//               onChanged: (value) => setState(() => selectedMake = value),
//             ),

//             const SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Year'),
//               items: ['2022', '2023', '2024']
//                   .map((year) => DropdownMenuItem(value: year, child: Text(year)))
//                   .toList(),
//               onChanged: (value) => setState(() => selectedYear = value),
//             ),

//             const SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Color'),
//               items: ['Red', 'Blue', 'Black', 'White']
//                   .map((color) => DropdownMenuItem(value: color, child: Text(color)))
//                   .toList(),
//               onChanged: (value) => setState(() => selectedColor = value),
//             ),

//             const SizedBox(height: 20),
//             const Text("Upload Vehicle Photo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

//             const SizedBox(height: 10),
//             GestureDetector(
//               onTap: _isUploading ? null : _pickAndUploadImage, // Disable while uploading
//               child: Container(
//                 height: 120,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: _selectedImage == null
//                     ? const Center(child: Icon(Icons.add_a_photo, size: 50))
//                     : ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.file(File(_selectedImage!.path), fit: BoxFit.cover),
//                       ),
//               ),
//             ),

//             const SizedBox(height: 20),
//             CheckboxListTile(
//               title: const Text("I have insurance for my car"),
//               value: _hasInsurance,
//               onChanged: (value) => setState(() => _hasInsurance = value ?? false),
//             ),

//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _isUploading ? null : _submitVehicleDetails, // Disable while submitting
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: _isUploading ? Colors.grey : Colors.blue,
//                 minimumSize: const Size(double.infinity, 50),
//               ),
//               child: _isUploading
//                   ? const CircularProgressIndicator(color: Colors.white) // Show loading spinner
//                   : const Text('Next', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
