import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/Page/FwPage.dart';

import '../Service/http_config.dart';
import '../Service/http_service.dart';
import 'IndexPage.dart';

class LoginPage extends StatelessWidget {


  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void login(){
      post(
          postLogin,
          data: {"username":username.text,"password":password.text}
      ).then((value){
        var data = json.decode(value.toString());
        if(data["code"] == 200){
          token = data["token"];
          Navigator.push(context, MaterialPageRoute(builder: (context) =>IndexPage()));
        }else{
        }
      });
    }


    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 100,),
            FlutterLogo(size: 100,),
            SizedBox(height: 50,),
            Container(
              width: 250,
              child: TextField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "用户名",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black12,width: 2)
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 250,
              child: TextField(
                maxLength: 16,
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "密码",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black12,width: 2)
                    )
                ),
              ),
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("注册用户"),
                  Text("忘记密码"),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: (){
                  login();
                },
                child: Text("登录"),
              ),
            )
          ],
        ),
      )
    );
  }
}
