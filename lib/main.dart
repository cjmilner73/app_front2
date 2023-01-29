import 'package:app/portfolio.dart';
import 'package:app/charting.dart';
import 'package:flutter/material.dart';
import 'package:app/posts.dart';
import 'package:app/services/pallette.dart';
import 'package:app/services/my_custom_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

 

    MaterialColor basilColor = MaterialColor(0xFF356859, color);
    MaterialColor beigeColor = MaterialColor(0xFFFFFBE6, color);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: beigeColor,
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Color(0xFF356859),
              labelColor: Color(0xFF356859),
              tabs: [
                Tab(
                    text: "Portfolio",
                    icon: Icon(MyCustomIcons.chart_pie,
                        color: Color(0xFF356859))),
                Tab(
                    text: "Coins",
                    icon: Icon(MyCustomIcons.coins, color: Color(0xFF356859))),
                Tab(
                    text: "News",
                    icon: Icon(MyCustomIcons.newspaper,
                        color: Color(0xFF356859))),
                Tab(
                    text: "Alerts",
                    icon: Icon(MyCustomIcons.bell, color: Color(0xFF356859))),
              ],
            ),
            title: const Text("Portfolio",
                style: TextStyle(
                    letterSpacing: 5.0,
                    fontSize: 30,
                    color: Color(0xFF356859))),
          ),
          body: TabBarView(
            children: [
              // PostPage(),
              Portfolio(),
              Charting(),
              Icon(Icons.directions_transit),
              Icon(Icons.ac_unit)
            ],
          ),
        ),
      ),
    );
  }
}
