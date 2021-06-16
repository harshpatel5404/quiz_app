import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/quizpage.dart';
import 'package:quiz_app/splashscreen.dart';

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

