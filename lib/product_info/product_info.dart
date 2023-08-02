import 'package:cafeminute/product_info/product_info_components.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
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
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "100g dieses Produkts verglichen mit dem Tagesbedarf (15-19 Jahre):"),
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
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCalorieRequirement extends StatelessWidget {
  const InfoCalorieRequirement({
    super.key,
    required this.calories,
  });

  final String calories;

  @override
  Widget build(BuildContext context) {
    return Center(
        //progess bar
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FAProgressBar(
              currentValue:
                  matchedRequirements(int.parse(calories), true).toDouble(),
              displayText: "% (Mann)",
              progressColor: Colors.lightBlue),
        ),
        FAProgressBar(
            currentValue:
                matchedRequirements(int.parse(calories), false).toDouble(),
            displayText: "% (Frau)",
            progressColor: Colors.red),
      ],
    ));
  }
}

double matchedRequirements(int calories, bool male) {
  if (male == true) {
    return calories / 2500 * 100;
  } else {
    return calories / 2000 * 100;
  }
}
