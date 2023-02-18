import "package:cafeminute/product_view.dart";
import "package:flutter/material.dart";

class ProductEntry extends StatefulWidget {
  final String title;
  final String prize;
  final String description;
  final String imageUrl;
  final String allergenics;
  ProductEntry(
      {required this.title,
      required this.prize,
      required this.allergenics,
      required this.description,
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
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            height: 90,
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      widget.imageUrl.replaceAll(" ", ""),
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    )),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.3,
                      height: 45,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${UnWhiteSpace(widget.title)}",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              widget.prize.replaceAll(" ", ""),
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.3,
                      height: 43,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: new Text(
                              overflow: TextOverflow.ellipsis,
                              "${UnWhiteSpace(widget.description).toString().length > 44 ? UnWhiteSpace(widget.description).toString().substring(0, 40) : UnWhiteSpace(widget.description)}...",
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ),
                          Spacer(),
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Visibility(
                                visible:
                                    widget.allergenics.replaceAll(" ", "") !=
                                        "nv",
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ))
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
/*Row(
          children: [

            Row(
              children: [
                
                Spacer(),
                Row(
                  children: [
                    
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    widget.prize.replaceAll(" ", ""),
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.normal),
                  ),
                ),
                ,
              ],
            ),
          ],
        ),*/