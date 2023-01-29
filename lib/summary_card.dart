import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String value;
  final String delta;
  final String deltaPercent;
  final bool isMinus;

  SummaryCard(
      {required this.value, required this.delta, required this.deltaPercent, required this.isMinus});

  // final Map myMap = {'bitcoin': 'BTC'};

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color(0xFFFFFBE6)),
      // decoration: new BoxDecoration(color: Color(0xFFFFFBE6)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                SizedBox(width: 10),
                Text(value,
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.normal)),
                SizedBox(width: 4),
                Text("USD",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
                SizedBox(width: 15),
                Text(delta,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: isMinus ? Colors.red: Colors.green)),
                SizedBox(width: 4),
                Text("USD",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
              ]),
          Row(
            children: [
              SizedBox(width: 10),
              Text("VALUE", style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
