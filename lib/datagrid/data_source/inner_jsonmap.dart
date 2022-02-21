import 'package:flutter/material.dart';

class InnerJsonMap extends StatefulWidget {
  InnerJsonMap({Key? key}) : super(key: key);

  @override
  State<InnerJsonMap> createState() => _InnerJsonMapState();
}

class _InnerJsonMapState extends State<InnerJsonMap> {
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String? _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Framwork'), // Not necessary for Option 1
      value: _selectedLocation,
      onChanged: (newValue) {
        setState(() {
          _selectedLocation = newValue as String;
        });
      },
      items: _locations.map((location) {
        return DropdownMenuItem(
          child: new Text(location),
          value: location,
        );
      }).toList(),
    );
  }
}
