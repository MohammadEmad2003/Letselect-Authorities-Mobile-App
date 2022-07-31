// @dart = 2.9
import 'package:flutter/material.dart';
import 'Results.dart';
import 'UploadData.dart';

class Start extends StatefulWidget {
  const Start({Key key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  'assets/vottinglogo.png',
                  width: 200.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Let's",
                    style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text("elect",
                      style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],
              ),
              Text('Be Home Be Safe',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.0,
              ),
              Text('Authorties Edition',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 50.0),
                          child: ElevatedButton(
                              onPressed: () {
                                print(
                                    "Election Results : candidate 1 vots = 0, candidate 2 vots = 1");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupForm()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shadowColor: MaterialStateProperty.all(
                                      Color.fromRGBO(0, 0, 0, 0))),
                              child: Text("Upload User",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Color.fromRGBO(0, 113, 213, 1.0),
                                      fontWeight: FontWeight.bold)))))),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 80.0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => results()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shadowColor: MaterialStateProperty.all(
                                      Color.fromRGBO(0, 0, 0, 0))),
                              child: Text("Results",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Color.fromRGBO(0, 113, 213, 1.0),
                                      fontWeight: FontWeight.bold)))))),
              SizedBox(
                height: 150.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/nilelogo.png',
                    width: 100.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupForm()));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(
                              Color.fromRGBO(0, 0, 0, 0))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Text("Made by Sondos Ahmed",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                            Text(
                              "Mohammad Emad",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            )
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(2, 220, 220, 1.0),
              Color.fromRGBO(0, 113, 213, 1.0)
            ])),
      ),
    ));
  }
}
