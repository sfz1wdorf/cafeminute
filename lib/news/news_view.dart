
import 'package:cafeminute/API/initInventory.dart';
import 'package:cafeminute/API/utils.dart';
import 'package:cafeminute/news/news_entry.dart';
import 'package:cafeminute/news/news_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../API/fetcher.dart';
import '../main.dart';
import '../product_entry/product_entry.dart';
import '../product_info/product_info.dart';
import '../product_view.dart';
class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}
List<String> registrations = [];
storeRegistrations() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('registrations', registrations);
  print(prefs.getStringList('registrations')!);
}
getRegistrations() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(await prefs.getStringList('registrations') != null){
  registrations = prefs.getStringList('registrations')!;
  }
}
class _NewsViewState extends State<NewsView> {
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
        title: const Text(
          "News",
          textScaleFactor: 1.2,
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.all(0),
            itemCount: newsIDs.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(fetchNewsInfo(newsIDs[index], url)[5]);
                  Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => NewsInfo(
                    content: fetchNewsInfo(newsIDs[index], url)[0],
                    contentRaw: fetchNewsInfo(newsIDs[index], url)[1],
                    date: fetchNewsInfo(newsIDs[index], url)[2],
                    heading: fetchNewsInfo(newsIDs[index], url)[3],
                    imageUrl: fetchNewsInfo(newsIDs[index], url)[4],
                    isevent: unWhiteSpace(fetchNewsInfo(newsIDs[index], url)[5]) == "true",
                    id: newsIDs[index]
                      )));
                },
                child: NewsEntry(
                    content: fetchNewsInfo(newsIDs[index], url)[0],
                    contentRaw: fetchNewsInfo(newsIDs[index], url)[1],
                    date: fetchNewsInfo(newsIDs[index], url)[2],
                    heading: fetchNewsInfo(newsIDs[index], url)[3],
                    imageUrl: fetchNewsInfo(newsIDs[index], url)[4],
                    isevent: unWhiteSpace(fetchNewsInfo(newsIDs[index], url)[5]) == "true",
                ),
              );
            },
          )
        );
  }
}
