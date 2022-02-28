import 'dart:convert';

import 'package:supabase/supabase.dart' as supa;
import '../../common/constant.dart';

import 'package:mobx/mobx.dart';

part 'datagrid_store.g.dart';

class DataGridStore = DataGridStoreBase with _$DataGridStore;

abstract class DataGridStoreBase with Store {
  final client =
      supa.SupabaseClient(SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

  /// data = [{},{},{}]
  @observable
  List? data;

  /// verified set filterData, find name from filterData
  @observable
  List? filterData;

  @action
  void setData(List items) {
    data = items;
  }

  @action
  void setFilterData(List items) {
    filterData = items;
  }

  @action
  Future<void> generateData(String tableName) async {
    final selectResponse = await client.from(tableName).select('*').execute();

    String responseBody = "";
    if (selectResponse.error == null) {
      // print('response.data: ${selectResponse.data}');
      responseBody = json.encode(selectResponse.data);
    } else {
      responseBody = json.encode("[]");
    }

    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();

    data = list as List;
    // print("data---------$data");
  }
}
