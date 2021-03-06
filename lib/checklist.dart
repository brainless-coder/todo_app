import 'package:flutter/material.dart';
import 'package:todo_ui/homepage.dart';

class CheckList extends StatefulWidget {
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  List<int> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Avenir'),
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
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            backgroundColor: Color(0xfff96060),
            title: Text(
              'New CheckList',
              style: TextStyle(fontSize: 25),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 30,
                  color: Color(0xfff96060),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.8),
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height * 0.83,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Lorem Ispum',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 20),
                              CheckboxListTile(
                                title: Text(
                                  "List Item 1",
                                  style: TextStyle(fontSize: 18),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: selectedList.contains(1),
                                onChanged: (bool value) {
                                  setState(() {
                                    if (value) {
                                      selectedList.add(1);
                                    } else {
                                      selectedList.remove(1);
                                    }
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                  "List Item 2",
                                  style: TextStyle(fontSize: 18),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: selectedList.contains(2),
                                onChanged: (bool value) {
                                  setState(() {
                                    if (value) {
                                      selectedList.add(2);
                                    } else {
                                      selectedList.remove(2);
                                    }
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                  "List Item 3",
                                  style: TextStyle(fontSize: 18),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: selectedList.contains(3),
                                onChanged: (bool value) {
                                  setState(() {
                                    if (value) {
                                      selectedList.add(3);
                                    } else {
                                      selectedList.remove(3);
                                    }
                                  });
                                },
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Color',
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15,
                                  ),
                                  color: Color(0xfff96060),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Add CheckList',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ],
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
