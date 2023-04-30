import 'package:flutter/material.dart';
import 'package:untitled3/Page/CjPage.dart';
import 'package:untitled3/Page/FwPage.dart';
import 'package:untitled3/Page/MePage.dart';
import 'package:untitled3/Page/XxPage.dart';

class IndexPage extends StatefulWidget {

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

   final List<Widget> _childern =[
     FwPage(),
     CjPage(),
     XxPage(),
     MePage(),
   ];

  int _currentIndex = 3;



  void onTabRapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childern[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabRapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor:Colors.grey,
        fixedColor: Colors.red,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "房屋"),
          BottomNavigationBarItem(icon: Icon(Icons.clear_all_sharp),label: "场景"),
          BottomNavigationBarItem(icon: Icon(Icons.fiber_new_rounded),label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "我的"),
        ],
      ),
    );
  }
}
