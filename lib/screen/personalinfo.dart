import 'package:deliveryboy/controller/registeration_controller.dart';  
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'bank_info.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final DriverController driverController = Get.find<DriverController>();

  XFile? _selfieImage;
  XFile? _drivingLicenseImage;
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> _pickImage(BuildContext context) async {
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

  void navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BankInfoScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Personal Info", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Personal Info',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      final image = await _pickImage(context);
                      if (image != null) {
                        setState(() {
                          _selfieImage = image;
                          driverController.setDriverSelfie(File(image.path));
                        });
                      }
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: _selfieImage != null ? FileImage(File(_selfieImage!.path)) : null,
                          child: _selfieImage == null
                              ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                              : null,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final image = await _pickImage(context);
                            if (image != null) {
                              setState(() {
                                _selfieImage = image;
                                driverController.setDriverSelfie(File(image.path));
                              });
                            }
                          },
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Add Selfie'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            minimumSize: const Size(double.infinity, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final image = await _pickImage(context);
                      if (image != null) {
                        setState(() {
                          _drivingLicenseImage = image;
                          driverController.setDrivingLicense(File(image.path));
                        });
                      }
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload Driving License'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: navigateToNextScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
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
// import 'dart:io';
// import 'package:deliveryboy/controller/registeration_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import 'bank_info.dart';

// class PersonalInfoScreen extends StatefulWidget {
//   const PersonalInfoScreen({super.key});

//   @override
//   _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
// }

// class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
//   final DriverController driverController = Get.find<DriverController>();
//   final ImagePicker _picker = ImagePicker();

//   bool _isUploadingSelfie = false;
//   bool _isUploadingLicense = false;

//   /// ✅ Upload Image & Store URL Instead of Local Path
//   Future<void> _uploadImage(XFile image, String imageType) async {
//     setState(() {
//       if (imageType == 'selfie') {
//         _isUploadingSelfie = true;
//       } else {
//         _isUploadingLicense = true;
//       }
//     });

//     try {
//       String imageUrl = await driverController.uploadImage(File(image.path), imageType);
//       if (imageUrl.isNotEmpty) {
//         if (imageType == 'selfie') {
//           driverController.setDriverSelfieUrl(imageUrl);
//         } else if (imageType == 'drivingLicense') {
//           driverController.setDrivingLicenseUrl(imageUrl);
//         }
//         setState(() {}); // Refresh UI
//       } else {
//         Get.snackbar("Upload Failed", "Image upload failed. Please try again.",
//             backgroundColor: Colors.red, colorText: Colors.white);
//       }
//     } catch (e) {
//       Get.snackbar("Upload Error", "Failed to upload $imageType: $e",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     } finally {
//       setState(() {
//         if (imageType == 'selfie') {
//           _isUploadingSelfie = false;
//         } else {
//           _isUploadingLicense = false;
//         }
//       });
//     }
//   }

//   /// ✅ Image Picker and Upload Function
//   Future<void> _pickAndUploadImage(BuildContext context, String imageType) async {
//     final XFile? image = await showDialog<XFile?>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Choose Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('Camera'),
//                 onTap: () async {
//                   final pickedImage = await _picker.pickImage(source: ImageSource.camera);
//                   Navigator.of(context).pop(pickedImage);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Gallery'),
//                 onTap: () async {
//                   final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
//                   Navigator.of(context).pop(pickedImage);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     if (image != null) {
//       await _uploadImage(image, imageType);
//     }
//   }

//   /// ✅ Prevent Navigation Until Both Images Are Uploaded
//   void navigateToNextScreen() {
//     if (driverController.driverSelfieUrl == null || driverController.driverSelfieUrl!.isEmpty ||
//         driverController.drivingLicenseUrl == null || driverController.drivingLicenseUrl!.isEmpty) {
//       Get.snackbar("Error", "Please upload both images before proceeding.",
//           backgroundColor: Colors.red, colorText: Colors.white);
//       return;
//     }

//     // ✅ Store URLs in Registration Data
//     driverController.updateRegistrationData({
//       "selfie_url": driverController.driverSelfieUrl!,
//       "driving_license_url": driverController.drivingLicenseUrl!,
//     });

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const BankInfoScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Personal Info")),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               /// ✅ Selfie Upload Section
//               const Text("Upload Your Selfie", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _isUploadingSelfie ? null : () => _pickAndUploadImage(context, 'selfie'),
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundColor: Colors.grey[300],
//                   backgroundImage: driverController.driverSelfieUrl != null
//                       ? NetworkImage(driverController.driverSelfieUrl!) // ✅ Load URL
//                       : null,
//                   child: _isUploadingSelfie
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : (driverController.driverSelfieUrl == null
//                           ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
//                           : null),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// ✅ Driving License Upload Section
//               const Text("Upload Your Driving License", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _isUploadingLicense ? null : () => _pickAndUploadImage(context, 'drivingLicense'),
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundColor: Colors.grey[300],
//                   backgroundImage: driverController.drivingLicenseUrl != null
//                       ? NetworkImage(driverController.drivingLicenseUrl!) // ✅ Load URL
//                       : null,
//                   child: _isUploadingLicense
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : (driverController.drivingLicenseUrl == null
//                           ? const Icon(Icons.upload_file, size: 40, color: Colors.grey)
//                           : null),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// ✅ Next Button
//               ElevatedButton(
//                 onPressed: navigateToNextScreen,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: const Text('Next', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
