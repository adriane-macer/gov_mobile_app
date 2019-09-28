import 'package:flutter/material.dart';

class PermitPage extends StatefulWidget {
  @override
  _PermitPageState createState() => _PermitPageState();
}

class _PermitPageState extends State<PermitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permit page"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Barangay clearance",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



}
