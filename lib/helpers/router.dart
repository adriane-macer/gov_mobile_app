import 'package:flutter/material.dart';
import 'package:gov/constants/constants.dart';
import 'package:gov/pages/announcement.dart';
import 'package:gov/pages/billing/billing_page.dart';
import 'package:gov/pages/bus_page.dart';
import 'package:gov/pages/permit_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PermitRoute:
        return MaterialPageRoute(
          builder: (_) => PermitPage(),
        );
      case BusRoute:
        return MaterialPageRoute(
          builder: (_) => BusPage(),
        );
      case AnnouncementRoute:
        return MaterialPageRoute(
          builder: (_) => AnnouncementPage(),
        );
      default: // BillingRoute:
        return MaterialPageRoute(builder: (_) => BillingPage());
    }
  }
}
