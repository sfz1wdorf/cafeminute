import 'package:easter_egg_trigger/easter_egg_trigger.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

import 'API/initInventory.dart';

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
        Image.network(
            'https://www.coffeeshopibiza.com/wp-content/uploads/2021/09/Coffee-shop.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            fit: BoxFit.cover),
        Row(
          children: [
            Align(
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
                              ? Colors.black
                              : isopen == true
                                  ? Colors.green
                                  : const Color.fromARGB(255, 255, 0, 0),
                          fontWeight: FontWeight.w400),
                    ).frosted(
                      blur: 15,
                      borderRadius: BorderRadius.circular(10),
                      padding:
                          EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                    ))),
            Spacer(),
            GestureDetector(
              onTap: () => debugPrint("coming soon"),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.newspaper).frosted(
                  blur: 15,
                  borderRadius: BorderRadius.circular(10),
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
