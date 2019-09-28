import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BillingEvent extends Equatable {
  BillingEvent([List props = const []]) : super(props);
}

class FetchBilling extends BillingEvent {

  @override
  String toString() => 'FetchBilling';
}

class RefreshBilling extends BillingEvent {

  @override
  String toString() => 'RefreshBilling';
}

//TODO: Add events
