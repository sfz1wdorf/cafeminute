import 'package:cafeminute/API/utils.dart';
import 'package:cafeminute/news/news_view.dart';
import 'package:dio/dio.dart';
import 'package:easter_egg_trigger/easter_egg_trigger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

import 'API/initInventory.dart';
import 'schedule_page/schedule_view.dart';

class OpenView extends StatefulWidget {
  const OpenView({
    super.key,
  });

  @override
  State<OpenView> createState() => _OpenViewState();
}

class _OpenViewState extends State<OpenView> {
  @override
  Widget build(BuildContext context) {
    return EasterEggTrigger(
      action: () => dialogBox(),
      codes: const [
        EasterEggTriggers.SwipeLeft,
        EasterEggTriggers.SwipeUp,
        EasterEggTriggers.SwipeRight,
        EasterEggTriggers.SwipeDown,
      ],
      child: Stack(alignment: Alignment.bottomLeft, children: <Widget>[
        Image.asset(('assets/background_.jpeg'),
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height * 0.35) - 31,
            fit: BoxFit.cover),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (isConnected == true && schedule.runtimeType != DioError) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ScheduleView(
                            schedule: schedule.toString().split("◌◌◞◌◌◌"))),
                  );
                } else {
                  const snackBar = SnackBar(
                    content: Text('Keine Verbindung zum Server möglich!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        isopen == null
                            ? "..."
                            : isopen == true
                                ? "○ Geöffnet"
                                : "○ Geschlossen",
                        textScaleFactor: 1.7,
                        style: TextStyle(
                            color: isopen == null
                                ? darkmode
                                    ? Colors.white
                                    : Colors.black
                                : isopen == true
                                    ? Colors.green
                                    : const Color.fromARGB(255, 255, 0, 0),
                            fontWeight: FontWeight.w400),
                      ).frosted(
                        blur: 15,
                        frostColor:
                            darkmode ? Colors.black! : Colors.grey[100]!,
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.only(
                            left: 6, right: 6, top: 2, bottom: 2),
                      ))),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (isConnected == true) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const NewsView()),
                  );
                } else {
                  const snackBar = SnackBar(
                    content: Text('Keine Internetverbindung!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.newspaper,
                  color: darkmode ? Colors.white : Colors.grey[800],
                ).frosted(
                  blur: 15,
                  borderRadius: BorderRadius.circular(10),
                  frostColor: darkmode ? Colors.black! : Colors.grey[100]!,
                  padding:
                      EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  dialogBox() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => SizedBox(
                child: Dialog(
              shadowColor: Colors.green,
              surfaceTintColor: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Image.network(
                      "https://musicart.xboxlive.com/6/cfbfa561-0000-0000-0000-000000000009/504/image.jpg?w=1920&h=1080",
                      fit: BoxFit.fill,
                    )),
              ),
            )));
  }
}
