import 'package:flutter/material.dart';
import 'loginPage.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: OnBoardingPage(),
    );
  }
}

// ignore: camel_case_types
class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage('onboard1', 'Welcome to Prime TODO'),
                    onBoardPage('onboard2', 'Work Happens'),
                    onBoardPage('onboard3', 'Tasks and Assignments'),
                  ],
                  onPageChanged: (value) => setCurrentPage(value),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/path1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(7, 9),
                          blurRadius: 30,
                          spreadRadius: 3,
                        )
                      ]),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: currentPage == pageNo ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: currentPage == pageNo ? Colors.redAccent : Colors.grey,
      ),
    );
  }

  Column onBoardPage(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 19,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$img.png'),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 40,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Text(
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }

  setCurrentPage(value) {
    setState(() {
      currentPage = value;
    });
  }
}
