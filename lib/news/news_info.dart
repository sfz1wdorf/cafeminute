import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

import 'news_entry.dart';

class NewsInfo extends StatefulWidget {
  final String content;
  final String contentRaw;
  final String date;
  final String imageUrl;
  final String heading;
 NewsInfo(
      {required this.content,
      required this.contentRaw,
      required this.date,
      required this.heading,
      required this.imageUrl});

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("News"),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height-56,
        width: MediaQuery.of(context).size.width,
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(widget.heading, textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),maxLines: 2,)),
            ),
                    Padding(
                padding: const EdgeInsets.only(left:7, bottom: 3),
                child: Align(alignment: Alignment.bottomLeft,
                child: Text(formatedDate(widget.date),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)
                ,
                ),
                ),
              )
,
            SizedBox(
                    height: MediaQuery.of(context).size.height-56,
        width: MediaQuery.of(context).size.width,
            child: Markdown(
                  selectable: true,
                  data: widget.content,
                  extensionSet: md.ExtensionSet(
            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
            [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
                  ),
            ),
          ),
          ],
          
        ),
      ),
    );}}