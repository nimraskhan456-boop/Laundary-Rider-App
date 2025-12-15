import 'package:deliveryboy/helpar/currency_helper.dart';
import 'package:get/get.dart';


class CurrencyController extends GetxController {
  var currency = "₹".obs; // Default currency (observable)

  /// Load currency from storage
  Future<void> loadCurrency() async {
    await CurrencyHelper.loadCurrency();
    currency.value = CurrencyHelper.currency;
  }

  /// Update currency dynamically
  Future<void> updateCurrency(String newCurrency) async {
    await CurrencyHelper.setCurrency(newCurrency);
    currency.value = newCurrency;
  }
}
