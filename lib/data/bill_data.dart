import 'package:gov/models/bill.dart';

class BillData{
  List<Bill> _bills = [
    Bill("0","Commercial", "Electricity", "John Doe", "125", "17546", "17546",
        "0", "", "", "", ""),
    Bill("1","Commercial", "Water", "Jane Doe", "125", "885", "1035", "150", "",
        "", "", ""),
    Bill("2","Commercial", "Water", "James Dean", "125", "17091", "17653", "562",
        "", "", "", ""),
    Bill("3","Commercial", "Electricity", "Maria Clara", "125", "2160", "2520",
        "360", "", "", "", ""),
    Bill("4","Commercial", "Electricity", "Joshua", "125", "11657", "11788",
        "131", "", "", "", "asda"),
    Bill("4","Commercial", "Electricity", "Mario", "125", "18148", "18525", "900",
        "", "", "", "asda")
  ];

  List<Bill> get bills => _bills;

  setBills(List<Bill> value) {
    _bills = value;
  }


}