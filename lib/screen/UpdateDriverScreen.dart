import 'package:deliveryboy/utils/Colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/driver_controller.dart';

class UpdateDriverScreen extends StatefulWidget {
  @override
  _UpdateDriverScreenState createState() => _UpdateDriverScreenState();
}

class _UpdateDriverScreenState extends State<UpdateDriverScreen> {
  final DriverController controller = Get.put(DriverController());
  final _formKey = GlobalKey<FormState>();
  final _storage = GetStorage();

  String driverId = '';

  // Essential fields only
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _prefillFieldsFromStorage());
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _prefillFieldsFromStorage() {
    final driverData = _storage.read("StoreLogin");
    print("📦 StoreLogin data: $driverData");

    if (driverData != null) {
      driverId = driverData["id"]?.toString() ?? "";

      // Handle name - could be "name" (full name) or "first_name"/"last_name"
      String fullName = driverData["name"]?.toString() ?? '';
      if (fullName.isNotEmpty) {
        List<String> nameParts = fullName.split(' ');
        _firstNameController.text = nameParts.first;
        _lastNameController.text =
            nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
      } else {
        _firstNameController.text = driverData["first_name"]?.toString() ?? '';
        _lastNameController.text = driverData["last_name"]?.toString() ?? '';
      }

      // Handle email - could be "email" or "driver_email"
      _emailController.text = driverData["email"]?.toString() ??
          driverData["driver_email"]?.toString() ??
          '';

      // Handle phone - could be "phone" or "mobile"
      _phoneController.text = driverData["phone"]?.toString() ??
          driverData["mobile"]?.toString() ??
          '';

      _addressController.text = driverData["address"]?.toString() ?? '';

      print("✅ Prefilled driver ID: $driverId");
      print(
          "✅ Prefilled name: ${_firstNameController.text} ${_lastNameController.text}");
      print("✅ Prefilled email: ${_emailController.text}");
      print("✅ Prefilled phone: ${_phoneController.text}");
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isRequired = true,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ? _obscurePassword : false,
        validator: validator ??
            (isRequired
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return '$label is required';
                    }
                    return null;
                  }
                : null),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: primeryColor),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: primeryColor, width: 2),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: WhiteColor, onPressed: () => Get.back()),
        title: Text('Update Profile'),
        centerTitle: true,
        foregroundColor: WhiteColor,
        backgroundColor: primeryColor,
        elevation: 0,
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator(color: primeryColor))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Avatar
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: primeryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: primeryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Section Header
                      Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      SizedBox(height: 16),

                      // First Name
                      _buildTextField(
                        controller: _firstNameController,
                        label: 'First Name',
                        icon: Icons.person_outline,
                      ),

                      // Last Name
                      _buildTextField(
                        controller: _lastNameController,
                        label: 'Last Name',
                        icon: Icons.person_outline,
                      ),

                      // Email
                      _buildTextField(
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),

                      // Phone
                      _buildTextField(
                        controller: _phoneController,
                        label: 'Phone Number',
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                      ),

                      // Address
                      _buildTextField(
                        controller: _addressController,
                        label: 'Address',
                        icon: Icons.location_on_outlined,
                        isRequired: false,
                      ),

                      SizedBox(height: 20),

                      // Password Section Header
                      Text(
                        'Change Password (Optional)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Password
                      _buildTextField(
                        controller: _passwordController,
                        label: 'New Password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                        isRequired: false,
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 30),

                      // Update Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primeryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final formData = {
                                'id': driverId,
                                'first_name': _firstNameController.text.trim(),
                                'last_name': _lastNameController.text.trim(),
                                'driver_email': _emailController.text.trim(),
                                'mobile': _phoneController.text.trim(),
                                'address': _addressController.text.trim(),
                              };

                              // Only include password if it's not empty
                              if (_passwordController.text.isNotEmpty) {
                                formData['driver_password'] =
                                    _passwordController.text;
                              }

                              await controller.updateDriver(formData: formData);
                            }
                          },
                          child: Text(
                            "Update Profile",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )),
    );
  }
}
