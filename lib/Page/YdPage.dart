import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/Page/LoginPage.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.green,

      ),
      Container(
        color: Colors.orange,
        child: Stack(
          children: [
            Positioned(
                left: 50,
                right: 50,
                bottom: 70,
                child: SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    child: (Text("开始使用")),
                    onPressed: () async{
                      SharedPreferences prefs =await SharedPreferences.getInstance();
                      await prefs.setBool("hasSeenIntro", false);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  ),
                )
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Column(
           children: [
             Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height-150,
               child: (
                      Stack(
                        children: [
                          PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            children: _pages,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _pages.length,
                                    (index) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == index
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
               ),
             ),
             SizedBox(height: 20,),
             FlutterLogo(size: 100,)
           ],
         )
        ],
      ),
    );
  }
}
