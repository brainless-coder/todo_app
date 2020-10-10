import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }

  void openOnBoard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OnBoarding(),
      ),
    );
  }
}
