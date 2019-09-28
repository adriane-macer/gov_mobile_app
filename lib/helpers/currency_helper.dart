

import 'package:intl/intl.dart';

class CurrencyHelper {
  static String formattedAmount(double amount) {
    try {
      final formatCurrency =
      NumberFormat.currency(symbol: "Php", decimalDigits: 0);
      return "${formatCurrency.format(amount)}";
    } catch (e) {
      print(e.toString());
      return "\u20b1 $amount";
    }
  }
}