// import 'package:flutter/material.dart';
//
//
// class CompletedScreen extends StatelessWidget {
//   const CompletedScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Placeholder data that will eventually be replaced by API data
//     final double earned = 17.0; // Placeholder for earned amount
//     final double tip = 5.0; // Placeholder for tip amount
//     final double total = earned + tip; // Calculated total amount
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFE5F0FA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFE5F0FA),
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
//       ),
//       body: Center(
//         child: Container(
//           width: 300,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Completed',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
              // Completed Icon
//               Icon(
//                 Icons.check_circle,
//                 size: 80,
//                 color: Colors.green,
//               ),
//               const SizedBox(height: 16),
//               // Earnings and Total Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Earned:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '\$${earned.toStringAsFixed(2)}',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Tip:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '\$${tip.toStringAsFixed(2)}',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Total:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '\$${total.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
