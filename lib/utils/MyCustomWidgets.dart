import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_ButtonComingSoon extends StatelessWidget {
  Custom_ButtonComingSoon({Key? key, required this.label, required this.msg})
      : super(key: key);

  final String label;
  final String msg;

  @override
  Widget build(BuildContext context) {
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
}
