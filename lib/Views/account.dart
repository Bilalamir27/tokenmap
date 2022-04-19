import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            Container(
              child:CircleAvatar(
                //backgroundImage: AssetImage("assets/noImage.jpg"),
                radius: 70,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.deepOrangeAccent,width: 2)
              ),
            ),
            Container(color: Colors.transparent,height: 100),
            Container(
              child: _displayInfo(),
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
            // SizedBox(
            //   width: 250,
            //   child:  ElevatedButton(
            //       onPressed: () async{
            //         try{
            //           final result = await _auth.currentUser;
            //           result.delete();
            //           userC.doc(widget.uid).delete();
            //           userI.doc(widget.uid).delete();
            //           Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => MyHomePage(uid: result.user!.uid, title: '',)));
            //
            //         }catch(e){
            //           print('not deleted');
            //         }
            //       },
            //       child: Text("Delete Account",style: TextStyle(color: Colors.white))
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}