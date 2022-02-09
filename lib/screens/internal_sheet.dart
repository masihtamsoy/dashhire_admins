import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../datagrid/datasource/employee_datasource.dart';
import '../datagrid/model/employee.dart';

class InternalSheetS extends StatefulWidget {
  InternalSheetS({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InternalSheetS> {
  late EmployeeDataSource _employeeDataSource;
  List<Employee> _employees = <Employee>[];
  late DataGridController _dataGridController;

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SfDataGrid Editing'),
      ),
      body: SfDataGrid(
        source: _employeeDataSource,

        /// freeze
        frozenColumnsCount: 4,

        allowEditing: true,
        selectionMode: SelectionMode.single,
        navigationMode: GridNavigationMode.cell,
        columnWidthMode: ColumnWidthMode.auto,
        controller: _dataGridController,
        columns: [
          GridColumn(
              columnName: 'mobile',
              allowEditing: false,
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
              allowEditing: false,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Date Added',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'dataSource',
              allowEditing: false,
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

  List<Employee> getEmployeeData() {
    return [
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      Employee('8011230914', 'Masih', DateTime(2022), 'naukri'),
      // Employee(10001, 'James', 'Project Lead', 20000),
      // Employee(10002, 'Kathryn', 'Manager', 30000),
      // Employee(10003, 'Lara', 'Developer', 15000),
      // Employee(10004, 'Michael', 'Designer', 15000),
      // Employee(10005, 'Martin', 'Developer', 15000),
      // Employee(10006, 'Newberry', 'Developer', 15000),
      // Employee(10007, 'Balnc', 'Developer', 15000),
      // Employee(10008, 'Perry', 'Developer', 15000),
      // Employee(10009, 'Gable', 'Developer', 15000),
      // Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}
