import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:tokenmap/Views/login.dart';
import 'package:tokenmap/Views/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



  class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body:Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                    child:Opacity(
                        opacity: 0.4,
                        child:Image.asset('assets/background.jpg',
                          fit: BoxFit.cover,
                        )
                    )
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(color: Colors.transparent,height: 90),
                      Text("Token Map",style: TextStyle(color: Colors.white, fontSize: 40),),
                      Container(color: Colors.transparent,height: 200),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LoginPage(title: '',uid: '',)));
                      },
                          child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20))
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SigninPage(title: '',uid: '',)));
                      },
                          child: Text("SignUp",style: TextStyle(color: Colors.white,fontSize: 20))
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      );
    }
  }//