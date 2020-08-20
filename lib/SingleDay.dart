import 'package:flutter/material.dart';

class SingleDay extends StatelessWidget {
  String day;
  double h;
  SingleDay(this.day, this.h);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '\$',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          height: 100 - h,
          width: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey[300],
            ),
          ),
        ),
        Container(
          height: h,
          width: 15,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple),
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
        ),
        Text(day),
      ],
    );
  }
}
