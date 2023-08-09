import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
var days = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag"];

class ScheduleView extends StatefulWidget{
  final List schedule;
  const ScheduleView(
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
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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

      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.52,
              width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.all(0),
                  itemCount: widget.schedule.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const Divider(),
                        Container(
                        height: MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Center(child: Row(children: [Text(days[index], textScaleFactor: 1.2,)
                        ,const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.schedule[index], textScaleFactor: 1.5,style: const TextStyle(fontWeight: FontWeight.bold),),
                        )
                        ])),
                        ),
                      ],
                    );

                  }),
          ),

          Row(
            children: [
               IconButton(icon:const Icon(Icons.mail, color: Colors.grey,), onPressed: () => launchUrl(Uri.parse('mailto:mail@lenblum.de?cc=urs.jokisch@freenet.de')),),
               IconButton(icon:const Icon(SimpleIcons.github, color: Colors.grey,), onPressed: () => launchUrl(Uri.parse('https://github.com/sfz1wdorf/cafeminute')),),
            ],
          ),
          GradientText("With ♥ by Nerdclub", colors:const [Colors.green, Colors.yellow], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    )
);
  }
}
