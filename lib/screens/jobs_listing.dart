import 'package:dash_widget/dash_widget.dart';
import 'package:dash_widget/store/listing_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../store/dash_store.dart';

class ListingScreen extends StatefulWidget {
  final String mode;
  final String pushRouteName;

  ListingScreen(
      {Key? key, this.mode = 'job', this.pushRouteName = '/application'})
      : super(key: key);

  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
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
              mode: widget.mode,
              pushRouteName: widget.pushRouteName,
              getCallbackStore: () {
                return Provider.of<DashStore>(context, listen: false);
              },

              /// Write comment
              dependencyState: widget.mode == "candidate"
                  ? Provider.of<DashStore>(context, listen: false)
                      .companyRoleSelected
                  : null,
              // Provider.of<DashStore>(context, listen: false)
            ),
            // const Text(
            //   'JobsStore value in example/main initial',
            // ),
            Text(
              '${Provider.of<ListingStore>(context, listen: false).data}',
            ),
            // Observer(
            //     builder: (_) => Text(
            //           '${Provider.of<JobsStore>(context, listen: false).data} dynamic Jobs store value in example/main',
            //           style: const TextStyle(fontSize: 40),
            //         )),
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
