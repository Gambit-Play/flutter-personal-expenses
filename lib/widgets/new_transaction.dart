import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _pickedDate;

  void _submitTransaction() {
    final _enteredTitle = titleController.text;
    final _enteredAmount = double.parse(amountController.text);
    final _isInvalid = _enteredTitle.isEmpty || _enteredAmount <= 0;

    if (_isInvalid) return;

    widget.addTransaction(_enteredTitle, _enteredAmount);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;
      setState(() => _pickedDate = date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [
              Text(
                _pickedDate == null
                    ? 'No Date Chosen!'
                    : 'Picked Date : ${DateFormat('d MMM yyyy').format(_pickedDate)}',
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                onPressed: _showDatePicker,
                child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          RaisedButton(
            textColor: Theme.of(context).textTheme.button.color,
            color: Theme.of(context).primaryColor,
            onPressed: _submitTransaction,
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
