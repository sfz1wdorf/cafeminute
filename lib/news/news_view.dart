
import 'package:cafeminute/API/initInventory.dart';
import 'package:flutter/material.dart';

import '../API/fetcher.dart';
import '../product_entry/product_entry.dart';
import '../product_info/product_info.dart';
import '../product_view.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
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
            itemCount: productIDs.length,
            itemBuilder: (context, index) {
              return ProductEntry(
                  allergenics: fetchProductInfo(productIDs[index], url)[5],
                  prize: fetchProductInfo(productIDs[index], url)[2],
                  sale: fetchProductInfo(productIDs[index], url)[6],
                  description: fetchProductInfo(productIDs[index], url)[7],
                  imageUrl: fetchProductInfo(productIDs[index], url)[4],
                  title: fetchProductInfo(productIDs[index], url)[1],
              );
            },
          )
        );
  }
}
