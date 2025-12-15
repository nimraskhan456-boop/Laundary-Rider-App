
// import 'package:deliveryboy/Api/api_service.dart';
// import 'package:get/get.dart';


// class CompleteOrderController extends GetxController {
//   final ApiService _apiService = ApiService();
//   var isLoading = false.obs;

//   Future<void> completeOrder({required String orderID, required String image, required String token}) async {
//     try {
//       isLoading.value = true;
//       var response = await _apiService.completeOrder(orderID: orderID, image: image, token: token);

//       if (response.statusCode == 200) {
//         print("✅ Order Marked as Delivered Successfully!");
//       } else {
//         print("❌ API Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("❌ Complete Order Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
