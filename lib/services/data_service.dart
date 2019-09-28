import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:gov/models/bill.dart';

class DataService {

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
        "131", "", "", "", ""),
    Bill("5","Commercial", "Electricity", "Mario", "125", "18148", "18525", "900",
        "", "", "", "")
  ];

  List<Bill> get bills => _bills;

  setBill( Bill bill) {
    print(bill.payment);
    List<Bill> newBills = [];
    for(var b in _bills)
      {
        if(b.id == bill.id){
          continue;
        }
        newBills.add(b);
      }
    _bills = newBills;

  }

  Future<List<Bill>> getData() async {
//  bool connected = await DataConnectionChecker().hasConnection;
//  List<Bill> bills = [];
//
//  if(!connected)
//  throw Exception('No connection');
//
//  final response = ();
//  if (response.statusCode == 200) {
//       bills = (json.decode(response.body) as List)
//        .map((data) => new Bill.fromJson(data))
//        .toList();
//  } else {
//      throw Exception('Failed to load');
//}

    return _bills.where((bill) {
      return bill.payment.toString().isEmpty;
    }).toList();
  }
}
