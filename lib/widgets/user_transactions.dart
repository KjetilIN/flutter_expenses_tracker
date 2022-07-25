import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:flutter_expenses_tracker/widgets/new_transactions.dart';
import 'package:flutter_expenses_tracker/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: "24fd",
      title: "New Shoes",
      amount: 102,
      date: DateTime.now(),
    ),
    Transaction(
      id: "3ddfs",
      title: "Basketball",
      amount: 12,
      date: DateTime.now(),
    ),
  ];

  //Add a new transaction to the list of transactions
  void _addNewTransaction(String title, double amount) {
    //Create a new transaction 
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString()
    );
    
    //Add the transaction to the list and build again!
    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
