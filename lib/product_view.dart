import 'dart:io';

import 'package:cafeminute/product_info/product_info.dart';
import 'package:cafeminute/product_entry/product_entry.dart';
import 'package:flutter/material.dart';

import 'API/fetcher.dart';

var url = "http://192.168.178.61:1312";

class ProductView extends StatefulWidget {
  const ProductView({
    super.key,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: productIDs.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductInfo(
                      allergenics: fetchProductInfo(productIDs[index], url)[5],
                      prize: fetchProductInfo(productIDs[index], url)[2],
                      sale: fetchProductInfo(productIDs[index], url)[6],
                      description: fetchProductInfo(productIDs[index], url)[7],
                      imageUrl: fetchProductInfo(productIDs[index], url)[4],
                      title: fetchProductInfo(productIDs[index], url)[1],
                      calories: fetchProductInfo(productIDs[index], url)[3],
                    )),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: ProductEntry(
            allergenics: fetchProductInfo(productIDs[index], url)[5],
            prize: fetchProductInfo(productIDs[index], url)[2],
            sale: fetchProductInfo(productIDs[index], url)[6],
            description: fetchProductInfo(productIDs[index], url)[7],
            imageUrl: fetchProductInfo(productIDs[index], url)[4],
            title: fetchProductInfo(productIDs[index], url)[1],
          ),
        );
      },
    );
  }
}

List<String> productIDs = [];
