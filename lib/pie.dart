import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PiePage extends StatelessWidget {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  PiePage(Map<String, double> h) {
    dataMap = h;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: PieChart(dataMap: dataMap),
    );
  }
}
