import 'package:flutter/material.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';

class PortCard extends StatelessWidget {
  final String id;
  final String price;
  final String amount;
  final String total;
  final String dayChange;

  PortCard(
      {required this.id,
      required this.price,
      required this.amount,
      required this.total,
      required this.dayChange});

  // final Map myMap = {'bitcoin': 'BTC'};

  MaterialColor getColor(number) {
    MaterialColor retVal = Colors.red;
    if (number >= 0) retVal = Colors.green;
    if (number < 0) retVal = Colors.red;
    return retVal;
  }

  String formatPercent(double num) {
    String retVal = "";
    if (num >= 0) {
      retVal = "+" + num.toString() + "%";
    } else {
      retVal = num.toString() + "%";
    }
    return retVal;
  }

  String formatNumber(double num) {
    String retVal = "";
    String tmpNum = "";

    if (num > 1000000) {
      num = num / 1000000;
      tmpNum = num.toStringAsFixed(1);
      retVal = tmpNum + "M";
    } else if (num > 10000) {
      num = num / 1000;
      tmpNum = num.toStringAsFixed(1);
      retVal = tmpNum + "K";
    } else if (num > 1000) {
      num = num / 1000;
      tmpNum = num.toStringAsFixed(1);
      retVal = tmpNum + "K";
    } else {
      tmpNum = num.toStringAsFixed(0);
      retVal = tmpNum;
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(4, 131, 184, .1),
      100: Color.fromRGBO(4, 131, 184, .2),
      200: Color.fromRGBO(4, 131, 184, .3),
      300: Color.fromRGBO(4, 131, 184, .4),
      400: Color.fromRGBO(4, 131, 184, .5),
      500: Color.fromRGBO(4, 131, 184, .6),
      600: Color.fromRGBO(4, 131, 184, .7),
      700: Color.fromRGBO(4, 131, 184, .8),
      800: Color.fromRGBO(4, 131, 184, .9),
      900: Color.fromRGBO(4, 131, 184, 1),
    };
    MaterialColor beigeColor = MaterialColor(0xFFFFFBE6, color);

    return Container(
      decoration: new BoxDecoration(color: Color(0xFFFFFBE6)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Image.asset(
                // 'assets/images/logos/cardano-ada-logo.png',
                "assets/images/logos/${this.id.toLowerCase()}.png",
                height: 25,
                width: 25,
              ),
              Text(" ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 80,
                child: Text(this.id,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                width: 140,
                child: Text(this.price,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Text(formatNumber(double.parse(total)),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(" USD",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
            ],
          ),
          Divider(height: 10),
          Row(
            children: [
              SizedBox(width: 31),
              Container(
                  width: 79,
                  child:
                      Text(this.amount, style: TextStyle(color: Colors.grey))),
              Container(
                width: 100,
                child: Text(formatPercent(double.parse(this.dayChange)),
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: getColor(double.parse(this.dayChange)))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
