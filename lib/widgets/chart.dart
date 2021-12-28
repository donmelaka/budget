import 'package:budget/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart({Key? key, required List<Transaction> transactions})
      : this._transactions = transactions,
        super(key: key);

  List<Transaction> _transactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double sumForTheDay = 0.0;

      for (var trn in _transactions) {
        if (trn.date.day == weekDay.day &&
            trn.date.month == weekDay.month &&
            trn.date.year == weekDay.year) {
          sumForTheDay += trn.amount;
        }
      }
      return {
        'day': DateFormat('E').format(weekDay).substring(0, 1),
        'amount': sumForTheDay,
      };
    });
  }

    double get sum {
    return groupedTransactionValues.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.reversed.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                amount: e['amount'] as double,
                lable: e['day'].toString(),
                percentage: (sum > 0 ? (e['amount'] as double) / sum : 0.0),
              ),
            );
          }).toList(growable: false),
        ),
      ),
    );
  }
}
