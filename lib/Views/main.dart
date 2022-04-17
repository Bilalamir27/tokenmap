import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:tokenmap/Views/login.dart';
import 'package:tokenmap/Views/signup.dart';

void main() async{
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
                      Container(color: Colors.transparent,height: 50),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LoginPage(title: '',)));
                      },
                          child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20))
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SigninPage(title: '',)));
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
  }