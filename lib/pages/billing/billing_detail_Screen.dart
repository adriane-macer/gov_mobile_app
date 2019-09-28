import 'package:flutter/material.dart';
import 'package:gov/models/bill.dart';
import 'package:provider/provider.dart';

class BillingDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bill = Provider.of<Bill>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${bill.name}'s bill"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0,),
            Text(
              "Category: ${bill.category}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Kind: ${bill.kind}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Previous reading: ${bill.previousReading}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Present reading: ${bill.presentReading}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Consumption: ${bill.consumption}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Contract: ${bill.contract}",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
