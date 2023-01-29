import 'package:flutter/material.dart';
import 'package:app/portfolio.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Portfolio",
            style: TextStyle(fontSize: 30, color: Colors.black)),
      ),
      body: Portfolio(),
    );
  }
}
