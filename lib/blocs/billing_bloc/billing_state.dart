import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gov/models/bill.dart';

@immutable
abstract class BillingState extends Equatable {
  BillingState([List props = const []]) : super(props);
}

class BillingUninitialized extends BillingState {
  @override
  String toString() => 'BillingUninitialized';
}

class BillingLoading extends BillingState {
  @override
  String toString() => 'BillingLoading';
}

class BillingLoaded extends BillingState {
  final List<Bill> bills;

  BillingLoaded(this.bills) : super([bills]);

  @override
  String toString() => 'BillingLoaded';
}

class BillingError extends BillingState {
  final exception;

  BillingError(this.exception) : super([exception]);

  @override
  String toString() => 'BillingError';
}

class NoBillingLoaded extends BillingState {
  @override
  String toString() => 'No Billing Loaded';
}

//TODO: Add states
