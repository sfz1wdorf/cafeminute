import 'package:cafeminute/API/initInventory.dart';
import 'package:flutter/material.dart';
var days = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag"];

class ScheduleView extends StatefulWidget{
  final List schedule;
  ScheduleView(
      {required this.schedule});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Öffnungszeiten",
            textScaleFactor: 1.2,
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),

      body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      
      child: ListView.builder(
          physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.all(0),
            itemCount: widget.schedule.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Divider(),
                  Container(
                  height: MediaQuery.of(context).size.height/12,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Center(child: Row(children: [Text(days[index], textScaleFactor: 1.2,)
                  ,Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.schedule[index], textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                  ])),
                  ),
                ],
              );
            
            }),
    )
);
  }
}