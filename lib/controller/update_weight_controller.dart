// import 'package:deliveryboy/api/api_service.dart';
// import 'package:get/get.dart';
// import '../model/update_weight_response.dart';
//
//
// class UpdateWeightController extends GetxController {
//   final ApiService _apiService = ApiService(); // Use the API service
//   final Rx<UpdateWeightResponse?> response = Rx<UpdateWeightResponse?>(null);
//   final RxBool isLoading = false.obs;
//
//   Future<void> updateOrder({
//     required int driverAssignedId,
//     required int orderId,
//     required double weight,
//     required double orderPrice,
//     required String token,
//   }) async {
//     isLoading.value = true;
//
//     final result = await _apiService.updateOrderWeight
//       (
//       // driverAssignedId: driverAssignedId,
//       // orderId: orderId,
//       // weight: weight,
//       // orderPrice: orderPrice,
//       // token: token,
//       driverAssignedId: driverAssignedId,
//       orderId: orderId,
//       weight: weight,
//       orderPrice: orderPrice,
//       token: token,
//     );
//
//     response.value = result;
//     isLoading.value = false;
//   }
// }
// import 'package:deliveryboy/api/api_service.dart';
import 'package:deliveryboy/Api/api_service.dart';
import 'package:get/get.dart';
import '../model/update_weight_response.dart';

class UpdateWeightController extends GetxController {
  final ApiService _apiService = ApiService();

  final Rx<UpdateWeightResponse?> response = Rx<UpdateWeightResponse?>(null);
  final RxBool isLoading = false.obs;

  Future<void> updateOrder({
    required int driverAssignedId,
    required int orderId,
    required double weight,
    required String orderPrice,
    required String token,
  }) async {
    isLoading.value = true;

    try {
      final result = await _apiService.updateOrderWeight(
        driverAssignedId: driverAssignedId,
        orderId: orderId,
        weight: weight,
        orderPrice: orderPrice,
        token: token,
      );
      response.value = result;
    } catch (e) {
      print('❌ Error in updateOrder: $e');
      response.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}
