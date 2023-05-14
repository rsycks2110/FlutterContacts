import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';

import 'LoginPage.dart';
class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context as BuildContext , MaterialPageRoute(builder: (context)=>LoginPage(),));

    })
    ;

  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Home')),

        ),
        body: Container(
          child:Text("HOME",style: TextStyle(fontSize: 34,fontWeight:FontWeight.w400 )
          ),

        )
    );



  }
}