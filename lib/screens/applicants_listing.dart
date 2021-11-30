import 'package:dash_widget/dash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:dash_widget/store/jobs_store.dart';
import '../store/applications_store.dart';
import 'package:dash_widget/store/jobs_store.dart';

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
        title: const Text('Application'),
      ),
      body: Column(
        children: [
          Observer(
              builder: (_) => Text(
                    '${Provider.of<ApplicationStore>(context, listen: false).selectedItem}',
                    style: const TextStyle(fontSize: 30),
                  )),

          Observer(
              builder: (_) => Text(
                    '${Provider.of<JobsStore>(context, listen: false).selectedJob}',
                    style: const TextStyle(fontSize: 20),
                  )),

          // const JobStoreWidgetWrapper(),
          // const Text(
          //   'JobsStore value in example/main initial',
          // ),
          // Text(
          //   '${Provider.of<ApplicationStore>(context, listen: false).selectedItem}',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
          // Observer(
          //     builder: (_) => Text(
          //           '${Provider.of<JobsStore>(context, listen: false).value} dynamic Jobs store value in example/main',
          //           style: const TextStyle(fontSize: 40),
          //         )),
        ],
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
