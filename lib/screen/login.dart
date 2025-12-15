// import 'package:deliveryboy/screen/become.dart';
// import 'package:flutter/material.dart';
// import 'login_screen2.dart';
// import 'become3.dart';
// import '../utils/colors.dart';

// class DriverLoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               primeryColor,
//               WhiteColor,
//             ],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundColor: WhiteColor,
//                   child: Text(
//                     'S',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color: blueColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Icon(Icons.circle, color: blueColor, size: 8),
//                 SizedBox(height: 40),
//                 // Login Button
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => LoginScreen()),
//                     // );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: blueColor,
//                     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       color: WhiteColor,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Become Driver Button
//                 OutlinedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           // builder: (context) => BecomeDriverScreen())
//                            builder: (context) => BecomeDriverForm()),
//                     );
//                   },
//                   style: OutlinedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     // backgroundColor: blueColor,
//                     side: BorderSide(color: blueColor),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'Become Driver',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: WhiteColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
