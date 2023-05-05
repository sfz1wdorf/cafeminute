import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cafeminute/API/fetcher.dart';
import 'package:cafeminute/news/news_view.dart';
import 'package:cafeminute/product_view.dart';
import 'package:flutter/material.dart';
import 'API/initInventory.dart';
import "main_page.dart";
import 'API/nots.dart';

void main() async {
  await init();
  //print("start");
  runApp(Minute());
  initNots();
  getRegistrations();
}
var url = "http://minutebackend.hopto.org:1312";

class Minute extends StatefulWidget {
  const Minute({Key? key}) : super(key: key);

  @override
  State<Minute> createState() => _MinuteState();
}

class _MinuteState extends State<Minute> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        //term
      },
      child: MaterialApp(
        home: Material(child: Main()),
      ),
    );
  }
}
