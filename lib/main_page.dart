import 'dart:async';

import 'package:cafeminute/API/nots.dart';
import 'package:cafeminute/openview.dart';
import 'package:cafeminute/product_view.dart';
import 'package:flutter/material.dart';
import 'API/initInventory.dart';

class Main extends StatefulWidget {
  const Main({
    super.key,
  });

  @override
  State<Main> createState() => _MainState();
}

final TextEditingController editingController = TextEditingController();

class _MainState extends State<Main> {
  @override
  void initState() {
    Timer RefreshTimer;
    //TODO rise Interval to higher number for production
    RefreshTimer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      init();
      setState(() {});
    }  );
    RefreshTimer = Timer.periodic(const Duration(seconds: 60), (Timer t) {
        sendNotifications();
    }  );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Spacer(),
        OpenView(),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  height: MediaQuery.of(context).size.height * 0.057,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: TextField(
                        controller: editingController,
                        cursorColor: Colors.grey,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        onChanged: (value) {
                          productIDSorted = productIDSortedUpdate(
                              productIDs, editingController.text);
                          setState(() {});
                        },
                        decoration:const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: "Suche",
                            hintStyle: TextStyle(fontSize: 20),
                            border: InputBorder.none),
                      ),
                    ),
                  )),
            )),
        SizedBox(
          height: height * (0.65 - 0.077),
          width: width,
          child: ProductView(),
        ),
        const Spacer()
      ],
    );
  }
}

/*
class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  //@override
  //Widget build(BuildContext context) {
    //return
  }
}
*/
