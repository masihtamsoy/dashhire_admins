import 'package:flutter/material.dart';
import 'package:dash_widget/dash_widget.dart';

class AdminListing extends StatefulWidget {
  AdminListing({Key? key}) : super(key: key);

  @override
  _AdminListingState createState() => _AdminListingState();
}

class _AdminListingState extends State<AdminListing> {
  void _onPressed() {
    Navigator.pushNamed(context, '/calling_page');
    // Make api call to get test json, given by candidate
    // _companyTestStore.getTestSubmitted('mobile', 'jobId');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RoundedButtonWidget(
              buttonText: "Dashhire Portal",
              onPressed: () => Navigator.pushNamed(context, '/job')),
          RoundedButtonWidget(
              buttonText: "Calling Sheet",
              onPressed: () => Navigator.pushNamed(context, '/calling_page')),
          RoundedButtonWidget(
              buttonText: "Client Sheet",
              onPressed: () => Navigator.pushNamed(context, '/client_page')),
        ],
      ),
    );
  }
}
