import '../models/transaction.dart';
import 'transaction_list.dart';
import 'new_transaction.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  void addTransaction(String title, String amount) {
    setState(() {
      transactions.add(Transaction(
          id: 'id',
          title: title,
          amount: double.parse(amount),
          date: DateTime.now()));
    });
  }

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'car',
      amount: 100.32,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'lawn mover',
      amount: 400.32,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
            addTransaction: addTransaction),
        TransactionList(transactions: transactions),
      ],
    );
  }
}
