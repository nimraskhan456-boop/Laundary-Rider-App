import 'dart:async';

import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/controller/login_controller.dart';
import 'package:deliveryboy/screen/become.dart';
import 'package:deliveryboy/screen/bottombar_screen.dart';
import 'package:deliveryboy/screen/registeration_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ✅ Defining Colors
const Color primaryColor = Color(0xFF0057FF); // Bright Blue Header
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Colors.grey;
const Color darkBlue = Color(0xFF003366);

// ✅ Defining Font Styles
const String fontFamily = 'Arial';

class DriverLoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (context) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: whiteColor,
          child: Column(
            children: [
              // ✅ Header Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: primeryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: whiteColor,
                      ),
                      child: Image.asset(
                        'assets/appLogo.png', // ✅ Replace with your logo path
                        height: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Sign in to start",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // ✅ Email Input
                        TextField(
                          controller: _loginController.emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: whiteColor,
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: greyColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // ✅ Password Input
                        // GetBuilder<LoginController>(builder: (context) {
                        //   return
                        TextField(
                          controller: _loginController.passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            fillColor: whiteColor,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: () {
                                _loginController.showOfPassword();
                              },
                              child: !_loginController.showPassword
                                  ? Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/showpassowrd.png",
                                        height: 25,
                                        width: 25,
                                        color: greytext,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/HidePassword.png",
                                        height: 25,
                                        width: 25,
                                        color: greytext,
                                      ),
                                    ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: greyColor),
                            ),
                          ),
                          obscureText: _loginController.showPassword,
                        ),
                        // }),

                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   children: [
                            //     Checkbox(value: false, onChanged: (value) {}),
                            //     Text("Remember me"),
                            //   ],
                            // ),
                            Expanded(
                              child:
                                  //   GetBuilder<LoginController>(builder: (context) {
                                  // return
                                  Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: BlackColor),
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      value: _loginController.isChecked,
                                      activeColor: BlackColor,
                                      onChanged: (value) async {
                                        _loginController
                                            .changeRememberMe(value);

                                        save('Remember', true);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Remember me".tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Gilroy Medium",
                                      color: BlackColor,
                                    ),
                                  ),
                                ],
                              ),
                              // }),
                            ),
                            Text("Forgot Password?",
                                style: TextStyle(color: primeryColor)),
                          ],
                        ),
                        SizedBox(height: 20),

                        // ✅ Login Button
                        Obx(() => ElevatedButton(
                              onPressed: _loginController.isLoading.value
                                  ? null
                                  : _loginController.handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primeryColor,
                                minimumSize: Size(
                                  double.infinity,
                                  50,
                                ),
                                maximumSize: Size(
                                  double.infinity,
                                  50,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: _loginController.isLoading.value
                                  ? CircularProgressIndicator(color: whiteColor)
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                        fontFamily: fontFamily,
                                        color: whiteColor,
                                        fontSize: 20,
                                      ),
                                    ),
                            )),
                        SizedBox(height: 20),

                        // ✅ Sign Up Button (Become a Driver)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? "),
                            TextButton(
                              onPressed: () {
                                Get.to(() => BecomeDriverForm());
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primeryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
