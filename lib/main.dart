import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/widgets/new_transactions.dart';
import 'package:flutter_expenses_tracker/widgets/transaction_list.dart';
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        id: DateTime.now().toString());

    //Add the transaction to the list and build again!
    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  //Opens a dialog
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              child: Text("CHART!"),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          TransactionList(_userTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
