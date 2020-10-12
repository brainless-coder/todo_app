import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String filterType = "today";
  int index = 0;
  CalendarController _calendarController = new CalendarController();
  DateTime today = DateTime.now();
  var monthNames = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF96060),
        elevation: 0,
        title: Text(
          'Work List',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.short_text,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                color: Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              filterType = "today";
                            });
                          },
                          child: Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: filterType == "today"
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              filterType = "monthly";
                            });
                          },
                          child: Text(
                            'Monthly',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: filterType == "monthly"
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (filterType == "monthly")
                  ? TableCalendar(
                      calendarController: _calendarController,
                      initialCalendarFormat: CalendarFormat.week,
                    )
                  : Container(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today ${monthNames[today.month - 1]} ${today.day} / ${today.year}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      taskWidget(Color(0xfff96060), "Going out", "10:00 AM"),
                      taskWidget(Colors.teal, "Lunch", "12:00 AM"),
                      taskWidget(
                          Colors.blueAccent, "Meeting Someone", "4:00 PM"),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.tealAccent,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff292e4e),
        currentIndex: index,
        iconSize: 30,
        elevation: 0,
        unselectedItemColor: Colors.white,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });

          if (index == 2) {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text('Add Task'),
                      ),
                      Container(
                        height: 2,
                        color: Colors.black.withOpacity(0.2),
                        margin: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                          child: Text('Add Quick Note '),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Colors.black.withOpacity(0.2),
                        margin: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                          child: Text('Add Checklist'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            title: Text('My Task'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 43,
              width: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xfff96060),
                      Colors.red,
                      Colors.orangeAccent,
                      Colors.pinkAccent
                    ]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: 33,
              ),
            ),
            title: Text('Add Task'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            title: Text('Quick Tasks'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }

  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  width: 4,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 70,
              width: 7,
              color: color,
            ),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          onTap: () {},
          caption: "Edit",
          color: Colors.white,
          icon: Icons.edit,
          foregroundColor: Colors.blueAccent,
        ),
        IconSlideAction(
          onTap: () {},
          caption: 'Delete',
          icon: Icons.delete,
          foregroundColor: Colors.red,
        )
      ],
    );
  }
}
