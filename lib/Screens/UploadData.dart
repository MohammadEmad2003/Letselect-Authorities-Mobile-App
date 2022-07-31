// @dart = 2.9
import 'package:author/Comm/Toast.dart';
import 'package:author/Comm/genLoginSignupHeader.dart';
import 'package:author/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Start.dart';


class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;


  final UserName = TextEditingController();
  final NationalID = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.nid = user.email;
    userModel.name = user.uid;
    userModel.submit = 1;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Start()),
            (route) => false);
    alertDialog(context, 'The Data Uploaded Successfully');
  }

  void signUp(String nid, String uname) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: nid, password: uname)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          print(e);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            alertDialog(context, "Your email address appears to be malformed");
            break;
          case "wrong-password":
            alertDialog(context, "Your password is wrong");
            break;
          case "user-not-found":
            alertDialog(context, "User with this email doesn't exist");
            break;
          case "user-disabled":
            alertDialog(context, "User with this email has been disabled");
            break;
          case "too-many-requests":
            alertDialog(context, "Too many requests");
            break;
          case "operation-not-allowed":
            alertDialog(context, "Signing in with Email and Password is not enabled");
            break;
          case "Password should be at least 6 characters":
            alertDialog(context, "Your Name mustn't be less than 6 characters");
            break;
          default:
            alertDialog(context, "An undefined Error happened.");
        }
        alertDialog(context, error.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final username = Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:TextFormField(
            autofocus: false,
            controller: UserName,
            validator: (value) {
              if (value.isEmpty) {
                return ("Password is required for login");
              }

            },
            onSaved: (value) {
              UserName.text = value;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white
                  )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white
                  )),
              labelText: "Name",
              labelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22.0),
              focusColor: Colors.white,
            ),
            style: TextStyle(color: Colors.white, fontSize: 22.0)));
    final nationalID = Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:TextFormField(
          autofocus: false,
          controller: NationalID,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value.isEmpty) {
              return ("Please Enter Your Email");
            }
            return null;
          },
          onSaved: (value) {
            NationalID.text = value;
          },
          textInputAction: TextInputAction.next,
          decoration:  InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white
                )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white
                )),
            labelText: "National ID",
            labelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22.0),
            focusColor: Colors.white,
          ),
          style: TextStyle(color: Colors.white, fontSize: 22.0),));


    return Material(
      child: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genLoginSignupHeader('Signup'),
                    username,
                    nationalID,
                    Container(
                      margin: EdgeInsets.all(30.0),
                      width: double.infinity,
                      child: ElevatedButton(style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
                          child: Text('Sign Up', style: TextStyle(color: Color.fromRGBO(0, 113, 213, 1.0), fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          onPressed:(){
                        if(NationalID.text.length == 14){
                            String national = NationalID.text + "@letselect.com";
                            signUp(national, UserName.text);
                      }else{alertDialog(context, 'Enter valid National ID');}}
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
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
