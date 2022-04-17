import 'dart:ui';

import 'package:flutter/material.dart';

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
              children: const [
                Positioned.fill(
                    child:Opacity(
                        opacity: 0.4,
                        child:Image(image: AssetImage('assets/background.jpg'),

                        )
                    )
                ),

              ],
            ),
          )
      );
    }
  }