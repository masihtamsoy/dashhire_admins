import 'package:flutter/material.dart';

class InnerListing extends StatefulWidget {
  final List skillList;
  InnerListing({Key? key, required this.skillList}) : super(key: key);

  @override
  State<InnerListing> createState() => _InnerListingState();
}

class _InnerListingState extends State<InnerListing> {
  // final items = List<String>.generate(100, (i) => 'Item ${i + 1}');
  // final items = widget.skillList.map((e) => null);

  @override
  Widget build(BuildContext context) {
    final items = widget.skillList.map((x) => x['env']).toList();
    final yrs = widget.skillList.map((x) => x['exp']).toList();
    return Container(
      height: 300.0, // Change as per your requirement
      width: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${items[index]} ---- ${yrs[index]}"),
          );
        },
      ),
    );
  }
}
