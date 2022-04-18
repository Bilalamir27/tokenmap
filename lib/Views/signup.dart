import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tokenmap/Views/map.dart';
import 'package:tokenmap/Views/navigation.dart';

import 'login.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key, required this.title, required this.uid}) : super(key: key);
  final String title;
  String uid;
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  final _auth = FirebaseAuth.instance;
  var email;
  var password;
  var name;

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
                    Container(color: Colors.transparent,height: 50),
                    Text("Sign Up",style: TextStyle(color: Colors.white, fontSize: 40),),
                    Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child:TextFormField(
                            onChanged: (x){name=x;},
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "Please Enter Your Name",
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
                        )
                    ),
                    Flexible(
                        child:Container(
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
                        )
                    ),
                    Flexible(
                        child:Container(
                          margin: const EdgeInsets.all(10),
                          child:TextFormField(
                            onChanged: (x){
                              password = x;
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
                        )
                    ),
                    Container(color: Colors.transparent,height: 40),
                    Flexible(
                        child:ElevatedButton(
                          onPressed: () async{
                            if(email == null || name == null ||  password == null|| password.length<6){
                              //_signupAlert();
                            }
                            else{
                              // try{
                                final result = await _auth.createUserWithEmailAndPassword(email: email.toString().trim(), password: password.toString().trim());

                                if(result != null){
                                  FirebaseFirestore.instance.collection("users").doc(result.user?.uid).set({
                                    "email" : email,
                                    "name" : name,
                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(uid: '', title: '',)));
                                }
                              // }
                              // catch(e){
                              //   _emailAlert();
                              // }
                            }
                          },
                          child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontSize: 20)),
                          //color: Colors.black12,
                        ) ),
                    Container(color: Colors.transparent,height: 20),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MapPage(title: '',uid: '',)));
                      },
                      child: Text("If you already have an account?, press here to login",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
