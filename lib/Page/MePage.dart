import 'package:flutter/material.dart';
import 'package:untitled3/Page/FwglPage.dart';
import 'package:untitled3/Service/MyFutureBuilder.dart';
import 'package:untitled3/Service/http_config.dart';
import 'package:untitled3/Service/http_service.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {

  final List aa = [];
  bool bb = true;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body:MyFutureBuilder(
          future: Future.wait([get(getUser)]),
          success: aa,
          fail: [],
          builder: (){
            print("${aa[0]}");
            return Container(
              padding: EdgeInsets.all(10),
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("设置"),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage("http://192.168.1.211:10001/prod-api/profile/upload/2023/04/28/7254729d-63bf-4621-b38a-668bb71fbc37.jpg"),
                        radius: 60,
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${aa[0]["user"]["nickName"]}")
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${aa[0]["user"]["nickName"]}")
                    ],
                  ),
                  Container(
                    width: 350,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("智能设备",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 20,),
                            Text("15",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("我的房屋",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 20,),
                            Text("1",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> FwglPage()));}, child: Text("房屋管理",style: TextStyle(color: Colors.black),))],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 1
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [TextButton(onPressed: (){}, child: Text("清除缓存",style: TextStyle(color: Colors.black)))],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 1
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [TextButton(onPressed: (){}, child: Text("关于我们",style: TextStyle(color: Colors.black)))],
                    ),
                  ),
                ],
              ),
            );
          },
          isRequest: bb,
      ),
    );
  }
}
