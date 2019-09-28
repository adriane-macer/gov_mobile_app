import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gov/blocs/billing_bloc/billing_bloc.dart';
import 'package:gov/blocs/billing_bloc/billing_event.dart';
import 'package:gov/models/bill.dart';
import 'package:gov/services/data_service.dart';
import 'package:gov/services/service_locator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BillingScreen extends StatefulWidget {
  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    BillingBloc bloc = BlocProvider.of<BillingBloc>(context);
    final List<Bill> bills = bloc.bills;
    return Scaffold(
      appBar: AppBar(
        title: Text("Billing page"),
      ),
      body: ListView.builder(
        itemCount: bills.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Kind: ${bills[index].kind}",
                        style: TextStyle(fontSize: 24.0),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Category: ${bills[index].category}",
                        style: TextStyle(fontSize: 24.0),
                        textAlign: TextAlign.left,
                      ),
                      Text("Previous Reading: ${bills[index].presentReading}",
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.left),
                      Text("Present reading: ${bills[index].presentReading}",
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.left),
                      Text("Consumption: ${bills[index].consumption}",
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.left),
                      InkWell(
                        onTap: () async {
                          final bool forPayment =
                              await _proceedPaymentConfirmation(context);
                          if (!forPayment) return;

                          await _thankYouDialog(context);
                          Bill b = bills[index];
                          Bill newBill = Bill(
                            b.id,
                            b.category,
                            b.kind,
                            b.rate,
                            b.name,
                            b.previousReading,
                            b.presentReading,
                            b.consumption,
                            b.start,
                            b.end,
                            b.contract,
                            "paid",
                          );

                          await locator<DataService>().setBill(newBill);

                          bloc.dispatch(FetchBilling());
                          return;
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.payment,
                              color: Colors.red,
                              size: 40.0,
                            ),
                          ),
                          title: Text("Pay now",
                              style: TextStyle(fontSize: 20.0),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> _proceedPaymentConfirmation(BuildContext context) async {
    final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: FormBuilder(
          key: _fbKey,
          child: Container(
            height: 400.0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Account information"),
                  ),
                  FormBuilderTextField(
                    attribute: "First name",
                    decoration: InputDecoration(labelText: "First name"),
//                onChanged: (_){},
                    validators: [],
                  ),
                  FormBuilderTextField(
                    attribute: "Last name",
                    decoration: InputDecoration(labelText: "Last name"),
//                onChanged: (_){},
                    validators: [],
                  ),
                  FormBuilderTextField(
                    attribute: "Address",
                    decoration: InputDecoration(labelText: "Address"),
//                onChanged: (_){},
                    validators: [],
                  ),
                  FormBuilderTextField(
                    attribute: "Card number",
                    decoration: InputDecoration(labelText: "Card number"),
//                onChanged: (_){},
                    validators: [],
                  ),
                  FormBuilderTextField(
                    attribute: "SVC",
                    decoration: InputDecoration(labelText: "SVC"),
//                onChanged: (_){},
                    validators: [],
                  ),
                  FormBuilderDateTimePicker(
                    attribute: "date",
//                    onChanged: _onChanged,
                    inputType: InputType.date,
                    format: DateFormat("yyyy-MM-dd"),
                    decoration: InputDecoration(labelText: "Expiration date"),
                  ),
                ],
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text("Payment form"),
        actions: <Widget>[
          RaisedButton(
            onPressed: () async {
              Navigator.pop(context, true);
            },
            color: Colors.white,
            child: Text(
              'Confirm payment',
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _thankYouDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Thank you for paying your bill."),
        actions: [
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
  }
}
