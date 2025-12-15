import 'package:shared_preferences/shared_preferences.dart';

class CurrencyHelper {
  static String currency = "₹"; // Default currency

  /// Save currency to SharedPreferences
  static Future<void> setCurrency(String newCurrency) async {
    currency = newCurrency;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("currency", newCurrency);
  }

  /// Load currency from SharedPreferences
  static Future<void> loadCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currency = prefs.getString("currency") ?? "₹";
  }
}
