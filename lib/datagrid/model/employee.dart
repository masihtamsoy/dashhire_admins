import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);

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
