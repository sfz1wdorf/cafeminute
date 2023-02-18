import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String prize;
  final String description;
  final String imageUrl;
  final String allergenics;
  ProductInfo(
      {required this.title,
      required this.prize,
      required this.allergenics,
      required this.description,
      required this.imageUrl});

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
        title: Text(
          title,
          textScaleFactor: 1.2,
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 13, right: 13),
            child: Text(
              description,
              textScaleFactor: 1.1,
            ),
          ),
          Row(
            children: [
              Visibility(
                  visible: allergenics.replaceAll(" ", "") != "nv",
                  child: Padding(
                    padding: EdgeInsets.only(left: 13, right: 13),
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(155, 211, 1, 2),
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          new TextSpan(text: 'Allergene:'),
                          new TextSpan(
                              text: ' $allergenics',
                              style: new TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  )),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  prize.replaceAll(" ", ""),
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
