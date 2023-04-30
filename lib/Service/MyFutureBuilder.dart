import 'dart:convert';

import 'package:flutter/material.dart';

class MyFutureBuilder<T> extends FutureBuilder {
  MyFutureBuilder({
  super.key,
  required Future future,
  required List<dynamic> success,
  required List<dynamic> fail,
  T? initialData,
  required Widget Function()
  builder,
  required isRequest,
  }) : super(
  future: future,
  initialData: initialData,
  builder: (context, snapshot) {
  print("MyFutureBuilder");
  if (snapshot.connectionState != ConnectionState.done ||!snapshot.hasData) {
  return Column(children: [Text("加载中",style: TextStyle(fontSize: 44),)],);
  }
  print("if1");
  if (isRequest) {
  List<dynamic> data = json.decode(snapshot.data.toString());
  success.clear();
  fail.clear();
  success.addAll(
  data.where((element) => element["code"] == 200).toList());
  fail.addAll(
  data.where((element) => element["code"] != 200).toList());
  }
  print("if2");

  return builder();
  });
}
