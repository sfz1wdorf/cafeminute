import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cafeminute/API/fetcher.dart';
import 'package:cafeminute/product_view.dart';
import 'package:flutter/material.dart';
import 'API/initInventory.dart';
import "main_page.dart";
import 'API/nots.dart';

void main() async {
  await init();
  runApp(Minute());
  //initNots();
}

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
        print("out");
      },
      child: MaterialApp(
        home: Material(child: Main()),
      ),
    );
  }
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
