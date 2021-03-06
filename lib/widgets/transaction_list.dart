import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key? key,
      required List<Transaction> transactions,
      required deleteTransaction})
      : _transactions = transactions,
        _deleteTransaction = deleteTransaction,
        super(key: key);

  final List<Transaction> _transactions;

  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: _transactions.isEmpty
          ? Column(
              children: [
                const Text('No transactions yet'),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.jpeg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${_transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_transactions[index].date),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _deleteTransaction(_transactions[index].id);
                      },
                      icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
