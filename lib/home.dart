import 'package:flutter/material.dart';
 
void main() => runApp(MyHome());
 
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget quizcard(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 10,
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
            ),
          ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body:Container(
        child: Column(
            children: [
              Row(
                children: [
                  quizcard()
                ],
              )
            ],
        ),
    ),
      ),
    );
  }
}