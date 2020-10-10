import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [Text('Username')],
          ),
        ),
      ),
    );
  }
}
