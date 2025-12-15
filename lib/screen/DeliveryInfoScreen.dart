// import 'package:deliveryboy/screen/LaundryPickupDetailsScreen.dart';
// import 'package:flutter/material.dart';

// class LaundryPickupScreen extends StatelessWidget {
//   const LaundryPickupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'ALI. B',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         // actions: [
//           IconButton(
//             icon: const Icon(Icons.chat, color: Colors.black),
//             onPressed: () {
//               // Chat functionality placeholder
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.phone, color: Colors.black),
//             onPressed: () {
//               // Call functionality placeholder
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on, color: Colors.blue),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 'Pickup',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'Super Laundromat',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               Text(
//                                 '46 Webster Ave',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Text(
//                           '\$17',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(height: 20, thickness: 1),
//                     Row(
//                       children: [
//                         const Icon(Icons.home, color: Colors.blue),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 'Drop',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 '345 Hull Ave',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               Text(
//                                 'Apt 4C, Elevator',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Icon(
//                           Icons.check_circle,
//                           color: Colors.green,
//                         ),
//                       ],
//                     ),
//                     const Divider(height: 20, thickness: 1),
//                     Row(
//                       children: [
//                         const Icon(Icons.note, color: Colors.blue),
//                         const SizedBox(width: 8),
//                         const Expanded(
//                           child: Text(
//                             'Leave the bags at the door',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   backgroundColor: Colors.blue,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => LaundryPickupDetailsScreen(), // Replace `NextScreen` with the name of your next screen widget
//     ),
//   );
//                   // Navigation to the next step functionality placeholder
//                 },
//                 child: const Text(
//                   'Head to Laundry',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


