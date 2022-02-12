/// Packages import
import 'package:flutter/material.dart';

/// Local import
// import 'package:flutter_examples/model/sample_view.dart';
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

  List<GridColumn> getColumns() {
    List<GridColumn> columns;
    columns = <GridColumn>[
      // GridColumn(
      //   columnName: 'id',
      //   width: isWebOrDesktop ? 135 : 90,
      //   label: Container(
      //     padding: const EdgeInsets.all(8),
      //     alignment: Alignment.centerLeft,
      //     child: const Text(
      //       'ID',
      //       overflow: TextOverflow.clip,
      //       softWrap: true,
      //     ),
      //   ),
      // ),
      // GridColumn(
      //   columnName: 'contactName',
      //   width: 150,
      //   label: Container(
      //     padding: const EdgeInsets.all(8),
      //     alignment: Alignment.centerLeft,
      //     child: const Text(
      //       'Contact Name',
      //       overflow: TextOverflow.clip,
      //       softWrap: true,
      //     ),
      //   ),
      // ),
      // GridColumn(
      //   columnName: 'companyName',
      //   width: isWebOrDesktop ? 165 : 140,
      //   label: Container(
      //     padding: const EdgeInsets.all(8),
      //     alignment: Alignment.centerLeft,
      //     child: const Text(
      //       'Company',
      //       overflow: TextOverflow.clip,
      //       softWrap: true,
      //     ),
      //   ),
      // ),
      // GridColumn(
      //   columnName: 'city',
      //   width: isWebOrDesktop ? 150 : 120,
      //   label: Container(
      //     padding: const EdgeInsets.all(8),
      //     alignment: Alignment.centerLeft,
      //     child: const Text(
      //       'City',
      //       overflow: TextOverflow.clip,
      //       softWrap: true,
      //     ),
      //   ),
      // ),
      // GridColumn(
      //   columnName: 'country',
      //   width: isWebOrDesktop ? 150 : 120,
      //   label: Container(
      //     padding: const EdgeInsets.all(8),
      //     alignment: Alignment.centerLeft,
      //     child: const Text(
      //       'Country',
      //       overflow: TextOverflow.clip,
      //       softWrap: true,
      //     ),
      //   ),
      // ),
      // GridColumn(
      //   columnName: 'designation',
      //   width: 170,
      //   label: Container(
      //     padding: const EdgeInsets.all(8),
      //     alignment: Alignment.centerLeft,
      //     child: const Text(
      //       'Job Title',
      //       overflow: TextOverflow.clip,
      //       softWrap: true,
      //     ),
      //   ),
      // ),
      // GridColumn(
      //   columnName: 'postalCode',
      //   width: 110,
      //   label: Container(
      //     padding: const EdgeInsets.all(8),
      //     alignment: Alignment.centerLeft,
      //     child: const Text('Postal Code'),
      //   ),
      // ),
      GridColumn(
        columnName: 'phoneNumber',
        width: 150,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text('Phone?mobile Number'),
        ),
      )
    ];
    return columns;
  }

  @override
  void initState() {
    super.initState();
    // isWebOrDesktop = model.isWeb || model.isDesktop;
    isWebOrDesktop = true;
    jsonDataGridSource = ListingDataGridSource('JSON');
    print("jsonDataGridSource---${jsonDataGridSource}");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: Future<String>.delayed(
            const Duration(milliseconds: 500), () => 'Loaded'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print("build jsonDataGridSource---${jsonDataGridSource}");
          return jsonDataGridSource.employees.isEmpty
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
                  columns: getColumns());
        });
  }
}
