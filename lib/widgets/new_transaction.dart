import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction({Key? key, required Function addTransaction})
      : _addTransaction = addTransaction,
        super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _date = DateTime.now();

  void _onSubmit() {
    var amount = _amountController.text;
    var title = _titleController.text;

    if (title.isEmpty || amount.isEmpty) {
      return;
    }

    widget._addTransaction(title, amount, _date);
    Navigator.of(context).pop();
  }

  void displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _date = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(color: Colors.grey),
            ),
            controller: _titleController,
            onSubmitted: (_) {
              _onSubmit();
            },
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType:
                TextInputType.numberWithOptions(signed: false, decimal: true),
            onEditingComplete: () {
              _onSubmit();
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            controller: _amountController,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          Row(
            children: [
              SizedBox(
                width: 45,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    displayDatePicker();
                  },
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.button?.color,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  DateFormat.yMMMd().format(_date),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.topRight,
            child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: _onSubmit,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.button?.color,
                  ),
                )),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
      elevation: 15,
    );
  }
}
