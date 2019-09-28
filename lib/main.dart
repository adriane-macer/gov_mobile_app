import 'package:flutter/material.dart';
import 'package:gov/constants/constants.dart';
import 'package:gov/pages/home_page.dart';
import 'package:gov/services/service_locator.dart';

import 'helpers/router.dart';

void main() => runApp(GovApp());

class GovApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setupLocator();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SORA Gov',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

