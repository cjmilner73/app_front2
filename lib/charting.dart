import 'dart:io';
import 'package:app/services/my_custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';
import 'package:app/summary_card.dart';
import 'package:app/pie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app/services/http_service.dart';
import 'package:http/http.dart';
// import 'dart:convert';

class Charting extends StatefulWidget {
  @override
  _ChartingState createState() => _ChartingState();
}

class _ChartingState extends State<Charting> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    // Holdings holdings = new Holdings();
    // Map mapOfHoldings = holdings.getHoldings();

    IconData eyeIcon = MyCustomIcons.eye;
    IconData eyeSlashIcon = MyCustomIcons.eye_slash;
    int counter = 0;

    return FutureBuilder(
        future: httpService.getOHCL(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data as List<Post>;

            // var key = myMap.keys.elementAt(0);
            // print(myMap[key].toString());
            // Type type = myMap[key].runtimeType;
            // print(type);
            // print(myMap[key].elementAt(1));
            double grandTotal = 0.0;
            // print(tempMap['BTC']);
            // String tempMap = myMap[key];
            // print(key.keys.elementAt(0));
            double gTotal = 0.0;
            double price = 0.0;
            double deltaAmount = 0.0;
            for (var i = 0; i < posts.length; i++) {
              // amt = (mapOfHoldings[posts[i].id.toString()]
              // .elementAt(1)
              // .toDouble());
              deltaAmount = deltaAmount +
                  (posts[i].price.toDouble() * posts[i].day_change);
              price = posts[i].price.toDouble();
              gTotal = gTotal + (posts[i].amount * price);
            }
            // String value = gTotalM.toStringAsFixed(3);
            // String delta = formatNumber(250958);
            bool _isMinus = true;
            if (deltaAmount > 0) {
              _isMinus = false;
            }

          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
