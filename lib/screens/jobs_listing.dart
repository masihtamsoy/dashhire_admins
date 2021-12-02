import 'package:dash_widget/dash_widget.dart';
import 'package:dash_widget/store/listing_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../store/dash_store.dart';

class JobsListingScreen extends StatefulWidget {
  @override
  _JobsListingScreenState createState() => _JobsListingScreenState();
}

class _JobsListingScreenState extends State<JobsListingScreen> {
  // job = Provider<context._jobsStore>.selectedItem
  // DashStore.selectJob(job);
  // DashStore.selectApplication(application);
  // String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListingUiStoreWizard(
                mode: "job",
                pushRouteName: '/application',
                getCallbackStore: () {
                  return Provider.of<DashStore>(context, listen: false);
                }
                // Provider.of<DashStore>(context, listen: false)
                ),
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
