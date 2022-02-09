import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeX {
  EmployeeX(this.id, this.name, this.designation, this.salary);

  ///
  int id;

  ///
  String name;

  ///
  String designation;

  ///
  int salary;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell<int>(columnName: 'id', value: id),
      DataGridCell<String>(columnName: 'name', value: name),
      DataGridCell<String>(columnName: 'designation', value: designation),
      DataGridCell<int>(columnName: 'salary', value: salary),
    ]);
  }
}

class Employee {
  /// Creates the employee class with required details.
  Employee(this.mobile, this.name, this.dateAdded, this.dataSource,
      this.highestDegree);

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

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell<String>(columnName: 'mobile', value: mobile),
      DataGridCell<String>(columnName: 'name', value: name),
      DataGridCell<DateTime>(columnName: 'dateAdded', value: dateAdded),
      DataGridCell<String>(columnName: 'dataSource', value: dataSource),
      DataGridCell<int>(columnName: 'Holding CTC', value: holdingCtc),
      DataGridCell<int>(columnName: 'Min Expected CTC', value: minExpectedCtc),
      DataGridCell<int>(columnName: 'Current CTC', value: currentCtc),
      DataGridCell<String>(columnName: 'Highest Degree', value: highestDegree),
      DataGridCell<String>(columnName: 'Email', value: email),
      DataGridCell<String>(
          columnName: 'Job Search Status', value: jobSearchStatus),
      DataGridCell<int>(columnName: 'Total Exp', value: totalExp),
      DataGridCell<String>(
          columnName: 'Current Company Type', value: currentCompanyType),
      DataGridCell<int>(columnName: 'Notice Period', value: noticePeriod),
      DataGridCell<String>(
          columnName: 'Current Company', value: currentCompany),
      DataGridCell<String>(columnName: 'Resume Link', value: resumeLink),
      DataGridCell<String>(columnName: 'Job Location', value: jobLocation),
      DataGridCell<bool>(columnName: 'Verified', value: verified),
      DataGridCell<String>(
          columnName: 'Job Profile Search Type', value: jobProfileSearchType),
    ]);
  }
}
