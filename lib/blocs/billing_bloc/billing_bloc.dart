import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gov/blocs/billing_event.dart';
import 'package:gov/blocs/billing_state.dart';
import 'package:gov/models/bill.dart';
import 'package:gov/services/data_service.dart';
import 'package:gov/services/service_locator.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  @override
  BillingState get initialState => BillingUninitialized();

  List<Bill> bills = [];

  @override
  Stream<BillingState> mapEventToState(BillingEvent event) async* {
    if (event is FetchBilling) {
      yield BillingLoading();
      try {
        bills = await locator<DataService>().getData();
      } catch (e) {
        print(e);
        yield BillingError(Exception("Error in fetching bills"));
      }
      if (bills.isEmpty) {
        yield NoBillingLoaded();
        return;
      }
      yield BillingLoaded(bills);
      return;
    }
  }
}
