import 'dart:io';

import 'package:cafeminute/product_info.dart';
import 'package:cafeminute/product_entry.dart';
import 'package:flutter/material.dart';

import 'fetcher.dart';

var url = "http://192.168.178.32:1312";

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
          child: ProductEntry(
            allergenics: fetchProductInfo(productIDs[index], url)[5],
            prize: fetchProductInfo(productIDs[index], url)[2],
            sale: fetchProductInfo(productIDs[index], url)[6],
            description: fetchProductInfo(productIDs[index], url)[7],
            imageUrl: fetchProductInfo(productIDs[index], url)[4],
            title: fetchProductInfo(productIDs[index], url)[1],
          ),
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
        );
      },
    );
  }
}

List<String> productIDs = [];

UnWhiteSpace(String stringToCheck) {
  return reverse(UnWhiteSpaceSub(reverse(UnWhiteSpaceSub(stringToCheck))));
}

UnWhiteSpaceSub(String stringToCheck) {
  var finished = false;
  while (finished == false) {
    if (stringToCheck[0].toString() == " ") {
      stringToCheck = stringToCheck.toString().substring(1);
    } else {
      break;
    }
  }
  return stringToCheck;
}

String reverse(String s) {
  var sb = new StringBuffer();

  var i = s.length - 1;

  while (i >= 3) {
    sb.writeCharCode(s.codeUnitAt(i - 0));
    sb.writeCharCode(s.codeUnitAt(i - 1));
    sb.writeCharCode(s.codeUnitAt(i - 2));
    sb.writeCharCode(s.codeUnitAt(i - 3));
    i -= 4;
  }

  while (i >= 0) {
    sb.writeCharCode(s.codeUnitAt(i));
    i -= 1;
  }

  return sb.toString();
}
