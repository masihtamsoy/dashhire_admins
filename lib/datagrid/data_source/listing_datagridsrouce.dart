/// Dart import
import 'dart:convert';

/// Package import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Local import
import '../model/listing.dart';

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Set item's data collection to data grid source.
class ListingDataGridSource extends DataGridSource {
  /// Creates the item data source class with required details.
  ListingDataGridSource(String _sampleType) {
    if (_sampleType == 'JSON') {
      _populateData(_sampleType);
    }
  }

  Future<void> _populateData(String _sampleType) async {
    await generateItemList();
    buildDataGridRow(_sampleType);
  }

  /// Instance of an item.
  List<ListingSchema> items = <ListingSchema>[];

  /// Instance of DataGridRow.
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  // Populate Data from the json file
  Future<void> generateItemList() async {
    final String responseBody =
        await rootBundle.loadString('/candidate_data.json');
    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();
    items = await list
        .map<ListingSchema>((dynamic json) =>
            ListingSchema.fromJson(json as Map<String, dynamic>))
        .toList() as List<ListingSchema>;

    // print("*********${items}");
  }

  List<DataGridCell<dynamic>> generateDataGridCell(String jsonStr) {
    Map<String, dynamic> myMap = json.decode(jsonStr) as Map<String, dynamic>;
    print("+++++${myMap}");
    List<DataGridCell<dynamic>> dataCell = [];
    myMap.forEach((k, v) {
      dataCell.add(DataGridCell(columnName: k, value: v));
    });
    return dataCell;
  }

  /// Building DataGridRows
  void buildDataGridRow(String _sampleType) {
    dataGridRows = items.map<DataGridRow>((ListingSchema item) {
      if (_sampleType == 'JSON') {
        print("*********${item.metadata}");
        String jsonStr = json.encode(item.metadata);
        List<DataGridCell<dynamic>> dataGridCells =
            generateDataGridCell(jsonStr);
        return DataGridRow(cells: dataGridCells);
      } else {
        return const DataGridRow(cells: <DataGridCell<String>>[]);
      }
    }).toList();
  }

  // Overrides
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((DataGridCell dataCell) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Text(dataCell.value.toString()),
      );
    }).toList());
  }
}
