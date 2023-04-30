import 'package:flutter/material.dart';

class FwglPage extends StatefulWidget {
  const FwglPage({Key? key}) : super(key: key);

  @override
  State<FwglPage> createState() => _FwglPageState();
}

class _FwglPageState extends State<FwglPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的房屋"),
      ),
      body: Text("1111"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip:"Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
