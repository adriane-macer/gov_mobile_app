import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gov/blocs/billing_event.dart';
import 'package:gov/blocs/billing_state.dart';
import 'package:gov/services/data_service.dart';
import 'package:gov/services/service_locator.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  @override
  BillingState get initialState => BillingUninitialized();

  @override
  Stream<BillingState> mapEventToState(BillingEvent event) async* {
    if(event is FetchBilling){
      yield BillingLoading();
      final bills = await locator<DataService>().getData();
      yield BillingLoaded(bills);
    }
  }
}