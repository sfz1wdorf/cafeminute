import 'package:flutter/material.dart';

class InfoPrize extends StatelessWidget {
  const InfoPrize({
    super.key,
    required this.sale,
    required this.prize,
  });

  final String sale;
  final String prize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: sale.replaceAll(" ", "") == "nv"
          ? Text(
              prize.replaceAll(" ", ""),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            )
          : RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                    fontSize: 21.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
                children: <TextSpan>[
                  new TextSpan(text: prize),
                  new TextSpan(
                      text: sale,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          fontSize: 21,
                          color: Colors.green)),
                ],
              ),
            ),
    );
  }
}

class InfoAllergenics extends StatelessWidget {
  const InfoAllergenics({
    super.key,
    required this.allergenics,
  });

  final String allergenics;

  @override
  Widget build(BuildContext context) {
    return Visibility(
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
                        fontWeight: FontWeight.normal, color: Colors.black)),
              ],
            ),
          ),
        ));
  }
}

class InfoDescription extends StatelessWidget {
  const InfoDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13, right: 13),
      child: Text(
        description,
        textScaleFactor: 1.1,
      ),
    );
  }
}
