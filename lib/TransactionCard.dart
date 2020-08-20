import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';

class TCard extends StatelessWidget {
  List<Transaction> transactions;
  Function func;
  TCard({this.transactions, this.func});
  @override
  Widget build(BuildContext context) {
    return Container(height:400,
      
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(height: 70,
                      width: 70,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                      
                    ),
                    child: Center(
                      child: Text(
                        '\$' + transactions[index].amount.toString().substring(0,4),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        DateFormat()
                            .add_yMMMEd()
                            .format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: IconButton(icon: Icon(Icons.delete,color: Colors.red,),
                        
                        onPressed: () {
                          func(transactions[index].id);
                        }),
                  )
                ],
              ),
            );
          }),
    );
  }
}
