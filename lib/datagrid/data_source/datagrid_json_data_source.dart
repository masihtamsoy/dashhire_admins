/// Dart import
import 'dart:convert';
import 'dart:core';

/// Packages import
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart' as supa;
import '../../common/constant.dart';

/// Local import
import '../data_source/listing_datagridsrouce.dart';

// // Platform specific import
// import '../../common/export/save_file_mobile.dart'
//     if (dart.library.html) '../../common/export/save_file_web.dart' as helper;
import '../../common/export/save_file_web.dart' as helper;

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart'
    hide Alignment, Column, Row, Border;

/// Renders column type data grid
class JsonDataSourceDataGrid extends StatefulWidget {
  /// Creates column type data grid
  const JsonDataSourceDataGrid({Key? key}) : super(key: key);

  @override
  _JsonDataSourceDataGridState createState() => _JsonDataSourceDataGridState();
}

class _JsonDataSourceDataGridState extends State {
  /// DataGridSource Required for SfDataGrid to obtain the row data.
  late ListingDataGridSource jsonDataGridSource;

  late bool isWebOrDesktop;

  Widget sampleWidget() => const JsonDataSourceDataGrid();

  List<GridColumn> gridColumn = [];

  final client =
      supa.SupabaseClient(SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

  Future<List<GridColumn>> generateColumnList() async {
    // print("generateItemList-------");
    final selectResponse =
        await client.from('candidates').select('*').execute();

    String responseBody = "";
    if (selectResponse.error == null) {
      // print('response.data: ${selectResponse.data}');
      responseBody = json.encode(selectResponse.data);
    } else {
      responseBody = json.encode("[]");
    }

    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();

    // print("------$list");

    // final String responseBody =
    //     await rootBundle.loadString('/candidate_data.json');
    // final dynamic list =
    //     await json.decode(responseBody).cast<Map<String, dynamic>>();

    if (list != null && list.length != 0) {
      final Map<String, dynamic> myMap = list[0] as Map<String, dynamic>;
      myMap.forEach((k, v) {
        bool visible = true;
        // if (k == "id" || k == "inserted_at" || k == "updated_at") {
        //   visible = false;
        // }
        gridColumn.add(
          GridColumn(
            visible: visible,
            columnName: k,
            // width: isWebOrDesktop ? 135 : 90,
            label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                k,
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            ),
          ),
        );
      });
    }

    /// Changing seconds effect render
    /// TODO: work on this issue
    await Future.delayed(const Duration(seconds: 4), () {});
    // print("generateColumnList------------------");

    // setState(() {});
    return gridColumn;
  }

  List<GridColumn> getColumns() {
    final List<GridColumn> columns = generateColumnList() as List<GridColumn>;
    return columns;
  }

  @override
  void initState() {
    super.initState();
    // isWebOrDesktop = model.isWeb || model.isDesktop;
    isWebOrDesktop = true;
    jsonDataGridSource = ListingDataGridSource('JSON');
  }

  final DataGridController _dataGridController = DataGridController();

  Future<void> _exportDataGridToExcel() async {
    final Workbook workbook = _key.currentState!
        .exportToExcelWorkbook(rows: _dataGridController.selectedRows);

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    await helper.saveAndLaunchFile(bytes, 'DataGrid.xlsx');
  }

  final _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: generateColumnList(),
        // future: Future<String>.delayed(
        //     const Duration(milliseconds: 500), () => 'Loaded'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // print("-----------$jsonDataGridSource");
          return jsonDataGridSource.items.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                )
              : Scaffold(
                  body: Column(
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 150.0,
                        child: MaterialButton(
                            color: Colors.blue,
                            child: const Center(
                                child: Text(
                              'Export to Excel',
                              style: TextStyle(color: Colors.white),
                            )),
                            onPressed: _exportDataGridToExcel),
                      ),
                      // FormBuilder(
                      //     key: _formKey,
                      //     child: Row(
                      //       children: [
                      //         Container(
                      //           width: 100,
                      //           child: FormBuilderTextField(
                      //             name: 'ctc',
                      //             decoration: InputDecoration(
                      //               labelText: 'CTC',
                      //             ),
                      //             keyboardType: TextInputType.number,
                      //           ),
                      //         ),
                      //         SizedBox(width: 20),
                      //         Container(
                      //           width: 100,
                      //           child: FormBuilderTextField(
                      //             name: 'env',
                      //             decoration: InputDecoration(
                      //               labelText: 'Environment',
                      //             ),
                      //             keyboardType: TextInputType.text,
                      //           ),
                      //         ),
                      //         SizedBox(width: 20),
                      //         Container(
                      //           width: 100,
                      //           child: FormBuilderTextField(
                      //             name: 'exp',
                      //             decoration: InputDecoration(
                      //               labelText: 'Experience',
                      //             ),
                      //             keyboardType: TextInputType.number,
                      //           ),
                      //         ),
                      //         SizedBox(width: 20),
                      //         TextButton(
                      //             child: const Text('Filter'),
                      //             onPressed: () {
                      //               if (_formKey.currentState
                      //                       ?.saveAndValidate() ??
                      //                   false) {
                      //                 print(_formKey.currentState?.fields);
                      //               }
                      //               // _employees.add(Employee(10011, 'Steve', 'Designer', 15000));
                      //               // _employeeDataSource.buildDataGridRows();
                      //               // _employeeDataSource.updateDataGridSource();
                      //             }),
                      //       ],
                      //     )),
                      SfDataGrid(
                          key: _key,
                          // gridLinesVisibility: GridLinesVisibility.both,
                          // headerGridLinesVisibility: GridLinesVisibility.both,
                          source: jsonDataGridSource,
                          // frozenColumnsCount: 5,
                          allowEditing: true,
                          navigationMode: GridNavigationMode.cell,
                          selectionMode: SelectionMode.multiple,
                          // showCheckboxColumn: false,
                          controller: _dataGridController,
                          columns: gridColumn),
                    ],
                  ),
                );
        });
  }
}
