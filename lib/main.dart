import 'package:flutter/material.dart';
import 'package:flutter_expenses_tracker/transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
    Transaction(
      id: "wdg2",
      title: "Jacket",
      amount: 13,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Container(
              child: Text("CHART!"),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row( children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(tx.amount.toString())),
                    Column(
                      children: [Text(tx.title), Text(tx.date.toString())],
                    ),
                  ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
