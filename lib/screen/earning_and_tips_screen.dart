// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../model/earning_controller.dart';
//
// class EarningAndTripsScreen extends StatelessWidget {
//   final EarningController ctrl = Get.put(EarningController());
//
//   // In a real app, pass these from login or navigation
//   // final int _driverId;
//   // final String _securityToken;
//   //
//   // EarningAndTripsScreen({
//   //   required int driverId,
//   //   required String securityToken,
//   // }) : _driverId = driverId, _securityToken = securityToken;
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   ctrl.fetchEarnings(_driverId, _securityToken);
//   final int driverId;
//   final String securityToken;
//
//   EarningAndTripsScreen({
//     required this.driverId,
//     required this.securityToken,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     ctrl.fetchEarnings(driverId, securityToken);
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Earning and Trips")),
//       body: Obx(() {
//         if (ctrl.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (ctrl.error.isNotEmpty) {
//           return Center(child: Text("❌ ${ctrl.error.value}"));
//         }
//         final e = ctrl.earningData.value;
//         if (e == null) return Center(child: Text("No data available"));
//
//         return SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Center(child: Text("Week ${e.orderTime}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
//             Center(child: Text("\$${e.totalEarnings}", style: TextStyle(fontSize: 16))),
//             SizedBox(height: 10),
//             Text("Today Earning \$${e.totalEarnings}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             Divider(),
//             tripItem(time: e.orderTime, weight: e.weights, amount: "\$${e.totalEarnings}"),
//           ]),
//         );
//       }),
//     );
//   }
//
//   Widget tripItem({required String time, required String weight, required String amount}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
//               Text(weight),
//               Text(amount),
//             ],
//           ),
//           Row(children: List.generate(3, (_) => Icon(Icons.lock, color: Colors.blue))),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../model/earning_controller.dart';
//
// class EarningAndTripsScreen extends StatelessWidget {
//   final EarningController ctrl = Get.put(EarningController());
//
//   final int? driverId;
//   final String? securityToken;
//
//   EarningAndTripsScreen({
//     this.driverId,
//     this.securityToken,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     final int finalDriverId = driverId ?? box.read('driverId');
//     final String finalToken = securityToken ?? box.read('securityToken');
//
//     ctrl.fetchEarnings(finalDriverId, finalToken);
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Earning and Trips")),
//       body: Obx(() {
//         if (ctrl.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (ctrl.error.isNotEmpty) {
//           return Center(child: Text("❌ ${ctrl.error.value}"));
//         }
//         final e = ctrl.earningData.value;
//         if (e == null) return Center(child: Text("No data available"));
//
//         return SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(child: Text("Week ${e.orderTime}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
//               Center(child: Text("\$${e.totalEarnings}", style: TextStyle(fontSize: 16))),
//               SizedBox(height: 10),
//               Text("Today Earning \$${e.totalEarnings}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               Divider(),
//               tripItem(time: e.orderTime, weight: e.weights, amount: "\$${e.totalEarnings}"),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget tripItem({required String time, required String weight, required String amount}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
//               Text(weight),
//               Text(amount),
//             ],
//           ),
//           Row(children: List.generate(3, (_) => Icon(Icons.lock, color: Colors.blue))),
//         ],
//       ),
//     );
//   }
// }
//...
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../model/earning_controller.dart';
//
// class EarningAndTripsScreen extends StatelessWidget {
//   final int? driverId;
//   final String? securityToken;
//
//   final EarningController ctrl = Get.put(EarningController());
//
//   EarningAndTripsScreen({
//     this.driverId,
//     this.securityToken,
//   }) {
//     final box = GetStorage();
//     final int finalDriverId = driverId ?? box.read('driverId');
//     final String finalToken = securityToken ?? box.read('securityToken');
//     if (ctrl.earningData.value == null && !ctrl.isLoading.value) {
//       ctrl.fetchEarnings(finalDriverId, finalToken);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Earning & Trips"),
//         centerTitle: true,
//         backgroundColor: Colors.blue.shade700,
//       ),
//       body: Obx(() {
//         if (ctrl.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (ctrl.error.isNotEmpty) {
//           return Center(child: Text("❌ ${ctrl.error.value}"));
//         }
//
//         final e = ctrl.earningData.value;
//         if (e == null) return Center(child: Text("No data available"));
//
//         return SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildEarningsCard(e),
//               SizedBox(height: 20),
//               Text("Trip Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               _buildTripItem(e.orderTime, e.weights, "\$${e.totalEarnings}"),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _buildEarningsCard(e) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       color: Colors.blue.shade50,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Text("This Week", style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
//             SizedBox(height: 6),
//             Text("\$${e.totalEarnings}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue[800])),
//             SizedBox(height: 10),
//             Divider(),
//             SizedBox(height: 10),
//             Text("Today's Earnings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             Text("\$${e.totalEarnings}", style: TextStyle(fontSize: 18, color: Colors.green[700])),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTripItem(String time, String weight, String amount) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text("Time: $time", style: TextStyle(fontWeight: FontWeight.w600)),
//               SizedBox(height: 4),
//               Text("Weight: $weight"),
//               Text("Amount: $amount", style: TextStyle(color: Colors.green[700])),
//             ]),
//             Icon(Icons.check_circle, color: Colors.blue, size: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/earning_controller.dart';

class EarningAndTripsScreen extends StatelessWidget {
  final int? driverId;
  final String? securityToken;

  final EarningController ctrl = Get.put(EarningController());

  EarningAndTripsScreen({
    this.driverId,
    this.securityToken,
    Key? key,
  }) : super(key: key) {
    final box = GetStorage();
    final int finalDriverId = driverId ?? box.read('driverId');
    final String finalToken = securityToken ?? box.read('securityToken');
    if (ctrl.earningData.value == null && !ctrl.isLoading.value) {
      ctrl.fetchEarnings(finalDriverId, finalToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Earning & Trips",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Obx(() {
        if (ctrl.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (ctrl.error.isNotEmpty) {
          return Center(child: Text("❌ ${ctrl.error.value}"));
        }

        final e = ctrl.earningData.value;
        if (e == null) return const Center(child: Text("No data available"));

        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "This Week",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "\$${e.totalEarnings}",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      const Text("Today's Earnings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                        "\$${e.totalEarnings}",
                        style: TextStyle(fontSize: 18, color: Colors.green[700]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Trip Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildTripItem(e.orderTime, e.weights, "\$${e.totalEarnings}"),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTripItem(String time, String weight, String amount) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Time: $time", style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text("Weight: $weight"),
                Text("Amount: $amount", style: TextStyle(color: Colors.green[700])),
              ],
            ),
            const Icon(Icons.check_circle, color: Colors.blue, size: 24),
          ],
        ),
      ),
    );
  }
}
