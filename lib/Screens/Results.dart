import 'package:author/Comm/genLoginSignupHeader.dart';
import 'package:author/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'UploadData.dart';

class results extends StatefulWidget {
  const results({Key? key}) : super(key: key);

  @override
  _resultsState createState() => _resultsState();
}

class _resultsState extends State<results> {
  Can can1 = Can();
  Can can2 = Can();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("candidates").doc('can1').get().then((value) {
      this.can1 = Can.fromMap(value.data());
      setState(() {});
    });
    FirebaseFirestore.instance.collection("candidates").doc('can2').get().then((value) {
      this.can2 = Can.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genLoginSignupHeader('Results'),
                    SizedBox(height: 20.0),
                    Text('Candidate 1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36.0)),
                    SizedBox(height: 20.0),
                    Text('${can1.votes}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 56.0)),
                    SizedBox(height: 20.0),
                    Text('Candidate 2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36.0)),
                    SizedBox(height: 20.0),
                    Text('${can2.votes}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 56.0)),
                  ],
                ),
              ),
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
    );
  }
}
