/// Dart import
import 'dart:convert';

/// Package import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../store/dash_store.dart';

import 'package:supabase/supabase.dart' as supa;
import '../../common/constant.dart';

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
    await getAtsConstants();
    buildDataGridRow(_sampleType);
  }

  /// Instance of an item.
  List<ListingSchema> items = <ListingSchema>[];
  List atsConstantItems = [];

  /// Instance of DataGridRow.
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  final client =
      supa.SupabaseClient(SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

  // Populate Data from the json file
  Future<void> generateItemList() async {
    // print("generateItemList-------");
    final selectResponse =
        await client.from('candidates_final').select('*').execute();

    String responseBody = "";
    if (selectResponse.error == null) {
      // print('response.data: ${selectResponse.data}');
      responseBody = json.encode(selectResponse.data);
    } else {
      responseBody = json.encode("[]");
    }

    // final String responseBody =
    //     await rootBundle.loadString('/candidate_data.json');
    final dynamic list =
        await json.decode(responseBody).cast<Map<String, dynamic>>();
    items = await list
        .map<ListingSchema>((dynamic json) =>
            ListingSchema.fromJson(json as Map<String, dynamic>))
        .toList() as List<ListingSchema>;
  }

  List<DataGridCell<dynamic>> generateDataGridCell(String jsonStr) {
    Map<String, dynamic> myMap = json.decode(jsonStr) as Map<String, dynamic>;
    // print("+++++${myMap}");
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
        // print("*********${item.metadata}");
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

  ///---------------
  /// Cell Edit

  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  bool canSubmitCell(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    // Return false, to retain in edit mode.
    return true; // or super.canSubmitCell(dataGridRow, rowColumnIndex, column);
  }

  RegExp _getRegExp(bool isNumericKeyBoard, String columnName) {
    return isNumericKeyBoard ? RegExp('[0-9]') : RegExp('[a-zA-Z ]');
  }

  /// Building a [TextField] for numeric and text column.
  Widget _buildTextFieldWidget(
      String displayText, GridColumn column, CellSubmit submitCell) {
    /// Define behaviour based on columnName
    final bool isTextAlignRight = column.columnName == 'Product No' ||
        column.columnName == 'Shipped Date' ||
        column.columnName == 'Price';

    final bool isNumericKeyBoardType =
        column.columnName == 'Product No' || column.columnName == 'Price';

    // Holds regular expression pattern based on the column type.
    final RegExp regExp = _getRegExp(isNumericKeyBoardType, column.columnName);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        expands: true,
        maxLines: null,
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isTextAlignRight ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        // keyboardAppearance: sampleModel.themeData.colorScheme.brightness,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        // style: textStyle,
        // cursorColor: sampleModel.backgroundColor,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(regExp)
        // ],
        keyboardType:
            isNumericKeyBoardType ? TextInputType.number : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericKeyBoardType) {
              newCellValue = column.columnName == 'Price'
                  ? double.parse(value)
                  : int.parse(value);
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          /// Call [CellSubmit] callback to fire the canSubmitCell and
          /// onCellSubmit to commit the new value in single place.
          submitCell();
        },
      ),
    );
  }

  /// Building a [DropDown] for combo box column.
  Widget _buildDropDownWidget(String? displayText, CellSubmit submitCell,
      List<String> dropDownMenuItems) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: DropdownButton<String>(
          value: displayText,
          autofocus: true,
          focusColor: Colors.transparent,
          underline: const SizedBox.shrink(),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          isExpanded: true,
          // style: textStyle,
          onChanged: (String? value) {
            newCellValue = value;

            /// Call [CellSubmit] callback to fire the canSubmitCell and
            /// onCellSubmit to commit the new value in single place.
            submitCell();
          },
          items:
              dropDownMenuItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(fontSize: 14)),
            );
          }).toList()),
    );
  }

  Future<void> getAtsConstants() async {
    final selectResponse =
        await client.from('ats_constants').select('*').execute();

    String responseBody = "";
    if (selectResponse.error == null) {
      // print('response.data: ${selectResponse.data}');
      responseBody = json.encode(selectResponse.data);
    } else {
      responseBody = json.encode("[]");
    }

    atsConstantItems = await json.decode(responseBody) as List;
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    final bool isNumericType =
        column.columnName == 'id' || column.columnName == 'salary';

    // Holds regular expression pattern based on the column type.
    final RegExp regExp = _getRegExp(isNumericType, column.columnName);

    // Loop over ats_constants to know about fields, in case field_type is defined
    // as dropdown render _buildDropDownWidget
    List<String> options = [];
    atsConstantItems.forEach((x) {
      if (column.columnName == x['field_name']) {
        if (x['field_type'] == 'dropdown') {
          List metadata = x['metadata'] as List;
          options = metadata.map((x) => x['name'] as String).toList();
        }
      }
    });

    if (options.length != 0) {
      String mutantDisplayText = displayText;

      /// There should be value from option to see dropdown widget
      if (displayText == null || displayText == "") {
        options.add('none');
        mutantDisplayText = 'none';
      }
      return _buildDropDownWidget(mutantDisplayText, submitCell, options);
    } else {
      return _buildTextFieldWidget(displayText, column, submitCell);
    }
  }

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) async {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value ??
        '';

    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    /// reflect new values at cell
    String currentColumnName = dataGridRows[dataRowIndex]
        .getCells()[rowColumnIndex.columnIndex]
        .columnName;

    dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
        DataGridCell(columnName: currentColumnName, value: newCellValue);

    /// In order to update data to DB
    /// Collect id >> Hardcoded to column 0
    var id = dataGridRows[dataRowIndex].getCells()[0].value;

    final updateResponse = await client
        .from("candidates_final")
        .update({currentColumnName: newCellValue})
        .eq('id', id)
        .execute();

    if (updateResponse.error == null) {
      // print('response.data: ${updateResponse.data}');
    } else {
      /// Handle error better
      print('Error');
      // print('>>>>>>>>>>>>>>>>>>>updateResponse.error: ${updateResponse.error}');
      // FocusScope.of(context).unfocus();
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(updateResponse.error.message)));
    }
  }
}
