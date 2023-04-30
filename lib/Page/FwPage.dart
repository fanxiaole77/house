import 'package:flutter/material.dart';

class FwPage extends StatefulWidget {
  const FwPage({Key? key}) : super(key: key);

  @override
  State<FwPage> createState() => _FwPageState();
}

class _FwPageState extends State<FwPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("fangwu1"),),
    );
  }
}
