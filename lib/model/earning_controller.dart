import 'package:deliveryboy/Api/api_service.dart';
import 'package:get/get.dart';
import 'earning_model.dart';


class EarningController extends GetxController {
  final token = ''.obs;
  final driverId = 0.obs;
  final earningData = Rxn<EarningData>();
  final isLoading = false.obs;
  final error = ''.obs;

  final ApiService _api = ApiService();

  Future<void> fetchEarnings(int id, String secToken) async {
    driverId.value = id;
    token.value = secToken;
    isLoading.value = true;
    error.value = '';

    try {
      final map = await _api.getDriverEarnings(id, secToken);
      earningData.value = EarningData.fromJson(map);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
