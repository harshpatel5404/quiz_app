import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MyHome()),
      // );
      Navigator.pushNamed(context, '/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purpleAccent,
        body: Center(
          child: Container(
            child: Text(
              'Quiz App',
              style: GoogleFonts.dancingScript(
                  fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
  }
}