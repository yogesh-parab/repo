import 'package:flutter/material.dart';
import 'SingleDay.dart';
import 'Transaction.dart';

class Graph extends StatelessWidget {
  List<Transaction> tr;
  double total=0;
  double mo=0;
  double tu=0;
  double we=0;
  double th=0;
  double fr=0;
  double sa=0;
  double su=0;
  Graph(List tr1)
   { tr=tr1;
    for (var i = 0; i < tr.length; i++) {
      total += tr[i].amount;
      if (tr[i].date.weekday == 1) {
        mo += tr[i].amount;
      } else if (tr[i].date.weekday == 2) {
        tu += tr[i].amount;
      }  else if (tr[i].date.weekday == 3) {
        we += tr[i].amount;
      }  else if (tr[i].date.weekday == 4) {
        th += tr[i].amount;
      }  else if (tr[i].date.weekday == 5) {
        fr += tr[i].amount;
      }  else if (tr[i].date.weekday == 6) {
        sa += tr[i].amount;
      }  else if (tr[i].date.weekday == 7) {
        su += tr[i].amount;
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SingleDay('M',mo*100/total),
          SingleDay('T',tu*100/total),
          SingleDay('W',we*100/total),
          SingleDay('T',th*100/total),
          SingleDay('F',fr*100/total),
          SingleDay('S',sa*100/total),
          SingleDay('S',su*100/total),
        ],
      ),
    );
  }
}
