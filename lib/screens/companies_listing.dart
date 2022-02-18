import 'dart:convert';

import 'package:dash_widget/dash_widget.dart';
import 'package:dash_widget/store/listing_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../store/dash_store.dart';
import 'package:supabase/supabase.dart' as supa;
import '../../common/constant.dart';
import '../components/simple_card_widget.dart';

class CompanyListingScreen extends StatefulWidget {
  // final String mode;
  // final String pushRouteName;
  // final String popRouteName;
  // final String title;

  CompanyListingScreen({
    Key? key,
    // this.mode = 'job',
    // this.pushRouteName = '',
    // this.popRouteName = '',
    // this.title = ''
  }) : super(key: key);

  @override
  _JobsCompanyListingScreenState createState() =>
      _JobsCompanyListingScreenState();
}

class _JobsCompanyListingScreenState extends State<CompanyListingScreen> {
  final client =
      supa.SupabaseClient(SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

  List candidates = [];
  Future<List> generateCompanies() async {
    /// TODO: this must come from frontend cache or less exhaustive DB query
    final selectResponse = await client.from('company').select('*').execute();

    String responseBody = "";
    if (selectResponse.error == null) {
      // print('response.data: ${selectResponse.data}');
      responseBody = json.encode(selectResponse.data);
    } else {
      responseBody = json.encode("[]");
    }

    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();

    candidates = list as List;
    return list as List;
  }

  int _getTotalJobs() {
    final totalJobs = candidates.length;

    return totalJobs;
  }

  _getCandidate(int index) {
    final job = candidates[index];

    return job;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: generateCompanies(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Companies'),
              ),
              body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _getTotalJobs(), // the length
                  itemBuilder: (context, index) {
                    String title =
                        _getCandidate(index)['company_name'] as String;

                    return Container(
                      child: SimpleCardWidget(
                          title: title,
                          onPressed: () => Navigator.pushNamed(context, '/is')),
                    );
                  }));
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // uid = FirebaseAuth.instance.currentUser.uid;
  }
}
