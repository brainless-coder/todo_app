import 'package:flutter/material.dart';
import 'package:todo_ui/passwordchangesuccess.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
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
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                Text(
                  'Reset code was sent to your mail ID. Please enter the code and generate a new password',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Reset Code',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '****',
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your Password here',
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Re-Enter your Password here',
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordChangeSuccess(),
                      ),
                    );
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
