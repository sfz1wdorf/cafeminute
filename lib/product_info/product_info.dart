import 'package:cafeminute/product_info/product_info_components.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter/material.dart';

import '../API/utils.dart';

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
          icon: Icon(Icons.arrow_back_ios,
              color: darkmode ? Colors.white : Colors.black),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: TextStyle(color: darkmode ? Colors.white : Colors.black),
          textScaleFactor: 1.2,
        ),
        backgroundColor: darkmode ? Colors.grey[900] : Colors.white,
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
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "100g dieses Produkts verglichen mit dem Tagesbedarf (15-19 Jahre):",
                style: TextStyle(color: darkmode ? Colors.white : Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0, bottom: 8, left: 16.0, right: 16.0),
            child: InfoCalorieRequirement(calories: calories),
          ),
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
          text: TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              const TextSpan(text: 'Energie:'),
              TextSpan(
                  text: "${calories}kcal",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: darkmode ? Colors.white : Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
