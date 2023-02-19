import 'package:auto_size_text/auto_size_text.dart';
import 'package:cafeminute/product_entry/product_entry.dart';
import 'package:flutter/material.dart';

import '../API/utils.dart';

class EntryImage extends StatelessWidget {
  const EntryImage({
    super.key,
    required this.widget,
  });

  final ProductEntry widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Image.network(
          widget.imageUrl.replaceAll(" ", ""),
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ));
  }
}

class EntryTitle extends StatelessWidget {
  const EntryTitle({
    super.key,
    required this.widget,
  });

  final ProductEntry widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AutoSizeText(
          "${unWhiteSpace(widget.title)}",
            maxLines: 2,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class EntryPrize extends StatelessWidget {
  const EntryPrize({
    super.key,
    required this.widget,
  });

  final ProductEntry widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: widget.sale.replaceAll(" ", "") == "nv"
          ? Text(
              widget.prize.replaceAll(" ", ""),
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
            )
          : RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                    fontSize: 19.0,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough),
                children: <TextSpan>[
                  new TextSpan(text: widget.prize),
                  new TextSpan(
                      text: widget.sale,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          fontSize: 19,
                          color: Colors.green)),
                ],
              ),
            ),
    );
  }
}

class EntryDescription extends StatelessWidget {
  const EntryDescription({
    super.key,
    required this.widget,
  });
  final ProductEntry widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: new Text(
        overflow: TextOverflow.ellipsis,
        "${unWhiteSpace(widget.description).toString().length > 35 ? unWhiteSpace(widget.description).toString().substring(0, 35) : unWhiteSpace(widget.description)}...",
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey),
      ),
    );
  }
}

class EntryAllergenics extends StatelessWidget {
  const EntryAllergenics({
    super.key,
    required this.widget,
  });

  final ProductEntry widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Visibility(
          visible: widget.allergenics.replaceAll(" ", "") != "nv",
          child: Column(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}
