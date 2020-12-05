import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
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
              itemCount: transactions.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('€${transactions[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM yyyy | H:mm').format(transactions[index].date),
                  ),
                ),
              ),
            ),
    );
  }
}

// Card(
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   elevation: 5,
//   child: Row(
//     children: [
//       Container(
//         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         decoration: BoxDecoration(
//           border: Border.all(color: Theme.of(context).primaryColor, width: 2),
//         ),
//         padding: EdgeInsets.all(10),
//         child: Text(
//           '€ ${transactions[index].amount.toStringAsFixed(2)}',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             transactions[index].title,
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           Text(DateFormat('d MMM yyyy | H:mm').format(transactions[index].date)),
//         ],
//       )
//     ],
//   ),
// ),
