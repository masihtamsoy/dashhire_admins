import 'package:dash_widget/store/jobs_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Journey extends StatelessWidget {
  const Journey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Text(
              '${Provider.of<JobsStore>(context, listen: false).selectedJob}',
              style: const TextStyle(fontSize: 20),
            ));
  }
}
