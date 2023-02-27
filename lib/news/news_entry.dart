import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NewsEntry extends StatefulWidget {
  final String content;
  final String contentRaw;
  final String date;
  final String imageUrl;
  final String heading;
 NewsEntry(
      {required this.content,
      required this.contentRaw,
      required this.date,
      required this.heading,
      required this.imageUrl});

  @override
  State<NewsEntry> createState() => _NewsEntryState();
}

class _NewsEntryState extends State<NewsEntry> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                    color: Colors.transparent,
                    
),
                borderRadius: BorderRadius.circular(19.0),
                    boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]


       ),
        height: MediaQuery.of(context).size.width*0.85,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(19),     
          child: Column(
           children: [
            SizedBox(
            height: MediaQuery.of(context).size.width*0.85*0.5,
            width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imageUrl.replaceAll(" ", ""),
              fit: BoxFit.fill,
              ),),
              Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(widget.heading, textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),maxLines: 2,)),
              Align(
                alignment: Alignment.centerLeft,
                child: widget.contentRaw.length > 400 ? AutoSizeText(
                  widget.contentRaw.substring(0,399)+"..." + "",
                  maxLines: 10,
                  minFontSize: 14,
                ):AutoSizeText(
                  widget.contentRaw,
                  maxLines: 10,
                  minFontSize: 14,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left:7, bottom: 3),
                child: Align(alignment: Alignment.bottomLeft,
                child: Text(formatedDate(widget.date),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)
                ,
                ),
                ),
              )
           ],
          ),
        ),
    
      ),
    );}}

    formatedDate(date){
      date = date.replaceAll(" ","");
      var year = date.substring(0,4);
      var month = date.substring(5,7);
      var day = date.substring(8,10);
      return (day + "." + month + "." + year);

    }