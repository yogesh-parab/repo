import 'package:flutter/material.dart';
import 'Transaction.dart';
import "TransactionCard.dart";
import 'Graph.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Budget());
  }
}

class Budget extends StatefulWidget {
  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  List<Transaction> transactions = [
    Transaction(
        id: UniqueKey(),
        title: 'jacket',
        amount: 300,
        date: DateTime.parse("1969-07-20 20:18:04Z")),
    Transaction(
        id: UniqueKey(),
        title: 'jacket',
        amount: 300,
        date: DateTime.parse("1961-07-20 20:18:04Z")),
    Transaction(
        id: UniqueKey(),
        title: 'jacket',
        amount: 300,
        date: DateTime.parse("1967-07-20 20:18:04Z")),
  ];
  void _remove(final key) {
    for (var i = 0; i < transactions.length; i++) {
      if (transactions[i].id == key) {
        setState(() {
          transactions.remove(transactions[i]);
        });
      }
    }
    ;
  }

  void _add(String title, String amount) {
    Transaction T = Transaction(
      title: title,
      amount: double.parse(amount),
      date: DateTime.now(),
      id: UniqueKey(),
    );
    setState(() {
      transactions.add(T);
    });
  }

  void _bringModalSheet(BuildContext ctx) {
    var t1 = TextEditingController();
    var t2 = TextEditingController();

    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: t1,
                decoration: InputDecoration(labelText: 'title'),
              ),
              TextField(
                controller: t2,
                decoration: InputDecoration(
                  labelText: 'amount',
                ),
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                child: Text(
                  'Pick a date',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                  onPressed: () {
                    _add(t1.text, t2.text);
                    Navigator.of(context).pop();
                  },
                  child: (Text(
                    'Add Transaction',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  )))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (transactions.length == 0) {
      return (Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(backgroundColor: Colors.amber,
              child: Icon(Icons.add,color: Colors.black,),
              onPressed: () {
                _bringModalSheet(context);
              },splashColor: Colors.amber,),
          body: Center(
              child: Text(
            'No transactions yet!',
            style: TextStyle(fontSize: 20),
          )),
          appBar: AppBar(backgroundColor: Colors.purple,
            title: Text(
              'Budget Calculator',
            ),
          )));
    }
    return (Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.amber,
        child: Icon(Icons.add,color: Colors.black,),
        onPressed: () {
          _bringModalSheet(context);
        },
      ),
      appBar: AppBar(backgroundColor: Colors.purple,
        title: Text('Budget Calculator'),
        actions: [
          IconButton(
            onPressed: () {
              _bringModalSheet(context);
            },
            icon: Icon(
              Icons.add,
            ),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Graph(transactions),
              elevation: 7,
            ),
            TCard(transactions: transactions, func: _remove),
          ],
        ),
      ),
    ));
  }
}
