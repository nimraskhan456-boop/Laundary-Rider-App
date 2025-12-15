// ignore_for_file: unused_field, library_private_types_in_public_api, camel_case_types, unused_import, prefer_const_constructors, file_names

import 'dart:developer';
import 'dart:io';

import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/screen/UpdateDriverScreen.dart';
import 'package:deliveryboy/screen/dashboard_screen.dart';
import 'package:deliveryboy/screen/assigned_orders_screen.dart';
import 'package:deliveryboy/screen/subscription_order.dart';
import 'package:deliveryboy/screen/profile_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';

int selectedIndex = 0;

class BottoBarScreen extends StatefulWidget {
  const BottoBarScreen({super.key});

  @override
  _BottoBarScreenState createState() => _BottoBarScreenState();
}

class _BottoBarScreenState extends State<BottoBarScreen>
    with TickerProviderStateMixin {
  late int _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List<Widget> myChilders = [
    DashBoardScreen(),
    // MyOrderScreen(isBack: "2"),
    // MyOrderScreen(),
    AssignedOrdersScreen(),
    // MyPriscriptionOrder(isBack: "2"),
    ProfileScreen(),
    // UpdateDriverScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:
          false, // Prevents the back button from automatically closing the app
      onPopInvoked: (didPop) async {
        if (!didPop) {
          exit(0); // Closes the app when back is pressed
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: greyColor,
          backgroundColor: Colors.grey[300],
          elevation: 0,
          selectedLabelStyle: const TextStyle(
              fontFamily: FontFamily.gilroyBold,
              // fontWeight: FontWeight.bold,
              fontSize: 12),
          fixedColor: gradient.defoultColor,
          unselectedLabelStyle: const TextStyle(
            fontFamily: FontFamily.gilroyMedium,
          ),
          currentIndex: selectedIndex,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/dashboard.png",
                  color: selectedIndex == 0 ? gradient.defoultColor : greycolor,
                  height: MediaQuery.of(context).size.height / 40),
              label: 'Dashboard',
            ),

            BottomNavigationBarItem(
              icon: Image.asset("assets/myorder.png",
                  color: selectedIndex == 1 ? gradient.defoultColor : greycolor,
                  height: MediaQuery.of(context).size.height / 37),
              label: 'My Order',
            ),

            // BottomNavigationBarItem(
            //   icon: Image.asset("assets/Prescription.png",
            //       color: selectedIndex == 2 ? gradient.defoultColor : greycolor,
            //       height: MediaQuery.of(context).size.height / 35),
            //   label: 'Subscription',
            // ),

            BottomNavigationBarItem(
              icon: Image.asset("assets/Profile.png",
                  color: selectedIndex == 2 ? gradient.defoultColor : greycolor,
                  height: MediaQuery.of(context).size.height / 35),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {});
            selectedIndex = index;
          },
        ),
        body: myChilders[selectedIndex],
      ),
    );
  }
}
