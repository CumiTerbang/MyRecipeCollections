import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

import 'MyCustomWidgets.dart';

class HomePage extends StatelessWidget {

  ConstrainedBox buildButtonComingSoon(
      BuildContext context, String label, String msg) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200),
      child: ElevatedButton(
          child: Text(label),
          onPressed: () {
            SnackBar snackBar = SnackBar(
              content: Text(msg),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }),
    );
  }

  Widget buildBodyContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to Home Page", style: TextStyle(fontSize: 14.0)),
          Custom_ButtonComingSoon(label: "testing", msg: "test msg")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: buildBodyContent(context),
      ),
    );
  }

}