import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov/blocs/billing_bloc/billing_bloc.dart';
import 'package:gov/blocs/billing_bloc/billing_event.dart';
import 'package:gov/pages/announcement.dart';
import 'package:gov/pages/billing/billing_page.dart';
import 'package:gov/pages/bus_page.dart';
import 'package:gov/pages/permit_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;

  _onTabSelected(int index) {
    setState(
      () {
        _selectedItem = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentTab(_selectedItem),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.monetization_on,
              ),
              title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), title: Text("")),
        ],
        currentIndex: _selectedItem,
        onTap: _onTabSelected,
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.blue[200],
      ),
    );
  }

  _currentTab(int selectedItem) {
    switch (selectedItem) {
      case 1:
        return PermitPage();
      case 2:
        return BusPage();
      case 3:
        return AnnouncementPage();
      default:
        return BlocProvider(
            builder: (context) => BillingBloc()..dispatch(FetchBilling()),
            child: BillingPage());
    }
  }
}
