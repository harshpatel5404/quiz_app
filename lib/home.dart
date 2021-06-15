import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quizpage.dart';

void main() => runApp(Home());


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
        home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget quizcard(String lang, String img) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
        },
        child: Material(
          color: Colors.indigo,
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage("./assets/${img}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    lang,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hii as sdfgf wer x csfd erna qwdghasr jfsoiosdn nsd asdg hello my name usb folng weight vol.sdn nsd asdg hello my name usb folng as sdfgf wer x csfd erna qwdghasr jfsoiosdn nsd asdg hello my name usb folng weight vol.sdn nsd asdg hello my name usb folng weight volas fd.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List img = [
      "images/cpp.png",
      "images/java.png",
      "images/js.png",
      "images/py.jpg",
      "images/ruby.jpg",
    ];
    return Scaffold(
          appBar: AppBar(
            // backgroundColor: Color.fromARGB(30, 0, 255, 255),
            title: Text('Quiz App'),
          ),
          body: ListView(
            children: [
              quizcard("C++", img[0]),
              quizcard("Java", img[1]),
              quizcard("Java Script", img[2]),
              quizcard("Python", img[3]),
              quizcard("Ruby", img[4]),
            ],
          ),
    );
  }
}
