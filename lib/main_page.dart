import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cafeminute/API/nots.dart';
import 'package:cafeminute/openview.dart';
import 'package:cafeminute/product_view.dart';
import 'package:flutter/material.dart';

import 'API/initInventory.dart';
import 'main.dart';

class Main extends StatefulWidget {
  const Main({
    super.key,
  });

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    Timer RefreshTimer;
    //TODO rise Interval to higher number for production
    RefreshTimer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      init();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Spacer(),
        OpenView(),
        SizedBox(
          height: height * 0.65,
          width: width,
          child: ProductView(),
        ),
        Spacer()
      ],
    );
  }
}
