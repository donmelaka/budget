import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTransaction;

  NewTransaction({Key? key, required Function addTransaction})
      : _addTransaction = addTransaction,
        super(key: key);

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _onSubmit() {
    var amount = _amountController.text;
    var title = _titleController.text;

    if (title.isEmpty || amount.isEmpty) {
      return;
    }

    _addTransaction(title, amount);
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
          ),
          FlatButton(
              onPressed: _onSubmit,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              )),
        ],
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
      elevation: 15,
    );
  }
}
