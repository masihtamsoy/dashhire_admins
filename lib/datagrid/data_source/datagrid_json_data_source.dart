/// Dart import
import 'dart:convert';
import 'dart:core';

/// Packages import
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart' as supa;
import '../../common/constant.dart';
import 'package:provider/provider.dart';
import '../../store/datagrid_store.dart';

/// Local import
import '../data_source/listing_datagridsrouce.dart';
import '../widgets/datagrid_filter.dart';

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
import 'package:syncfusion_flutter_core/theme.dart';
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
    print("+++++++++++++++");
    print(Provider.of<DataGridStore>(context, listen: true).data);

    String responseBody = await SupaConstants.all_candidate();

    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();

    if (list != null && list.length != 0) {
      final Map<String, dynamic> myMap = list[0] as Map<String, dynamic>;
      myMap.forEach((k, v) {
        bool allowEditing = true;
        if (k == "id") {
          allowEditing = false;
        }
        gridColumn.add(
          GridColumn(
            visible: true,
            allowEditing: allowEditing,
            columnName: k,
            width: 120,
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
    await Future.delayed(const Duration(seconds: 3), () {});
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
                  appBar: AppBar(
                    title: const Text('Internal Sheet'),
                  ),
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                          ],
                        ),
                      ),
                      DataGridFilterWidget(
                          mySubmitCell: () {},
                          dataGridSource: jsonDataGridSource),
                      Expanded(
                        flex: 1,
                        child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                              headerColor: const Color(0xff009889)),
                          child: SfDataGrid(
                            key: _key,
                            gridLinesVisibility: GridLinesVisibility.both,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            source: jsonDataGridSource,
                            footerFrozenColumnsCount: 1,
                            frozenColumnsCount: 4,
                            allowEditing: true,
                            navigationMode: GridNavigationMode.cell,
                            selectionMode: SelectionMode.multiple,
                            // showCheckboxColumn: false,
                            controller: _dataGridController,
                            columns: gridColumn,

                            columnWidthMode: ColumnWidthMode.fill,
                            onQueryRowHeight: (details) {
                              return details.getIntrinsicRowHeight(
                                  details.rowIndex,
                                  canIncludeHiddenColumns: false);
                            },

                            allowSorting: true,
                            allowMultiColumnSorting: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        });
  }
}
