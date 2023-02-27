import 'package:flutter/material.dart';

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
    return Text("");}}