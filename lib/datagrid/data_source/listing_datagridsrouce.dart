/// Dart import
import 'dart:convert';

/// Package import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Local import
import '../model/listing.dart';

/// DataGrid import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Set employee's data collection to data grid source.
class ListingDataGridSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  ListingDataGridSource(String _sampleType) {
    if (_sampleType == 'JSON') {
      _populateData(_sampleType);
    }
  }

  Future<void> _populateData(String _sampleType) async {
    await _generateProductList();
    buildDataGridRow(_sampleType);
  }

  /// Instance of an employee.
  List<ListingSchema> employees = <ListingSchema>[];

  /// Instance of DataGridRow.
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  // Populate Data from the json file
  Future<void> _generateProductList() async {
    final String responseBody =
        await rootBundle.loadString('/candidate_data.json');
    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();
    employees = await list
        .map<ListingSchema>((dynamic json) =>
            ListingSchema.fromJson(json as Map<String, dynamic>))
        .toList() as List<ListingSchema>;
  }

  /// Building DataGridRows
  void buildDataGridRow(String _sampleType) {
    dataGridRows = employees.map<DataGridRow>((ListingSchema employee) {
      if (_sampleType == 'JSON') {
        return DataGridRow(cells: <DataGridCell<String>>[
          // DataGridCell<String>(columnName: 'id', value: employee.id),
          // DataGridCell<String>(
          //     columnName: 'contactName', value: employee.contactName),
          // DataGridCell<String>(
          //     columnName: 'companyName', value: employee.companyName),
          // DataGridCell<String>(columnName: 'city', value: employee.city),
          // DataGridCell<String>(columnName: 'country', value: employee.country),
          // DataGridCell<String>(
          //     columnName: 'designation', value: employee.designation),
          // DataGridCell<String>(
          //     columnName: 'postalCode', value: employee.postalCode),
          DataGridCell<String>(
              columnName: 'phoneNumber', value: employee.mobile),
        ]);
      } else {
        return DataGridRow(cells: <DataGridCell<String>>[
          // DataGridCell<String>(columnName: 'id', value: employee.id),
          // DataGridCell<String>(
          //     columnName: 'contactName', value: employee.contactName),
          // DataGridCell<String>(
          //     columnName: 'companyName', value: employee.companyName),
          // DataGridCell<String>(columnName: 'address', value: employee.address),
          // DataGridCell<String>(columnName: 'city', value: employee.city),
          // DataGridCell<String>(columnName: 'country', value: employee.country),
          // DataGridCell<String>(
          //     columnName: 'designation', value: employee.designation),
          // DataGridCell<String>(
          //     columnName: 'postalCode', value: employee.postalCode),
          DataGridCell<String>(
              columnName: 'phoneNumber', value: employee.mobile),
        ]);
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
