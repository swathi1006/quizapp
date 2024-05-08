import 'package:flutter/material.dart';
import 'package:quizapp/screens/home1.dart';
import 'package:quizapp/screens/quizpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      home: Quizpage(),
    );
  }
}

