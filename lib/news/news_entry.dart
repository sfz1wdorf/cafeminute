import 'package:flutter/material.dart';

class NewsEntry extends StatefulWidget {
  final String title;
  final String prize;
  final String description;
  final String imageUrl;
  final String allergenics;
  final String sale;

 NewsEntry(
      {required this.title,
      required this.prize,
      required this.allergenics,
      required this.description,
      required this.sale,
      required this.imageUrl});

  @override
  State<NewsEntry> createState() => _NewsEntryState();
}

class _NewsEntryState extends State<NewsEntry> {
  @override
  Widget build(BuildContext context) {
    return Text("");}}