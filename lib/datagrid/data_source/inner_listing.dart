import 'package:flutter/material.dart';

class InnerListing extends StatefulWidget {
  final List skillList;
  final mySubmitCell;

  InnerListing({Key? key, required this.skillList, required this.mySubmitCell})
      : super(key: key);

  @override
  State<InnerListing> createState() => _InnerListingState();
}

class _InnerListingState extends State<InnerListing> {
  // final items = List<String>.generate(100, (i) => 'Item ${i + 1}');
  // final items = widget.skillList.map((e) => null);

  Widget itemWidget({required String text, VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //widget that will be called on the ListView
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 15),
          ), //receiving the text
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onPressed, //receiving the function
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.skillList.map((x) => x['env']).toList();
    final yrs = widget.skillList.map((x) => x['exp']).toList();
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return itemWidget(
            text: "${items[index]} | ${yrs[index]}",
            onPressed: () {
              Map value = widget.skillList[index] as Map;
              print("index----$value");
              List skills = widget.skillList;
              skills.removeAt(index);

              // print(skills);

              widget.mySubmitCell(skills);
            },
          );
        },
      ),
    );
  }
}
