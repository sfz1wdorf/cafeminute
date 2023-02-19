import 'package:cafeminute/product_info/product_info_components.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String prize;
  final String description;
  final String imageUrl;
  final String allergenics;
  final String sale;
  final String calories;
  ProductInfo(
      {required this.title,
      required this.prize,
      required this.allergenics,
      required this.description,
      required this.imageUrl,
      required this.sale,
      required this.calories});

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
          InfoDescription(description: description),
          Row(
            children: [
              InfoAllergenics(allergenics: allergenics),
              Spacer(),
              InfoPrize(sale: sale, prize: prize),
            ],
          ),
          InfoCalories(calories: calories),
        ],
      ),
    );
  }
}

class InfoCalories extends StatelessWidget {
  const InfoCalories({
    super.key,
    required this.calories,
  });

  final String calories;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 13, left: 13),
        child: RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              new TextSpan(text: 'Energie:'),
              new TextSpan(
                  text: "${calories}kcal",
                  style: new TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
