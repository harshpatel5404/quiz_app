import 'dart:async';
import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString("../assets/mydata.json"),
      builder: (context, snapshot) {
        var quizdata = json.decode(snapshot.data.toString());
        if (quizdata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else {
          return quizpage(quizdata: quizdata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  var quizdata;
  quizpage({Key? key, @required this.quizdata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(quizdata);
}

class _quizpageState extends State<quizpage> {
  var quizdata;
  _quizpageState(this.quizdata);
  int timer = 30;
  bool button = true;
  int i = 0, marks = 0;
  String showtimer = "30";
  bool canceltimer = false;
  Color display = Colors.indigo;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> defaultcolor = {
    "0": Colors.indigo,
    "1": Colors.indigo,
    "2": Colors.indigo,
    "3": Colors.indigo
  };

  @override
  void initState() {
    super.initState();
    starttimer();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1 ) {
          t.cancel();
          nextquetion();
        }else if(canceltimer==true){
          t.cancel();
        }
         else {
          timer--;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquetion() {
    canceltimer =false;
    button = true;
    timer = 30;
    setState(() {
      if (i < 9) {
        i++;
        defaultcolor = {
          "0": Colors.indigo,
          "1": Colors.indigo,
          "2": Colors.indigo,
          "3": Colors.indigo
        };
      } else {
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => Result(marks: marks,)));
      }
    });
    starttimer();
  }

  void checkanswer(String options, int index) {
    print(options);
    if (options == quizdata["results"][i]["correct_answer"]) {
      display = right;
      marks += 5;
    } else {
      display = wrong;
    }
    setState(() {
      defaultcolor[index.toString()] = display;
      canceltimer=true;
      button = false;
    });
    Timer(Duration(seconds: 1), nextquetion);
  }

  Widget optionBtn(String options, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: FlatButton(
        onPressed: () => button?checkanswer(options, index) : null,
        height: 55,
        minWidth: 200,
        color: defaultcolor[index.toString()],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          options,
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
                  quizdata["results"][i]["question"],
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
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  optionBtn(quizdata["results"][i]["options"][0], 0),
                  optionBtn(quizdata["results"][i]["options"][1], 1),
                  optionBtn(quizdata["results"][i]["options"][2], 2),
                  optionBtn(quizdata["results"][i]["options"][3], 3),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                showtimer,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
