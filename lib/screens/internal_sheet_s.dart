import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class InternalSheetS extends StatefulWidget {
  InternalSheetS({Key? key}) : super(key: key);

  @override
  State<InternalSheetS> createState() => _InternalSheetSState();
}

class _InternalSheetSState extends State<InternalSheetS> {
  List<Candidate> employees = <Candidate>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        source: employeeDataSource,

        /// expand tables, overflow-x
        columnWidthMode: ColumnWidthMode.auto,

        /// freeze
        frozenColumnsCount: 4,

        /// Editing
        allowEditing: true,
        selectionMode: SelectionMode.single,
        navigationMode: GridNavigationMode.cell,

        columns: <GridColumn>[
          GridColumn(
              columnName: 'mobile',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Mobile',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Name',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'dateAdded',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Date Added',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'dataSource',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Data Source',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Holding CTC',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Holding CTC',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Min Expected CTC',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Min Expected CTC',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Current CTC',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Current CTC',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Highest Degree',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Highest Degree',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Email',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Email',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Job Search Status',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Job Search Status',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Total Exp',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Total Exp',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Current Company Type',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Current Company Type',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Notice Period',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Notice Period',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Current Company',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Current Company',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Resume Link',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Resume Link',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Job Location',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Job Location',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Verified',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Verified',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Job Profile Search Type',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Job Profile Search Type',
                    overflow: TextOverflow.ellipsis,
                  ))),
        ],
      ),
    );
  }

  List<Candidate> getEmployeeData() {
    return [
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Candidate('8011230914', 'Masih', DateTime(2022), 'naukri'),
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Candidate {
  /// Creates the employee class with required details.
  Candidate(this.mobile, this.name, this.dateAdded, this.dataSource);

  String mobile;

  String name;

  DateTime dateAdded;

  String dataSource;

  int minExpectedCtc = 0;

  int holdingCtc = 0;

  int currentCtc = 0;

  String highestDegree = "";

  String jobProfileSearchType = "";

  bool verified = false;

  String jobLocation = "";

  String resumeLink = "";

  String currentCompany = "";

  int noticePeriod = 0;

  String currentCompanyType = "";

  int totalExp = 0;

  /// Dropdown
  String jobSearchStatus = "";

  String email = "";
}

// /// An object to set the employee collection data source to the datagrid. This
// /// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Candidate> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'mobile', value: e.mobile),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<DateTime>(
                  columnName: 'dateAdded', value: e.dateAdded),
              DataGridCell<String>(
                  columnName: 'dataSource', value: e.dataSource),
              DataGridCell<int>(columnName: 'Holding CTC', value: e.holdingCtc),
              DataGridCell<int>(
                  columnName: 'Min Expected CTC', value: e.minExpectedCtc),
              DataGridCell<int>(columnName: 'Current CTC', value: e.currentCtc),
              DataGridCell<String>(
                  columnName: 'Highest Degree', value: e.highestDegree),
              DataGridCell<String>(columnName: 'Email', value: e.email),
              DataGridCell<String>(
                  columnName: 'Job Search Status', value: e.jobSearchStatus),
              DataGridCell<int>(columnName: 'Total Exp', value: e.totalExp),
              DataGridCell<String>(
                  columnName: 'Current Company Type',
                  value: e.currentCompanyType),
              DataGridCell<int>(
                  columnName: 'Notice Period', value: e.noticePeriod),
              DataGridCell<String>(
                  columnName: 'Current Company', value: e.currentCompany),
              DataGridCell<String>(
                  columnName: 'Resume Link', value: e.resumeLink),
              DataGridCell<String>(
                  columnName: 'Job Location', value: e.jobLocation),
              DataGridCell<bool>(columnName: 'Verified', value: e.verified),
              DataGridCell<String>(
                  columnName: 'Job Profile Search Type',
                  value: e.jobProfileSearchType),
            ]))
        .toList();

    /// Helps to hold the new value of all editable widget.
    /// Based on the new value we will commit the new value into the corresponding
    /// DataGridCell on onCellSubmit method.
    dynamic newCellValue;

    /// Help to control the editable text in [TextField] widget.
    TextEditingController editingController = TextEditingController();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
