import 'package:auto_size_text/auto_size_text.dart';
import 'package:cafeminute/API/fetcher.dart';
import 'package:cafeminute/news/news_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

import '../API/utils.dart';
import '../main.dart';
import 'news_entry.dart';

class NewsInfo extends StatefulWidget {
  final String content;
  final String contentRaw;
  final String date;
  final String imageUrl;
  final String heading;
  final bool isevent;
  final String id;
  NewsInfo(
      {required this.content,
      required this.contentRaw,
      required this.date,
      required this.heading,
      required this.id,
      required this.isevent,
      required this.imageUrl});

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
  @override
  Widget build(BuildContext context) {
    var isChanged = registrations.contains(widget.id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: darkmode ? Colors.white : Colors.black),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("News",
            style: TextStyle(color: darkmode ? Colors.white : Colors.black)),
        backgroundColor: darkmode ? Colors.grey[900] : Colors.white,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 56,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: widget.isevent
                      ? AutoSizeText(
                          widget.heading + " - Aktion",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkmode ? Colors.white : Colors.black),
                          maxLines: 2,
                        )
                      : AutoSizeText(
                          widget.heading,
                          textScaleFactor: 1.5,
                          style: TextStyle(fontWeight: FontWeight.bold, color: darkmode ? Colors.white : Colors.black),
                          maxLines: 2,
                        )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, bottom: 3),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Text(
                      formatedDate(widget.date),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Spacer(),
                    Visibility(
                      visible: widget.isevent,
                      child: Text(
                        "An Aktion teilnehmen",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: darkmode ? Colors.white : Colors.black),
                      ),
                    ),
                    Visibility(
                      visible: widget.isevent,
                      child: Checkbox(
                        value: isChanged,
                        shape:  CircleBorder(
                        ),
                          side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color:darkmode ? Colors.white : Colors.black),
  ),

                        checkColor: Colors.green,
                        activeColor: darkmode ? Colors.grey[900] : Colors.white,
                        onChanged: (bool? value) async {
                          var addpart;
                          if (value != false) {
                            addpart = await getHttp(
                                "$url/addparticipant",
                                FormData.fromMap({
                                  "pswd":
                                      "123",
                                  "id": "${widget.id}"
                                }),
                                "PATCH");
                            registrations.add(widget.id);
                            storeRegistrations();
                          } else {
                            addpart = await getHttp(
                                "$url/removeparticipant",
                                FormData.fromMap({
                                  "pswd":
                                      "123",
                                  "id": "${widget.id}"
                                }),
                                "PATCH");
                            registrations.remove(widget.id);
                            storeRegistrations();
                          }
                          if (addpart.toString == "sucess") {}
                          setState(() {
                            isChanged = value!;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 56,
              width: MediaQuery.of(context).size.width,
              child: Markdown(
                selectable: true,
                data: widget.content,
                styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                    textTheme: TextTheme(
                        bodyMedium: TextStyle(
                            fontSize: 17.0,
                            color: darkmode ? Colors.white : Colors.black),
                        bodyLarge: TextStyle(
                            fontSize: 21.0,
                            color: darkmode ? Colors.white : Colors.white),
                        bodySmall: TextStyle(
                            fontSize: 15.0,
                            color: darkmode ? Colors.white : Colors.white)))),
                extensionSet: md.ExtensionSet(
                  md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                  [
                    md.EmojiSyntax(),
                    ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
