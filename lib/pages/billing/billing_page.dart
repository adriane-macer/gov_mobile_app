import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gov/blocs/billing_bloc/billing_bloc.dart';
import 'package:gov/blocs/billing_bloc/billing_state.dart';
import 'package:gov/models/bill.dart';
import 'package:gov/pages/billing/billing_screen.dart';
import 'package:provider/provider.dart';

class BillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        if (state is BillingLoading || state is BillingUninitialized)
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        if (state is BillingLoaded) {
          return BillingScreen();
        }
        if (state is Error) {
          return Scaffold(body: Center(child: Text("Something went wrong")));
        }
        if (state is NoBillingLoaded) {
          return Scaffold(body: Center(child: Text("No bills")));
        }
        return Container();
      },
    );
  }
}
