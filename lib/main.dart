import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/quizpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SplashScreen(),
      routes: {
        '/home' : (context)=>Home(),
        '/quizpage' : (context)=>Quiz(),
      },
    );
  }
}

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
                  fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
  }
}