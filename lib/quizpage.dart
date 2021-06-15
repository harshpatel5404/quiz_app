import 'package:flutter/material.dart';

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: quizpage(),
    );
  }
}

class quizpage extends StatefulWidget {
  const quizpage({Key? key}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  Widget optionBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: FlatButton(
        height: 55,
        minWidth: 200,
        color: Colors.indigoAccent[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: Text(
          "Option 1",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget quizlayout() {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question : 1 what is your favorite langugaes?? How Many types of Oops Concepts?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          optionBtn(),
                          optionBtn(),
                          optionBtn(),
                          optionBtn()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "30",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: quizlayout(),
    ));
  }
}
