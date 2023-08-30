import 'package:cafeminute/news/news_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'API/initInventory.dart';
import 'API/utils.dart';
import "main_page.dart";
import 'API/nots.dart';

void main() async {
  await init();
  //print("start");
  runApp(Minute());
  getRegistrations();
}

var url = "http://localhost:1312";

class Minute extends StatefulWidget {
  const Minute({Key? key}) : super(key: key);

  @override
  State<Minute> createState() => _MinuteState();
}

class _MinuteState extends State<Minute> {
  @override
  void initState() {
    super.initState();
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    darkmode = brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        //term
      },
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor:
                darkmode ? Color.fromARGB(255, 48, 48, 48) : Colors.white),
        home: Material(child: Main()),
      ),
    );
  }
}
