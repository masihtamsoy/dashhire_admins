import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../model/employee.dart';

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this._employees) {
    dataGridRows = _employees
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }

  List<Employee> _employees = [];

  List<DataGridRow> dataGridRows = [];

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: (dataGridCell.columnName == 'mobile' ||
                  dataGridCell.columnName == 'name')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
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

    // if (column.columnName == 'mobile') {
    //   dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
    //       DataGridCell<int>(columnName: 'mobile', value: newCellValue as String);
    //   _employees[dataRowIndex].mobile = newCellValue as String;
    // }
    if (column.columnName == 'name') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: 'name', value: newCellValue as String);
      _employees[dataRowIndex].name = newCellValue.toString();
    } else if (column.columnName == 'Highest Degree') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: 'Highest Degree', value: newCellValue as String);
      _employees[dataRowIndex].highestDegree = newCellValue.toString();
    }
    // else {
    //   dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
    //       DataGridCell<int>(columnName: 'salary', value: newCellValue as int);
    //   _employees[dataRowIndex].salary = newCellValue as int;
    // }
  }

  @override
  bool canSubmitCell(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    // Return false, to retain in edit mode.
    return true; // or super.canSubmitCell(dataGridRow, rowColumnIndex, column);
  }

  /// Building a [DropDown] for combo box column.
  Widget _buildDropDownWidget(String? displayText, CellSubmit submitCell,
      List<String> dropDownMenuItems) {
    print("------here-----${dropDownMenuItems}");
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
              child: Text(value),
            );
          }).toList()),
    );
  }

  /// Building a [TextField] for numeric and text column.
  Widget _buildTextFieldWidget(
      String displayText, GridColumn column, CellSubmit submitCell) {
    final bool isTextAlignRight = column.columnName == 'Product No' ||
        column.columnName == 'Shipped Date' ||
        column.columnName == 'Price';

    final bool isNumericKeyBoardType =
        column.columnName == 'Product No' || column.columnName == 'Price';

    // Holds regular expression pattern based on the column type.
    final RegExp regExp = _getRegExp(isNumericKeyBoardType, column.columnName);

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment:
          isTextAlignRight ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
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
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(regExp)
        ],
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

    if (column.columnName == 'Highest Degree') {
      return _buildDropDownWidget(displayText, submitCell, _shipCountry);
    } else {
      return _buildTextFieldWidget(displayText, column, submitCell);
    }

    // return Container(
    //   padding: const EdgeInsets.all(8.0),
    //   alignment: isNumericType ? Alignment.centerRight : Alignment.centerLeft,
    //   child: TextField(
    //     autofocus: true,
    //     controller: editingController..text = displayText,
    //     textAlign: isNumericType ? TextAlign.right : TextAlign.left,
    //     autocorrect: false,
    //     decoration: InputDecoration(
    //       contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
    //     ),
    //     inputFormatters: <TextInputFormatter>[
    //       FilteringTextInputFormatter.allow(regExp)
    //     ],
    //     keyboardType: isNumericType ? TextInputType.number : TextInputType.text,
    //     onChanged: (String value) {
    //       if (value.isNotEmpty) {
    //         if (isNumericType) {
    //           newCellValue = int.parse(value);
    //         } else {
    //           newCellValue = value;
    //         }
    //       } else {
    //         newCellValue = null;
    //       }
    //     },
    //     onSubmitted: (String value) {
    //       print("----MAKE API call TO SUPABASE when ENTER clicked----${value}");

    //       /// Call [CellSubmit] callback to fire the canSubmitCell and
    //       /// onCellSubmit to commit the new value in single place.
    //       submitCell();
    //     },
    //   ),
    // );
  }

  RegExp _getRegExp(bool isNumericKeyBoard, String columnName) {
    return isNumericKeyBoard ? RegExp('[0-9]') : RegExp('[a-zA-Z ]');
  }

  final List<String> _shipCountry = <String>[
    'Argentina',
    'Austria',
    'Belgium',
    'Brazil',
    'Canada',
    'Denmark',
    'Finland',
    'France',
    'Germany',
    'Ireland',
    'Italy',
    'Mexico',
    'Norway',
    'Poland',
    'Portugal',
    'Spain',
    'Sweden',
    'UK',
    'USA',
  ];
}
