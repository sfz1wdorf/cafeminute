import "package:flutter/material.dart";
import "package:cafeminute/product_entry/product_entry_components.dart";

import "../API/utils.dart";

class ProductEntry extends StatefulWidget {
  final String title;
  final String prize;
  final String description;
  final String imageUrl;
  final String allergenics;
  final String sale;

  ProductEntry(
      {required this.title,
      required this.prize,
      required this.allergenics,
      required this.description,
      required this.sale,
      required this.imageUrl});

  @override
  State<ProductEntry> createState() => _ProductEntryState();
}

class _ProductEntryState extends State<ProductEntry> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
            decoration: BoxDecoration(
                color: darkmode
                    ? Colors.grey[900]
                    : Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: darkmode != null && darkmode
                      ? Colors.transparent!
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: darkmode ? Colors.grey[900]! : Colors.grey[400]!,
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            height: 90,
            child: Row(
              children: [
                EntryImage(widget: widget),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.3,
                      height: 45, //TODO: FIX FOMRATTING EVERYWHERE
                      child: Row(
                        children: [
                          EntryTitle(widget: widget),
                          const Spacer(),
                          EntryPrize(widget: widget),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.3,
                      height: 43,
                      child: Row(
                        children: [
                          EntryDescription(widget: widget),
                          const Spacer(),
                          EntryAllergenics(widget: widget)
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [Row(), Row()],
                )
              ],
            )));
  }
}
