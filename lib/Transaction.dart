import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Transaction {
  @required final id;
  double amount;
  DateTime date;
  String title;

  Transaction({this.id, this.title, this.amount, this.date});
}
