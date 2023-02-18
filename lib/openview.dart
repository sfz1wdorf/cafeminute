import 'package:cafeminute/product_view.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

import 'initInventory.dart';

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
    return Stack(alignment: Alignment.bottomLeft, children: <Widget>[
      Image.network(
          'https://www.coffeeshopibiza.com/wp-content/uploads/2021/09/Coffee-shop.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          fit: BoxFit.cover),
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
                padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
              ))),
    ]);
  }
}
