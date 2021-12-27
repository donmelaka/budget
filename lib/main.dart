import 'package:budget/widgets/new_transaction.dart';
import 'package:budget/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.yellow,
        fontFamily: 'OpenSans',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.w300,
            fontSize: 40,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      ),
      home: const BudgetApp(),
    );
  }
}

class BudgetApp extends StatefulWidget {
  const BudgetApp({Key? key}) : super(key: key);

  @override
  _BudgetAppState createState() => _BudgetAppState();
}

class _BudgetAppState extends State<BudgetApp> {
  final List<Transaction> transactions = [];

  void addTransaction(String title, String amount) {
    setState(() {
      transactions.add(Transaction(
          id: 'id',
          title: title,
          amount: double.parse(amount),
          date: DateTime.now()));
    });
  }

  void startCreateNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addTransaction: addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BudgetApp',
        ),
        actions: [
          IconButton(
            onPressed: () => startCreateNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Column(
            children: [
              Container(
                child: const Card(
                  child: Text('First'),
                  color: Colors.blue,
                  elevation: 10,
                ),
                width: double.infinity,
              ),
              TransactionList(transactions: transactions),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startCreateNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
