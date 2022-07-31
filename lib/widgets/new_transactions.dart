import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  //Controllers for updating text field
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void sumbmitData() {
    final enterTitle = titleController.text;
    final enterAmount = titleController.text;

    //Check if input are not empty
    if (enterTitle.isEmpty || enterAmount.isEmpty) {
      return;
    }

    

    addTx(titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => sumbmitData(),
            ),
            FlatButton(
                onPressed: () {
                  sumbmitData();
                },
                child: Text(
                  "Add transaction",
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }
}
