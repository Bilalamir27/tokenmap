import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tokenmap/Views/map.dart';

import 'main.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key, required this.title, required this.uid}) : super(key: key);
  final String title;
  String uid;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var tempFirst;
  var tempEmail;
  //final _auth = FirebaseAuth.instance;
  final CollectionReference userC = FirebaseFirestore.instance.collection('users');
  _displayInfo(){
    FirebaseFirestore.instance.collection("users").doc(widget.uid).get().then((value){
      setState(() {
        tempFirst = value.data()?["name"];
        tempEmail = value.data()?["email"];
      });
    });
    return Container(
      child: Column(
        children: [
          Text(tempFirst.toString(),style: TextStyle(color: Colors.white,fontSize: 20)),
          Text(tempEmail.toString(),style: TextStyle(color: Colors.white,fontSize: 20))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          children: [
            Container(color: Colors.transparent,height: 40),
            Text("Account",style: TextStyle(color: Colors.white, fontSize: 40),),
            Container(
              child:CircleAvatar(
                backgroundImage: AssetImage("assets/avitar.jpg"),
                radius: 70,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue,width: 2)
              ),
            ),
            Container(color: Colors.transparent,height: 80),
            Container(
              child: _displayInfo(),
            ),
            Text("Token Count: 1",style: TextStyle(color: Colors.white, fontSize: 20),),
            Container(color: Colors.transparent,height: 30),
            SizedBox(
              width: 250,
              child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MapPage(title: '',uid: '',)));
                  },
                  child: const Text("Map",style: TextStyle(color: Colors.white))
              ),
            ),
            SizedBox(
              width: 250,
              child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: '',)));
                  },
                  child: const Text("Logout",style: TextStyle(color: Colors.white))
              ),
            ),
          ],
        ),
      ),
    );
  }
}