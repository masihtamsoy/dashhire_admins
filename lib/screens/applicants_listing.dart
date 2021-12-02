import 'package:dash_widget/dash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:dash_widget/store/jobs_store.dart';
import '../store/dash_store.dart';

class ApplicationsListingScreen extends StatefulWidget {
  @override
  _ApplicationsListingScreenState createState() =>
      _ApplicationsListingScreenState();
}

class _ApplicationsListingScreenState extends State<ApplicationsListingScreen> {
  // String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, '/job', (route) => false),
        ),
        title: Text("Application"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListingUiStoreWizard(
                dependencyState:
                    Provider.of<DashStore>(context, listen: false).jobSelected,
                mode: "application",
                pushRouteName: '/job',
                getCallbackStore: () {
                  return Provider.of<DashStore>(context, listen: false);
                }),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // uid = FirebaseAuth.instance.currentUser.uid;
  }
}
