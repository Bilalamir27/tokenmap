import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tokenmap/Views/account.dart';
import 'package:tokenmap/Views/navigation.dart';

import 'map.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title, required this.uid}) : super(key: key);
  final String title;
  String uid;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;
  var email;
  var password;
  var name;

  _signIn(){
    //https://api.flutter.dev/flutter/material/AlertDialog-class.html
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Unable to sign in"),
            content: Text("Username or password incorrect"),
            actions: <Widget>[
              ElevatedButton(onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(color: Colors.transparent,height: 20),
                  Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child:TextFormField(
                          onChanged: (x){
                            email=x;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: "Enter Email",
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.3),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.blue)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.blue)

                              )

                          ),
                        ) ,
                      )),
                  Flexible(
                    child:Container(
                      margin: const EdgeInsets.all(10),
                      child:TextFormField(
                        onChanged: (x){
                          password=x;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Enter Password",
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.3),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blue)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blue)

                            )

                        ),
                      ) ,
                    ),),
                  Flexible(
                      child:ElevatedButton(
                        onPressed: () async{
                          try{
                            final result = await _auth.signInWithEmailAndPassword(email: email.toString().trim(), password: password.toString().trim());
                            if(result != null){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => AccountPage(uid: result.user!.uid, title: '',)));
                            }
                          }catch(e){
                            _signIn();
                          }
                        },
                        //color: Colors.deepOrangeAccent,
                        child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 20)),
                        //color: Colors.black12,
                      ) )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
