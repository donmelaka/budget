import 'package:budget/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BudgetApp());
}

class BudgetApp extends StatefulWidget {
  const BudgetApp({Key? key}) : super(key: key);

  @override
  _BudgetAppState createState() => _BudgetAppState();
}

class _BudgetAppState extends State<BudgetApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BudgetApp'),
          actions: [
            IconButton(
              onPressed: () {},
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
                UserTransactions(),
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
