import 'package:flutter/foundation.dart';

class Transaction {
  @required
  final String id;
  @required
  final String title;
  @required
  final double amount;
  @required
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
