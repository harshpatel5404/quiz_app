import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  var marks;
  Result({ Key? key, @required this.marks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Marks is $marks"),
      ),
    );
  }
}