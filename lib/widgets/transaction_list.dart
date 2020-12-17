import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'No transaction created yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                        child: Text('€${_transactions[index].amount.toStringAsFixed(2)}')),
                  ),
                ),
                title: Text(
                  _transactions[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat('d MMM yyyy | H:mm').format(_transactions[index].date),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  color: Colors.red[400],
                  onPressed: () => _deleteTransaction(_transactions[index].id),
                ),
              ),
            ),
          );
  }
}
