/// Dart import
import 'dart:convert';

/// Packages import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Local import
import '../data_source/listing_datagridsrouce.dart';

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
  Future generateColumnList() async {
    final String responseBody =
        await rootBundle.loadString('/candidate_data.json');
    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();

    if (list[0] != null) {
      final Map<String, dynamic> myMap = list[0] as Map<String, dynamic>;
      myMap.forEach((k, v) {
        gridColumn.add(
          GridColumn(
            columnName: k,
            width: isWebOrDesktop ? 135 : 90,
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: generateColumnList(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return jsonDataGridSource.items.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                )
              : SfDataGrid(
                  source: jsonDataGridSource,
                  frozenColumnsCount: 1,
                  allowEditing: true,
                  navigationMode: GridNavigationMode.cell,
                  selectionMode: SelectionMode.single,
                  columns: gridColumn);
        });
  }
}
