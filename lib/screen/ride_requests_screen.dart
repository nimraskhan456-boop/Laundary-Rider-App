// import 'package:flutter/material.dart';

// class RideRequestsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("\$100/8"), // Placeholder for balance and trips
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 3, // Placeholder for the number of ride requests
//               itemBuilder: (context, index) {
//                 return RideRequestCard();
//               },
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(10),
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Offline button action
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//               ),
//               child: Text('Go offline'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RideRequestCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'PICKUP',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('Landrumat 85 Webster Ave'),
//                     SizedBox(height: 5),
//                     Text(
//                       'DROP',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text('79 Webster Ave'),
//                     SizedBox(height: 5),
//                     Text('2 bags    12 ml'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       color: Colors.yellow,
//                       child: Text('NOW', style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       '\$12',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Accept button action
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                   ),
//                   child: Text('Accept'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // Hide button action
//                   },
//                   child: Text(
//                     'Hide',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // void main() => runApp(MaterialApp(home: RideRequestsScreen()));
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Orders',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Tab bar for "Current Order" and "Past Orders"
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: _selectedTab == 0 ? Colors.white : Colors.grey[200],
                    alignment: Alignment.center,
                    child: Text(
                      'Current Order',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _selectedTab == 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: _selectedTab == 1 ? Colors.white : Colors.grey[200],
                    alignment: Alignment.center,
                    child: Text(
                      'Past Orders',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _selectedTab == 1 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Placeholder for orders
              itemBuilder: (context, index) {
                return OrderCard(
                  orderId: index == 0 ? '#59' : '#55',
                  date: '2023-11-06',
                  status: index == 0 ? 'Processing' : 'On Route',
                  price: index == 0 ? '\$613.05' : '\$950.00',
                  statusColor: index == 0 ? Colors.blue : Colors.green,
                  statusIcon: index == 0
                      ? Icons.autorenew // Matching Processing Icon
                      : Icons.emoji_transportation, // Matching On Route Icon
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String status;
  final String price;
  final Color statusColor;
  final IconData statusIcon;

  const OrderCard({super.key, 
    required this.orderId,
    required this.date,
    required this.status,
    required this.price,
    required this.statusColor,
    required this.statusIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order ID: $orderId',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        statusIcon,
                        color: statusColor,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        status,
                        style: TextStyle(color: statusColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'J',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Juhu Tara Rd, Uditi Tower',
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  price,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Cancel button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded button
                      ),
                    ),
                    child: Text('Cancel'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Info button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded button
                      ),
                    ),
                    child: Text('Info'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

