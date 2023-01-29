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

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final HttpService httpService = HttpService();

  bool showValues = true;
  @override
  Widget build(BuildContext context) {
    // Holdings holdings = new Holdings();
    // Map mapOfHoldings = holdings.getHoldings();

    Map<String, double> holdingsMap = {};

    _launchURL(String code) async {
      String url =
          "https://www.google.com/search?q=${code}+news&oq=${code}+news&aqs=chrome..69i57j69i60l2j69i61.1797j0j4&sourceid=chrome&ie=UTF-8";
      if (await canLaunch(url)) {
        // print("Lanuching...");
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    IconData eyeIcon = MyCustomIcons.eye;
    IconData eyeSlashIcon = MyCustomIcons.eye_slash;
    int counter = 0;

    String formatNumber(double num) {
      String retVal = "";
      String tmpNum = "";
      if (num > 1000000) {
        num = num / 1000000;
        tmpNum = num.toStringAsFixed(3);
        retVal = tmpNum + "M";
      } else if (num > 100000) {
        num = num / 1000;
        tmpNum = num.toStringAsFixed(1);
        retVal = tmpNum + "K";
      } else if (num > 10000 || num < -10000) {
        // } else if (num > 10000) {
        // print("Formatting number: " + num.toString());
        num = num / 1000;
        tmpNum = num.toStringAsFixed(2);
        retVal = tmpNum + "K";
      } else if (num > 1000) {
        tmpNum = num.toStringAsFixed(0);
        retVal = tmpNum;
      } else if (num > 10) {
        retVal = num.toStringAsFixed(1);
      } else {
        retVal = num.toStringAsFixed(2);
      }

      return retVal;
    }

    return FutureBuilder(
        future: httpService.getPosts(),
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
            String value = formatNumber(gTotal);
            // String delta = formatNumber(250958);
            bool _isMinus = true;
            if (deltaAmount > 0) {
              _isMinus = false;
            }

            return Column(
              children: [
                Container(
                  color: Color(0xFFFFFBE6),
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.refresh,
                            size: 30, color: Color(0xFF356859)),
                        onPressed: () {
                          String url =
                              "https://1jyqqpwi3m.execute-api.ap-southeast-1.amazonaws.com/api/prices";
                          get(Uri.parse(url));

                          // print("About to sleep");
                          sleep(Duration(seconds: 1));
                          setState(() {
                            print("Setting state");
                            counter = counter + 1;
                          });
                        },
                      ),
                      // SizedBox(width: 10),
                      // IconButton(
                      //   icon: Icon(Icons.refresh,
                      //       size: 30, color: Color(0xFF356859)),
                      //   onPressed: () {
                      //     print("Started refresh");
                      //     String url =
                      //         "https://32rse7u512.execute-api.ap-southeast-1.amazonaws.com/api/prices";
                      //     get(Uri.parse(url));

                      //     print("About to sleep");
                      //     sleep(Duration(seconds:1));
                      //     setState(() {
                      //       print("Setting state");
                      //       counter=counter+1;
                      //     });
                      //   },
                      // ),
                      // SizedBox(width: 10),
                      IconButton(
                        color: Color(0xFF356859),
                        icon: showValues ? Icon(eyeIcon) : Icon(eyeSlashIcon),
                        onPressed: () {
                          setState(() {
                            showValues = !showValues;
                          });
                        },
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PiePage(holdingsMap)),
                      );
                    },
                    child: SummaryCard(
                      value: showValues ? "------".toString() : value,
                      delta: showValues
                          ? "-------".toString()
                          : formatNumber(deltaAmount).toString(),
                      deltaPercent: "",
                      isMinus: _isMinus,
                    )),
                Expanded(
                  child: Container(
                    decoration: new BoxDecoration(color: Color(0xFFFFFBE6)),
                    child: ListView(
                      children: posts.map((Post post) {
                        // String code =
                        // mapOfHoldings[post.id.toString()].elementAt(0);
                        // double amount = mapOfHoldings[post.id.toString()]
                        //     .elementAt(1)
                        //     .toDouble();
                        int amount = post.amount;
                        int totalAmount = (amount * post.price).toInt();
                        grandTotal = grandTotal + totalAmount;

                        // holdingsMap[code] = totalAmount.toDouble();
                        return GestureDetector(
                          // onTap: () => print('Tapped'),
                          onTap: () => _launchURL(post.id),
                          child: Card(
                              child: Column(
                            children: [
                              PortCard(
                                  id: post.id,
                                  price: formatNumber(post.price).toString(),
                                  // price: post.price.toString(),
                                  amount: showValues
                                      ? "------".toString()
                                      : post.amount.toString(),
                                  // total: totalAmount.toString(),
                                  total: showValues
                                      ? "0.0000".toString()
                                      : post.total.toString(),
                                  dayChange:
                                      formatNumber(post.day_change).toString()),
                            ],
                          )
                              // subtitle: Text(post.price.toString()),
                              ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
